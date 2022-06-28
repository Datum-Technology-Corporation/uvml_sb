// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_BASE_TEST_SV__
`define __UVMT_SB_ST_BASE_TEST_SV__


/**
 * Abstract component from which all other Scoreboarding Library test cases must ultimately extend.
 */
class uvmt_sb_st_base_test_c extends uvm_test;
   
   // Objects
   rand uvmt_sb_st_test_cfg_c    test_cfg; ///< 
   rand uvml_sb_simplex_cfg_c    sb_cfg  ; ///< 
        uvml_sb_simplex_cntxt_c  sb_cntxt; ///< 
        uvml_logs_rs_text_c      rs      ; ///< 
   
   // Components
   uvmt_sb_st_vsqr_c                          vsequencer; ///< 
   uvml_sb_simplex_c#(uvmt_sb_st_seq_item_c)  sb        ; ///< 
   
   // Handle to clock generation interface
   virtual uvmt_sb_st_clknrst_gen_if  clknrst_gen_vif; ///< 
   
   
   `uvm_component_utils_begin(uvmt_sb_st_base_test_c)
      `uvm_field_object(test_cfg , UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   // Additional, temporary constraints to get around known design bugs/constraints
   `include "uvmt_sb_st_base_test_workarounds.sv"
   
   constraint sb_cfg_cons {
      sb_cfg.mode == test_cfg.sb_mode;
   }
   
   
   /**
    * Replaces default report server with rs.
    */
   extern function new(string name="uvmt_sb_st_base_test", uvm_component parent=null);
   
   /**
    * 1. Builds test_cfg & env_cfg via create_cfg()
    * 2. Randomizes entire test class via randomize_test()
    * 3. Passes env_cfg to env via uvm_config_db via assign_cfg()
    * 4. Builds env_cntxt via create_cntxt()
    * 5. Passes env_cntxt to env using UVM Configuration Database via assign_cntxt()
    * 6. Builds env via create_env()
    * 7. Builds the rest of the components/objects via create_components()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * 1. Assigns environment's virtual sequencer handle to vsequencer.
    * 2. Add register callback (reg_cbs) to all registers & fields.
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * 1. Triggers the start of clock generation via start_clk()
    * 2. Starts the simulation timeout via simulation_timeout()
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * Asserts & de-asserts reset via clknrst_vif.
    */
   extern virtual task reset_phase(uvm_phase phase);
   
   /**
    * Prints out start of phase banners.
    */
   extern virtual function void phase_started(uvm_phase phase);
   
   /**
    * Indicates to the test bench (uvmt_sb_st_tb) that the test has completed.
    * This is done by checking the properties of the phase argument.
    */
   extern virtual function void phase_ended(uvm_phase phase);
   
   /**
    * Retrieves clknrst_gen_vif from UVM configuration database.
    */
   extern function void retrieve_clknrst_gen_vif();
   
   /**
    * Creates test_cfg and env_cfg.
    */
   extern function void create_cfg();
   
   /**
    * 1. Calls test_cfg's process_cli_args()
    * 2. Calls randomize on 'this' and fatals out if it fails.
    */
   extern function void randomize_test();
   
   /**
    * Configures uvml_default_hrtbt_monitor.
    */
   extern function void cfg_hrtbt_monitor();
   
   /**
    * Assigns environment configuration (env_cfg) handle to environment (env) using UVM Configuration Database.
    */
   extern function void assign_cfg();
   
   /**
    * Creates env_cntxt.
    */
   extern function void create_cntxt();
   
   /**
    * Assigns environment context (env_cntxt) handle to environment (env) using UVM Configuration Database.
    */
   extern function void assign_cntxt();
   
   /**
    * Creates additional (non-environment) components (and objects).
    */
   extern function void create_components();
   
   /**
    * Prints overlined and underlined text in uppercase.
    */
   extern function void print_banner(string text);
   
   /**
    * Starts clock generation via clknrst_gen_vif functions.
    */
   extern task start_clk();
   
endclass : uvmt_sb_st_base_test_c


function uvmt_sb_st_base_test_c::new(string name="uvmt_sb_st_base_test", uvm_component parent=null);
   
   super.new(name, parent);
   
   rs = new("rs");
   uvm_report_server::set_server(rs);
   
endfunction : new


function void uvmt_sb_st_base_test_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   retrieve_clknrst_gen_vif();
   create_cfg              ();
   randomize_test          ();
   cfg_hrtbt_monitor       ();
   assign_cfg              ();
   create_cntxt            ();
   assign_cntxt            ();
   create_components       ();
   
endfunction : build_phase


function void uvmt_sb_st_base_test_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   vsequencer.actual_ap  .connect(sb.act_export);
   vsequencer.expected_ap.connect(sb.exp_export);
   
endfunction : connect_phase


task uvmt_sb_st_base_test_c::run_phase(uvm_phase phase);
   
   super.run_phase(phase);
   start_clk();
   
endtask : run_phase


task uvmt_sb_st_base_test_c::reset_phase(uvm_phase phase);
   
   super.reset_phase(phase);
   
   `uvm_info("TEST", $sformatf("Asserting reset for %0t", (test_cfg.reset_period * 1ns)), UVM_NONE)
   clknrst_gen_vif.assert_reset();
   `uvml_hrtbt()
   #(test_cfg.reset_period * 1ns);
   clknrst_gen_vif.deassert_reset();
   `uvml_hrtbt()
   `uvm_info("TEST", "De-asserted reset", UVM_NONE)
   
endtask : reset_phase


function void uvmt_sb_st_base_test_c::phase_started(uvm_phase phase);
   
   super.phase_started(phase);
   print_banner($sformatf("start of %s phase", phase.get_name()));
   
endfunction : phase_started


function void uvmt_sb_st_base_test_c::phase_ended(uvm_phase phase);
   
   super.phase_ended(phase);
   
   if (phase.is(uvm_final_phase::get())) begin
      uvm_config_db#(bit)::set(null, "", "sim_finished", 1);
      print_banner("test finished");
   end
   
endfunction : phase_ended


function void uvmt_sb_st_base_test_c::retrieve_clknrst_gen_vif();
   
   if (!uvm_config_db#(virtual uvmt_sb_st_clknrst_gen_if)::get(this, "", "clknrst_gen_vif", clknrst_gen_vif)) begin
      `uvm_fatal("TEST", $sformatf("Could not find clknrst_gen_vif handle of type %s in uvm_config_db", $typename(clknrst_gen_vif)))
   end
   else begin
      `uvm_info("TEST", $sformatf("Found clknrst_gen_vif handle of type %s in uvm_config_db", $typename(clknrst_gen_vif)), UVM_DEBUG)
   end
   
endfunction : retrieve_clknrst_gen_vif


function void uvmt_sb_st_base_test_c::create_cfg();
   
   test_cfg = uvmt_sb_st_test_cfg_c::type_id::create("test_cfg");
   sb_cfg   = uvml_sb_simplex_cfg_c::type_id::create("sb_cfg"  );
   
endfunction : create_cfg


function void uvmt_sb_st_base_test_c::randomize_test();
   
   test_cfg.process_cli_args();
   if (!this.randomize()) begin
      `uvm_fatal("TEST", "Failed to randomize test");
   end
   `uvm_info("TEST", $sformatf("Test configuration:\n%s", test_cfg.sprint()), UVM_NONE)
   `uvm_info("TEST", $sformatf("Scoreboard configuration:\n%s", sb_cfg.sprint()), UVM_NONE)
   
endfunction : randomize_test


function void uvmt_sb_st_base_test_c::cfg_hrtbt_monitor();
   
   `uvml_hrtbt_set_cfg(startup_timeout , test_cfg.startup_timeout)
   `uvml_hrtbt_set_cfg(heartbeat_period, test_cfg.heartbeat_period)
   `uvml_watchdog_set_cfg(timeout, test_cfg.simulation_timeout)
   
endfunction : cfg_hrtbt_monitor


function void uvmt_sb_st_base_test_c::assign_cfg();
   
   uvm_config_db#(uvmt_sb_st_test_cfg_c)::set(this, "*", "cfg", test_cfg);
   uvm_config_db#(uvml_sb_simplex_cfg_c        )::set(this, "*", "cfg", sb_cfg  );
   
endfunction : assign_cfg


function void uvmt_sb_st_base_test_c::create_cntxt();
   
   sb_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("sb_cntxt");
   
endfunction : create_cntxt


function void uvmt_sb_st_base_test_c::assign_cntxt();
   
   uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "*", "cntxt", sb_cntxt);
   
endfunction : assign_cntxt


function void uvmt_sb_st_base_test_c::create_components();
   
   vsequencer = uvmt_sb_st_vsqr_c                        ::type_id::create("vsequencer", this);
   sb         = uvml_sb_simplex_c#(uvmt_sb_st_seq_item_c)::type_id::create("sb"        , this);
   
endfunction : create_components


function void uvmt_sb_st_base_test_c::print_banner(string text);
   
   $display("");
   $display("*******************************************************************************");
   $display(text.toupper());
   $display("*******************************************************************************");
   
endfunction : print_banner


task uvmt_sb_st_base_test_c::start_clk();
   
   clknrst_gen_vif.set_clk_period(test_cfg.clk_period);
   clknrst_gen_vif.start_clk();
   
endtask : start_clk


`endif // __UVMT_SB_ST_BASE_TEST_SV__

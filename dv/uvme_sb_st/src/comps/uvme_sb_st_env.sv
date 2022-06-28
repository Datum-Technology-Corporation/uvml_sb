// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_SB_ST_ENV_SV__
`define __UVME_SB_ST_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other
 * the Moore.io UVM Scoreboarding Library environment components.
 */
class uvme_sb_st_env_c extends uvm_env;
   
   // Objects
   uvme_sb_st_cfg_c    cfg;
   uvme_sb_st_cntxt_c  cntxt;
   
   // Agents
   uvma_sb_agent_c  abc_agent;
   uvma_sb_agent_c  def_agent;
   
   // Components
   uvme_sb_st_cov_model_c  cov_model;
   uvme_sb_st_prd_c        predictor;
   uvml_sb_simplex_c            sb;
   uvme_sb_st_vsqr_c       vsequencer;
   
   
   `uvm_component_utils_begin(uvme_sb_st_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_sb_st_env", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null
    * 2. Retrieves cntxt.clk_vif from UVM configuration database via retrieve_clk_vif()
    * 3. Assigns cfg and cntxt handles via assign_cfg() & assign_cntxt()
    * 4. Builds all components via create_<x>()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * 1. Connects agents to predictor via connect_predictor()
    * 2. Connects predictor & agents to scoreboard via connect_scoreboard()
    * 3. Assembles virtual sequencer handles via assemble_vsequencer()
    * 4. Connects agents to coverage model via connect_coverage_model()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   extern function void assign_cfg();
   
   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   extern function void assign_cntxt();
   
   /**
    * Creates agent components.
    */
   extern function void create_agents();
   
   /**
    * Creates additional (non-agent) environment components (and objects).
    */
   extern function void create_env_components();
   
   /**
    * Creates environment's virtual sequencer.
    */
   extern function void create_vsequencer();
   
   /**
    * Creates environment's coverage model.
    */
   extern function void create_cov_model();
   
   /**
    * Connects agents to predictor.
    */
   extern function void connect_predictor();
   
   /**
    * Connects scoreboards components to agents/predictor.
    */
   extern function void connect_scoreboard();
   
   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   extern function void assemble_vsequencer();
   
   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   extern function void connect_coverage_model();
   
endclass : uvme_sb_st_env_c


`pragma protect begin


function uvme_sb_st_env_c::new(string name="uvme_sb_st_env", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_sb_st_env_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_sb_st_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   else begin
      `uvm_info("CFG", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end
   
   if (cfg.enabled) begin
      void'(uvm_config_db#(uvme_sb_st_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (!cntxt) begin
         `uvm_info("CNTXT", "Context handle is null; creating.", UVM_DEBUG)
         cntxt = uvme_sb_st_cntxt_c::type_id::create("cntxt");
      end
      
      assign_cfg           ();
      assign_cntxt         ();
      create_agents        ();
      create_env_components();
      
      if (cfg.is_active) begin
         create_vsequencer();
      end
      
      if (cfg.cov_model_enabled) begin
         create_cov_model();
      end
   end
   
endfunction : build_phase


function void uvme_sb_st_env_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      if (cfg.scoreboarding_enabled) begin
         connect_predictor ();
         connect_scoreboard();
      end
      
      if (cfg.is_active) begin
         assemble_vsequencer();
      end
      
      if (cfg.cov_model_enabled) begin
         connect_coverage_model();
      end
   end
   
endfunction: connect_phase


function void uvme_sb_st_env_c::assign_cfg();
   
   uvm_config_db#(uvme_sb_st_cfg_c)::set(this, "*"              , "cfg", cfg              );
   uvm_config_db#(uvma_sb_cfg_c   )::set(this, "abc_agent", "cfg", cfg.abc_cfg);
   uvm_config_db#(uvma_sb_cfg_c   )::set(this, "def_agent", "cfg", cfg.def_cfg);
   uvm_config_db#(uvml_sb_cfg_c        )::set(this, "sb"             , "cfg", cfg.sb_cfg       );
   
endfunction: assign_cfg


function void uvme_sb_st_env_c::assign_cntxt();
   
   uvm_config_db#(uvme_sb_st_cntxt_c)::set(this, "*"              , "cntxt", cntxt                );
   uvm_config_db#(uvma_sb_cntxt_c   )::set(this, "abc_agent", "cntxt", cntxt.abc_cntxt);
   uvm_config_db#(uvma_sb_cntxt_c   )::set(this, "def_agent", "cntxt", cntxt.def_cntxt);
   uvm_config_db#(uvml_sb_cntxt_c        )::set(this, "sb"             , "cntxt", cntxt.sb_cntxt       );
   
endfunction: assign_cntxt


function void uvme_sb_st_env_c::create_agents();
   
   abc_agent = uvma_sb_agent_c::type_id::create("abc_agent", this);
   def_agent = uvma_sb_agent_c::type_id::create("def_agent", this);
   
endfunction: create_agents


function void uvme_sb_st_env_c::create_env_components();
   
   if (cfg.scoreboarding_enabled) begin
      predictor = uvme_sb_st_prd_c::type_id::create("predictor", this);
      sb        = uvml_sb_simplex_c    ::type_id::create("sb"       , this);
   end
   
endfunction: create_env_components


function void uvme_sb_st_env_c::create_vsequencer();
   
   vsequencer = uvme_sb_st_vsqr_c::type_id::create("vsequencer", this);
   
endfunction: create_vsequencer


function void uvme_sb_st_env_c::create_cov_model();
   
   cov_model = uvme_sb_st_cov_model_c::type_id::create("cov_model", this);
   
endfunction: create_cov_model


function void uvme_sb_st_env_c::connect_predictor();
   
   // Connect agent -> predictor
   abc_agent.mon_ap.connect(predictor.in_export);
   
endfunction: connect_predictor


function void uvme_sb_st_env_c::connect_scoreboard();
   
   // Connect agent -> scoreboard
   def_agent.mon_ap.connect(sb.act_export);
   
   // Connect predictor -> scoreboard
   predictor.out_ap.connect(sb.exp_export);
   
endfunction: connect_scoreboard


function void uvme_sb_st_env_c::assemble_vsequencer();
   
   vsequencer.abc_sequencer = abc_agent.sequencer;
   
endfunction: assemble_vsequencer


function void uvme_sb_st_env_c::connect_coverage_model();
   
   abc_agent.drv_ap.connect(cov_model.abc_seq_item_export);
   abc_agent.mon_ap.connect(cov_model.abc_mon_trn_export );
   def_agent.mon_ap.connect(cov_model.def_mon_trn_export );
   
endfunction: connect_coverage_model


`pragma protect end


`endif // __UVME_SB_ST_ENV_SV__

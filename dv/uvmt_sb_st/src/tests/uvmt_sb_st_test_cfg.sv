// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_TEST_CFG_SV__
`define __UVMT_SB_ST_TEST_CFG_SV__


/**
 * Object encapsulating configuration parameters common to most if not all tests extending from uvmt_sb_st_base_test_c.
 */
class uvmt_sb_st_test_cfg_c extends uvm_object;
   
   // Knobs
   rand int unsigned       clk_period        ; ///<  Specified in picoseconds (ps)
   rand int unsigned       reset_period      ; ///<  Specified in nanoseconds (ns)
   rand int unsigned       startup_timeout   ; ///<  Specified in nanoseconds (ns)
   rand int unsigned       heartbeat_period  ; ///<  Specified in nanoseconds (ns)
   rand int unsigned       simulation_timeout; ///<  Specified in nanoseconds (ns)
   rand uvml_sb_mode_enum  sb_mode           ; ///< 
   rand int unsigned       num_actual_items  ; ///< 
   rand int unsigned       num_expected_items; ///< 
   
   // Command line arguments
   // TODO Add command line argument descriptors
   //      Ex: string        cli_num_pkts_str      = "NPKTS";
   //          bit           cli_num_pkts_override = 0;
   //          int unsigned  cli_num_pkts_parsed;
   
   
   `uvm_object_utils_begin(uvmt_sb_st_test_cfg_c)
      `uvm_field_int (                   clk_period        , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                   reset_period      , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                   startup_timeout   , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                   heartbeat_period  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                   simulation_timeout, UVM_DEFAULT + UVM_DEC)
      `uvm_field_enum(uvml_sb_mode_enum, sb_mode           , UVM_DEFAULT          )
      `uvm_field_int (                   num_actual_items  , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int (                   num_expected_items, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft clk_period         == uvmt_sb_st_default_clk_period        ;
      soft reset_period       == uvmt_sb_st_default_reset_period      ;
      soft startup_timeout    == uvmt_sb_st_default_startup_timeout   ;
      soft heartbeat_period   == uvmt_sb_st_default_heartbeat_period  ;
      soft simulation_timeout == uvmt_sb_st_default_simulation_timeout;
   }
   
   constraint limits_cons {
      num_actual_items   <= 100;
      num_expected_items <= 100;
      num_actual_items   > 0;
      num_expected_items > 0;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_test_cfg");
   
   /**
    * TODO Describe uvmt_sb_st_test_cfg_c::process_cli_args()
    */
   extern function void process_cli_args();
   
endclass : uvmt_sb_st_test_cfg_c


function uvmt_sb_st_test_cfg_c::new(string name="uvmt_sb_st_test_cfg");
   
   super.new(name);
   
endfunction : new


function void uvmt_sb_st_test_cfg_c::process_cli_args();
   
   // TODO Process command line arguments
   //      Ex: string  cli_num_pkts_parsed_str  = "";
   //          if (uvm_cmdline_proc.get_arg_value({"+", cli_num_pkts_str, "="}, cli_num_pkts_parsed_str)) begin
   //             if (cli_num_pkts_parsed_str != "") begin
   //                cli_num_pkts_override = 1;
   //                cli_num_pkts_parsed = cli_num_pkts_parsed_str.atoi();
   //             end
   //             else begin
   //                cli_num_pkts_override = 0;
   //             end
   //          end
   //          else begin
   //             cli_num_pkts_override = 0;
   //          end
   
endfunction : process_cli_args


`endif // __UVMT_SB_ST_TEST_CFG_SV__

// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_SQR_SV__
`define __UVMT_SB_ST_SQR_SV__


/**
 * TODO Describe uvmt_sb_st_sqr_c
 */
class uvmt_sb_st_sqr_c extends uvml_sqr_c#(
   .REQ(uvmt_sb_st_seq_item_c),
   .RSP(uvmt_sb_st_seq_item_c)
);
   
   // Objects
   uvmt_sb_st_test_cfg_c  cfg; ///< 
   
   
   `uvm_component_utils_begin(uvmt_sb_st_sqr_c)
      `uvm_field_object(cfg, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_sqr", uvm_component parent=null);
   
   /**
    * TODO Describe uvmt_sb_st_sqr_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
endclass : uvmt_sb_st_sqr_c


function uvmt_sb_st_sqr_c::new(string name="uvmt_sb_st_sqr", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvmt_sb_st_sqr_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvmt_sb_st_test_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
endfunction : build_phase


`endif // __UVMT_SB_ST_SQR_SV__

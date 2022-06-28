// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_SB_ST_VSQR_SV__
`define __UVME_SB_ST_VSQR_SV__


/**
 * Component on which all the Moore.io UVM Scoreboarding Library VIP Self-Test
 * virtual sequences are run.
 */
class uvme_sb_st_vsqr_c extends uvm_sequencer#(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   // Objects
   uvme_sb_st_cfg_c    cfg;
   uvme_sb_st_cntxt_c  cntxt;
   
   // Sequencer handles
   uvma_sb_sqr_c  abc_sequencer;
   
   
   `uvm_component_utils_begin(uvme_sb_st_vsqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_sb_st_sqr", uvm_component parent=null);
   
   /**
    * Ensures cfg & cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
endclass : uvme_sb_st_vsqr_c


`pragma protect begin


function uvme_sb_st_vsqr_c::new(string name="uvme_sb_st_sqr", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_sb_st_vsqr_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_sb_st_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvme_sb_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
endfunction : build_phase


`pragma protect end


`endif // __UVME_SB_ST_VSQR_SV__

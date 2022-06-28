// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_SB_ST_BASE_VSEQ_SV__
`define __UVME_SB_ST_BASE_VSEQ_SV__


/**
 * Abstract object from which all other the Moore.io UVM Scoreboarding Library virtual sequences extend.
 * Does not generate any sequence items of its own. Subclasses must be run on
 * the Moore.io UVM Scoreboarding Library Virtual Sequencer (uvme_sb_st_vsqr_c) instance.
 */
class uvme_sb_st_base_vseq_c extends uvm_sequence#(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   // Environment handles
   uvme_sb_st_cfg_c    cfg;
   uvme_sb_st_cntxt_c  cntxt;
   
   
   `uvm_object_utils(uvme_sb_st_base_vseq_c)
   `uvm_declare_p_sequencer(uvme_sb_st_vsqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_sb_st_base_vseq");
   
   /**
    * Retrieve cfg and cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();
   
endclass : uvme_sb_st_base_vseq_c


`pragma protect begin


function uvme_sb_st_base_vseq_c::new(string name="uvme_sb_st_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_sb_st_base_vseq_c::pre_start();
   
   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;
   
endtask : pre_start


`pragma protect end


`endif // __UVME_SB_ST_BASE_VSEQ_SV__

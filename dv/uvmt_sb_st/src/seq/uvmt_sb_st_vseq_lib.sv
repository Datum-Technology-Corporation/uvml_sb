// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_VSEQ_LIB_SV__
`define __UVMT_SB_ST_VSEQ_LIB_SV__


`include "uvmt_sb_st_in_order_vseq.sv"
`include "uvmt_sb_st_out_of_order_vseq.sv"


/**
 * TODO Describe uvmt_sb_st_vseq_lib_c
 */
class uvmt_sb_st_vseq_lib_c extends uvml_vseq_lib_c#(
   .REQ(uvmt_sb_st_seq_item_c),
   .RSP(uvmt_sb_st_seq_item_c)
);
   
   `uvm_object_utils          (uvmt_sb_st_vseq_lib_c)
   `uvm_sequence_library_utils(uvmt_sb_st_vseq_lib_c)
   
   
   /**
    * Initializes sequence library
    */
   extern function new(string name="uvmt_sb_st_vseq_lib");
   
endclass : uvmt_sb_st_vseq_lib_c


function uvmt_sb_st_vseq_lib_c::new(string name="uvmt_sb_st_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   
   add_sequence(uvmt_sb_st_in_order_vseq_c    ::get_type());
   add_sequence(uvmt_sb_st_out_of_order_vseq_c::get_type());
   
endfunction : new


`endif // __UVMT_SB_ST_VSEQ_LIB_SV__

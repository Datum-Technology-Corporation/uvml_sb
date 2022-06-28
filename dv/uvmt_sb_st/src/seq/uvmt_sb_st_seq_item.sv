// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_SEQ_ITEM_SV__
`define __UVMT_SB_ST_SEQ_ITEM_SV__


/**
 * TODO Describe uvmt_sb_st_seq_item_c
 */
class uvmt_sb_st_seq_item_c extends uvml_mon_trn_c;
   
   rand int unsigned  data;
   
   
   `uvm_object_utils_begin(uvmt_sb_st_seq_item_c)
      `uvm_field_int(data, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_seq_item");
   
endclass : uvmt_sb_st_seq_item_c


function uvmt_sb_st_seq_item_c::new(string name="uvmt_sb_st_seq_item");
   
   super.new(name);
   
endfunction : new


`endif // __UVMT_SB_ST_SEQ_ITEM_SV__

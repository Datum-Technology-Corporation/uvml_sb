// Copyright 2021 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_SEQ_LIB_SV__
`define __UVMT_SB_ST_SEQ_LIB_SV__


`include "uvmt_sb_st_in_order_vseq.sv"
`include "uvmt_sb_st_out_of_order_vseq.sv"


/**
 * TODO Describe uvmt_sb_st_seq_lib_c
 */
class uvmt_sb_st_seq_lib_c extends uvml_vseq_lib_c#(
   .REQ(uvmt_sb_st_seq_item_c),
   .RSP(uvmt_sb_st_seq_item_c)
);
   
   `uvm_object_utils          (uvmt_sb_st_seq_lib_c)
   `uvm_sequence_library_utils(uvmt_sb_st_seq_lib_c)
   
   
   /**
    * Initializes sequence library
    */
   extern function new(string name="uvmt_sb_st_seq_lib");
   
endclass : uvmt_sb_st_seq_lib_c


function uvmt_sb_st_seq_lib_c::new(string name="uvmt_sb_st_seq_lib");
   
   super.new(name);
   init_sequence_library();
   
   add_sequence(uvmt_sb_st_in_order_vseq_c    ::get_type());
   add_sequence(uvmt_sb_st_out_of_order_vseq_c::get_type());
   
endfunction : new


`endif // __UVMT_SB_ST_SEQ_LIB_SV__

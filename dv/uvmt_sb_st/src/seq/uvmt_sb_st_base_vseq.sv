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


`ifndef __UVMT_SB_ST_BASE_VSEQ_SV__
`define __UVMT_SB_ST_BASE_VSEQ_SV__


/**
 * TODO Describe uvmt_sb_st_base_vseq_c
 */
class uvmt_sb_st_base_vseq_c extends uvml_vseq_c#(
   .REQ(uvmt_sb_st_seq_item_c),
   .RSP(uvmt_sb_st_seq_item_c)
);
   
   // Fields
   uvmt_sb_st_test_cfg  cfg; ///< 
   
   
   `uvm_object_utils_begin(uvmt_sb_st_base_vseq_c)
      `uvm_field_object(cfg, UVM_DEFAULT)
   `uvm_object_utils_end
   `uvm_declare_p_sequencer(uvmt_sb_st_vsqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_base_vseq");
   
   /**
    * Retrieve cfg handle from p_sequencer.
    */
   extern virtual task pre_start();
   
endclass : uvmt_sb_st_base_vseq_c


function uvmt_sb_st_base_vseq_c::new(string name="uvmt_sb_st_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_st_base_vseq_c::pre_start();
   
   cfg   = p_sequencer.cfg;
   
endtask : pre_start


`endif // __UVMT_SB_ST_BASE_VSEQ_SV__

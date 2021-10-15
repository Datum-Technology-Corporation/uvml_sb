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


`ifndef __UVMT_SB_ST_SQR_SV__
`define __UVMT_SB_ST_SQR_SV__


/**
 * TODO Describe uvmt_sb_st_sqr_c
 */
class uvmt_sb_st_sqr_c extends uvml_vsqr_c#(
   .REQ(uvmt_sb_st_seq_item_c),
   .RSP(uvmt_sb_st_seq_item_c)
);
   
   // Objects
   uvmt_sb_st_test_cfg_c  cfg; ///< 
   
   
   `uvm_component_utils_begin(uvmt_sb_st_sqr_c)
      `uvm_utils_object(cfg, UVM_DEFAULT)
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

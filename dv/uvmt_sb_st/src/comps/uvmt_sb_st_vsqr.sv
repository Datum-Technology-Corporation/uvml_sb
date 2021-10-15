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


`ifndef __UVMT_SB_ST_VSQR_SV__
`define __UVMT_SB_ST_VSQR_SV__


/**
 * TODO Describe uvmt_sb_st_vsqr_c
 */
class uvmt_sb_st_vsqr_c extends uvml_vsqr_c#(
   .REQ(uvmt_sb_st_seq_item_c),
   .RSP(uvmt_sb_st_seq_item_c)
);
   
   // Objects
   uvmt_sb_st_test_cfg_c  cfg; ///< 
   
   // Components
   uvmt_sb_st_sqr_c  actual_sequencer  ; ///< 
   uvmt_sb_st_sqr_c  expected_sequencer; ///< 
   
   // TLM
   uvm_analysis_port#(uvmt_sb_st_seq_item_c)  actual_ap  ; ///< 
   uvm_analysis_port#(uvmt_sb_st_seq_item_c)  expected_ap; ///< 
   
   
   `uvm_component_utils_begin(uvmt_sb_st_vsqr_c)
      `uvm_field_object(cfg, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_vsqr", uvm_component parent=null);
   
   /**
    * TODO Describe uvmt_sb_st_vsqr_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvmt_sb_st_vsqr_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);
   
endclass : uvmt_sb_st_vsqr_c


function uvmt_sb_st_vsqr_c::new(string name="uvmt_sb_st_vsqr", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvmt_sb_st_vsqr_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvmt_sb_st_test_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   uvm_config_db#(uvmt_sb_st_test_cfg_c)::set(this, "*", "cfg", cfg);
   
   // Create components
   actual_sequencer   = uvmt_sb_st_sqr_c::type_id::create("actual_sequencer"  , this);
   expected_sequencer = uvmt_sb_st_sqr_c::type_id::create("expected_sequencer", this);
   
   // Create TLM ports
   actual_ap   = new("actual_ap"  , this);
   expected_ap = new("expected_ap", this);
   
endfunction : build_phase


task uvmt_sb_st_vsqr_c::run_phase(uvm_phase phase);
   
   uvmt_sb_st_seq_item_c  actual_item, expected_item;
   
   super.run_phase(phase);
   
   fork
      begin : actual
         forever begin
            actual_sequencer.get_next_item(actual_item);
            actual_ap       .write        (actual_item);
            actual_sequencer.item_done    ();
            `uvml_hrtbt()
         end
      end
      
      begin : expected
         forever begin
            expected_sequencer.get_next_item(expected_item);
            expected_ap       .write        (expected_item);
            expected_sequencer.item_done    ();
            `uvml_hrtbt()
         end
      end
   join
   
endtask : run_phase


`endif // __UVMT_SB_ST_VSQR_SV__

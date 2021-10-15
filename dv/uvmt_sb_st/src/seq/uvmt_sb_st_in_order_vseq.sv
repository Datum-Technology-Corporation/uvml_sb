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


`ifndef __UVMT_SB_ST_IN_ORDER_VSEQ_SV__
`define __UVMT_SB_ST_IN_ORDER_VSEQ_SV__


/**
 * TODO Describe uvmt_sb_st_in_order_vseq_c
 */
class uvmt_sb_st_in_order_vseq_c extends uvmt_sb_st_base_vseq_c;
   
   rand int unsigned  num_items ; ///< 
        int unsigned  drop_count; ///< 
   
   
   `uvm_object_utils_begin(uvmt_sb_st_in_order_vseq_c)
      `uvm_field_int(num_items , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(drop_count, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint limits_cons {
      num_items >    0;
      num_items <= 100;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_in_order_vseq");
   
   /**
    * TODO Describe uvmt_sb_st_in_order_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvmt_sb_st_in_order_vseq_c


function uvmt_sb_st_in_order_vseq_c::new(string name="uvmt_sb_st_in_order_vseq");
   
   super.new(name);
   drop_count = 0;
   
endfunction : new


task uvmt_sb_st_in_order_vseq_c::body();
   
   uvmt_sb_st_seq_item_c  act_req     ;
   uvmt_sb_st_seq_item_c  exp_req     ;
   int unsigned           current_data;
   bit                    current_drop;
   
   for (int unsigned ii=0; ii<num_items; ii++) begin
      #10ns;
      `uvm_info("IN_ORDER_VSEQ", $sformatf("Starting item %0d of %0d", ii+1, num_items), UVM_LOW)
      current_data = $urandom();
      current_drop = $urandom_range(0,1);
      
      // Expected
      `uvm_create_on(exp_req, p_sequencer.expected_sequencer);
      exp_req.data = current_data;
      exp_req.set_may_drop(current_drop);
      `uvm_send(exp_req)
      
      // Actual
      if (current_drop && $urandom_range(0,1)) begin
         `uvm_info("IN_ORDER_VSEQ", $sformatf("Dropping item #%0d:\n%s", ii+1, act_req.sprint()), UVM_LOW)
         drop_count++;
      end
      else begin
         `uvm_create_on(act_req, p_sequencer.actual_sequencer);
         act_req.data = current_data;
         `uvm_send(act_req)
      end
      
      `uvm_info("IN_ORDER_VSEQ", $sformatf("Ended item %0d of %0d", ii+1, num_items), UVM_LOW)
   end
   
endtask : body


`endif // __UVMT_SB_ST_IN_ORDER_VSEQ_SV__

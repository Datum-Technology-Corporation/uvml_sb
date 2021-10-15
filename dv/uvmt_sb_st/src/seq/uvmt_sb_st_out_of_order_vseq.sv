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


`ifndef __UVMT_SB_ST_OUT_OF_ORDER_VSEQ_SV__
`define __UVMT_SB_ST_OUT_OF_ORDER_VSEQ_SV__


/**
 * TODO Describe uvmt_sb_st_out_of_order_vseq_c
 */
class uvmt_sb_st_out_of_order_vseq_c extends uvmt_sb_st_base_vseq_c;
   
   rand int unsigned                num_threads  ; ///< 
        uvmt_sb_st_in_order_vseq_c  thread_vseq[]; ///< 
   
   
   `uvm_object_utils_begin(uvmt_sb_st_out_of_order_vseq_c)
      `uvm_field_int         (num_threads, UVM_DEFAULT + UVM_DEC)
      `uvm_field_array_object(thread_vseq, UVM_DEFAULT          )
   `uvm_object_utils_end
   
   
   constraint limits_cons {
      num_threads > 0;
      num_threads <= 10;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_out_of_order_vseq");
   
   /**
    * TODO Describe uvmt_sb_st_out_of_order_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvmt_sb_st_out_of_order_vseq_c


function uvmt_sb_st_out_of_order_vseq_c::new(string name="uvmt_sb_st_out_of_order_vseq");
   
   super.new(name);
   
endfunction : new


task uvmt_sb_st_out_of_order_vseq_c::body();
   
   thread_vseq = new[num_threads];
   p_sequencer.set_arbitration(UVM_SEQ_ARB_RANDOM);
   `uvm_info("OUT_OF_ORDER_VSEQ", $sformatf("Starting %0d threads of items", num_threads), UVM_LOW)
   
   fork
      begin
         foreach (thread_vseq[_ii]) begin
            fork
               automatic int unsigned ii = _ii;
               
               begin
                  `uvm_do_on(thread_vseq[ii], p_sequencer)
               end
            join_none
         end
         wait fork;
      end
   join
   
endtask : body


`endif // __UVMT_SB_ST_OUT_OF_ORDER_VSEQ_SV__

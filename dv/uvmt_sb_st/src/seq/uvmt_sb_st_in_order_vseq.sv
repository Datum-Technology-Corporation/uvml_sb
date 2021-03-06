// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
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
      if (current_drop && $urandom_range(0,1)) begin
         `uvm_info("IN_ORDER_VSEQ", $sformatf("Dropping expected item #%0d:\n%s", ii+1, exp_req.sprint()), UVM_LOW)
         drop_count++;
      end
      else begin
         exp_req.data = current_data;
         exp_req.set_may_drop(current_drop);
         `uvm_send(exp_req)
      end

      // Actual
      `uvm_create_on(act_req, p_sequencer.actual_sequencer);
      if (current_drop && $urandom_range(0,1)) begin
         `uvm_info("IN_ORDER_VSEQ", $sformatf("Dropping actual item #%0d:\n%s", ii+1, act_req.sprint()), UVM_LOW)
         drop_count++;
      end
      else begin
         act_req.data = current_data;
         act_req.set_may_drop(current_drop);
         `uvm_send(act_req)
      end

      `uvm_info("IN_ORDER_VSEQ", $sformatf("Ended item %0d of %0d", ii+1, num_items), UVM_LOW)
   end

endtask : body


`endif // __UVMT_SB_ST_IN_ORDER_VSEQ_SV__

// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_OUT_OF_ORDER_TEST_SV__
`define __UVMT_SB_ST_OUT_OF_ORDER_TEST_SV__


/**
 * TODO Describe uvmt_sb_st_out_of_order_test_c
 */
class uvmt_sb_st_out_of_order_test_c extends uvmt_sb_st_base_test_c;
   
   rand int unsigned                    num_items        ; ///< 
   rand uvmt_sb_st_out_of_order_vseq_c  out_of_order_vseq; ///< 
   
   
   `uvm_component_utils_begin(uvmt_sb_st_out_of_order_test_c)
      `uvm_field_int   (num_items        , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(out_of_order_vseq, UVM_DEFAULT          )
   `uvm_component_utils_end
   
   
   constraint test_cons {
      num_items                   >    0;
      num_items                   <= 100;
      out_of_order_vseq.num_items == num_items;
      test_cfg.sb_mode            == UVML_SB_MODE_OUT_OF_ORDER;
   }
   
   
   /**
    * Creates out_of_order_vseq.
    */
   extern function new(string name="uvmt_sb_st_out_of_order_test", uvm_component parent=null);
   
   /**
    * Runs out_of_order_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);
   
endclass : uvmt_sb_st_out_of_order_test_c


function uvmt_sb_st_out_of_order_test_c::new(string name="uvmt_sb_st_out_of_order_test", uvm_component parent=null);
   
   super.new(name, parent);
   out_of_order_vseq = uvmt_sb_st_out_of_order_vseq_c::type_id::create("out_of_order_vseq");
   
endfunction : new


task uvmt_sb_st_out_of_order_test_c::main_phase(uvm_phase phase);
   
   super.main_phase(phase);
   
   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting out_of_order virtual sequence:\n%s", out_of_order_vseq.sprint()), UVM_NONE)
   out_of_order_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished out_of_order virtual sequence:\n%s", out_of_order_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);
   
endtask : main_phase


`endif // __UVMT_SB_ST_OUT_OF_ORDER_TEST_SV__

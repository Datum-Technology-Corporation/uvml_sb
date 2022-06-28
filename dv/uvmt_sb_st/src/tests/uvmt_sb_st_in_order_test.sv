// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_IN_ORDER_TEST_SV__
`define __UVMT_SB_ST_IN_ORDER_TEST_SV__


/**
 * TODO Describe uvmt_sb_st_in_order_test_c
 */
class uvmt_sb_st_in_order_test_c extends uvmt_sb_st_base_test_c;
   
   rand int unsigned                num_items    ; ///< 
   rand uvmt_sb_st_in_order_vseq_c  in_order_vseq; ///< 
   
   
   `uvm_component_utils_begin(uvmt_sb_st_in_order_test_c)
      `uvm_field_int   (num_items    , UVM_DEFAULT + UVM_DEC)
      `uvm_field_object(in_order_vseq, UVM_DEFAULT          )
   `uvm_component_utils_end
   
   
   constraint test_cons {
      num_items                   >    0;
      num_items                   <= 100;
      in_order_vseq.num_items     == num_items;
      test_cfg.sb_mode            == UVML_SB_MODE_IN_ORDER;
      test_cfg.num_actual_items   == num_items;
      test_cfg.num_expected_items == num_items;
   }
   
   
   /**
    * Creates in_order_vseq.
    */
   extern function new(string name="uvmt_sb_st_in_order_test", uvm_component parent=null);
   
   /**
    * Runs in_order_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);
   
endclass : uvmt_sb_st_in_order_test_c


function uvmt_sb_st_in_order_test_c::new(string name="uvmt_sb_st_in_order_test", uvm_component parent=null);
   
   super.new(name, parent);
   in_order_vseq = uvmt_sb_st_in_order_vseq_c::type_id::create("in_order_vseq");
   
endfunction : new


task uvmt_sb_st_in_order_test_c::main_phase(uvm_phase phase);
   
   super.main_phase(phase);
   
   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting in_order virtual sequence:\n%s", in_order_vseq.sprint()), UVM_NONE)
   in_order_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished in_order virtual sequence:\n%s", in_order_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);
   
endtask : main_phase


`endif // __UVMT_SB_ST_IN_ORDER_TEST_SV__

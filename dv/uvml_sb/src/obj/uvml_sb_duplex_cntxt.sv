// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_SB_DUPLEX_CNTXT_SV__
`define __UVML_SB_DUPLEX_CNTXT_SV__


/**
 * TODO Describe uvml_sb_duplex_cntxt_c
 */
class uvml_sb_duplex_cntxt_c extends uvml_cntxt_c;
   
   // Transaction queues
   uvml_sb_simplex_cntxt_c  egress_cntxt ; ///< 
   uvml_sb_simplex_cntxt_c  ingress_cntxt; ///< 
   
   
   `uvm_object_utils_begin(uvml_sb_duplex_cntxt_c)
      `uvm_field_object(egress_cntxt , UVM_DEFAULT)
      `uvm_field_object(ingress_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvml_sb_duplex_cntxt");
   
   /**
    * Sets all state variables to 0's;
    */
   extern function void reset();
   
endclass : uvml_sb_duplex_cntxt_c


function uvml_sb_duplex_cntxt_c::new(string name="uvml_sb_duplex_cntxt");
   
   super.new(name);
   egress_cntxt  = uvml_sb_simplex_cntxt_c::type_id::create("egress_cntxt" );
   ingress_cntxt = uvml_sb_simplex_cntxt_c::type_id::create("ingress_cntxt");
   
endfunction : new


function void uvml_sb_duplex_cntxt_c::reset();
   
   egress_cntxt .reset();
   ingress_cntxt.reset();
   
endfunction : reset


`endif // __UVML_SB_DUPLEX_CNTXT_SV__

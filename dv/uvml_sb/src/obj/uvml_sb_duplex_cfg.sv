// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_SB_DUPLEX_CFG_SV__
`define __UVML_SB_DUPLEX_CFG_SV__


/**
 * TODO Describe uvml_sb_duplex_cfg_c
 */
class uvml_sb_duplex_cfg_c extends uvml_cfg_c;
   
   rand bit                    enabled       ; ///< 
   rand uvml_sb_simplex_cfg_c  egress_sb_cfg ; ///< 
   rand uvml_sb_simplex_cfg_c  ingress_sb_cfg; ///< 
   
   
   `uvm_object_utils_begin(uvml_sb_duplex_cfg_c)
      `uvm_field_int   (enabled    , UVM_DEFAULT)
      `uvm_field_object(egress_sb_cfg , UVM_DEFAULT)
      `uvm_field_object(ingress_sb_cfg, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint rules_cons {
      egress_sb_cfg .enabled == enabled;
      ingress_sb_cfg.enabled == enabled;
   }
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvml_sb_duplex_cfg");
   
endclass : uvml_sb_duplex_cfg_c


function uvml_sb_duplex_cfg_c::new(string name="uvml_sb_duplex_cfg");
  
  super.new(name);
  egress_sb_cfg  = uvml_sb_simplex_cfg_c::type_id::create("egress_sb_cfg" );
  ingress_sb_cfg = uvml_sb_simplex_cfg_c::type_id::create("ingress_sb_cfg");
  
endfunction : new


`endif // __UVML_SB_DUPLEX_CFG_SV__

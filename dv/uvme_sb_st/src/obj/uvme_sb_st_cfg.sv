// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_SB_ST_CFG_SV__
`define __UVME_SB_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running
 * the Moore.io UVM Scoreboarding Library VIP Self-Testing Environment (uvme_sb_st_env_c)
 * components.
 */
class uvme_sb_st_cfg_c extends uvm_object;
   
   // Integrals
   rand bit                      enabled;
   rand uvm_active_passive_enum  is_active;
   rand bit                      scoreboarding_enabled;
   rand bit                      cov_model_enabled;
   rand bit                      trn_log_enabled;
   
   // Objects
   rand uvma_sb_cfg_c  abc_cfg;
   rand uvma_sb_cfg_c  def_cfg;
   rand uvml_sb_cfg_c       sb_cfg;
   
   
   `uvm_object_utils_begin(uvme_sb_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      
      `uvm_field_object(abc_cfg, UVM_DEFAULT)
      `uvm_field_object(def_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_cfg       , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft enabled                == 0;
      soft is_active              == UVM_PASSIVE;
      soft scoreboarding_enabled  == 1;
      soft cov_model_enabled      == 0;
      soft trn_log_enabled        == 1;
   }
   
   constraint agent_cfg_cons {
      if (enabled) {
         abc_cfg.enabled == 1;
         def_cfg.enabled == 1;
      }
      
      if (is_active == UVM_ACTIVE) {
         abc_cfg.is_active == UVM_ACTIVE;
         def_cfg.is_active == UVM_ACTIVE;
      }
      
      if (trn_log_enabled) {
         soft abc_cfg.trn_log_enabled == 1;
         soft def_cfg.trn_log_enabled == 1;
      }
   }
   
   constraint sb_cfg_cons {
      if (scoreboarding_enabled) {
         soft sb_cfg.enabled == 1;
      }
      else {
         sb_cfg.enabled == 0;
      }
   }
   
   
   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_sb_st_cfg");
   
endclass : uvme_sb_st_cfg_c


`pragma protect begin


function uvme_sb_st_cfg_c::new(string name="uvme_sb_st_cfg");
   
   super.new(name);
   
   abc_cfg  = uvma_sb_cfg_c::type_id::create("abc_cfg");
   def_cfg  = uvma_sb_cfg_c::type_id::create("def_cfg");
   sb_cfg         = uvml_sb_cfg_c::type_id::create("sb_cfg");
   
endfunction : new


`pragma protect end


`endif // __UVME_SB_ST_CFG_SV__

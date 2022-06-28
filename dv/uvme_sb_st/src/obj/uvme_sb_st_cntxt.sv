// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_SB_ST_CNTXT_SV__
`define __UVME_SB_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for the Moore.io UVM Scoreboarding Library VIP
 * Self-Testing environment (uvme_sb_st_env_c) components.
 */
class uvme_sb_st_cntxt_c extends uvm_object;
   
   // Agent context handles
   uvma_sb_cntxt_c  abc_cntxt;
   uvma_sb_cntxt_c  def_cntxt;
   
   // Scoreboard context handle
   uvml_sb_cntxt_c  sb_cntxt;
   
   // Events
   uvm_event  sample_cfg_e  ;
   uvm_event  sample_cntxt_e;
   
   
   `uvm_object_utils_begin(uvme_sb_st_cntxt_c)
      `uvm_field_object(abc_cntxt, UVM_DEFAULT)
      `uvm_field_object(def_cntxt, UVM_DEFAULT)
      
      `uvm_field_object(sb_cntxt, UVM_DEFAULT)
      
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_sb_st_cntxt");
   
   /**
    * TODO Describe uvme_sb_st_cntxt_c::reset()
    */
   extern function void reset();
   
endclass : uvme_sb_st_cntxt_c


`pragma protect begin


function uvme_sb_st_cntxt_c::new(string name="uvme_sb_st_cntxt");
   
   super.new(name);
   
   abc_cntxt = uvma_sb_cntxt_c::type_id::create("abc_cntxt");
   def_cntxt = uvma_sb_cntxt_c::type_id::create("def_cntxt");
   sb_cntxt        = uvml_sb_cntxt_c     ::type_id::create("sb_cntxt"       );
   
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   
endfunction : new


function void uvme_sb_st_cntxt_c::reset();
   
   abc_cntxt.reset();
   def_cntxt.reset();
   
endfunction : reset


`pragma protect end


`endif // __UVME_SB_ST_CNTXT_SV__

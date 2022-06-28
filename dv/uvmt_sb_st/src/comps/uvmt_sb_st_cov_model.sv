// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_COV_MODEL_SV__
`define __UVMT_SB_ST_COV_MODEL_SV__


/**
 * TODO Describe uvmt_sb_st_cov_model_c
 */
class uvmt_sb_st_cov_model_c extends uvm_component;
   
   // Fields
   
   
   
   `uvm_component_utils_begin(uvmt_sb_st_cov_model_c)
      // UVM Field Util Macros
   `uvm_component_utils_end
   
   
   // Constraints
   
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_cov_model", uvm_component parent=null);
   
   // Methods
   
   
endclass : uvmt_sb_st_cov_model_c


function uvmt_sb_st_cov_model_c::new(string name="uvmt_sb_st_cov_model", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


`endif // __UVMT_SB_ST_COV_MODEL_SV__

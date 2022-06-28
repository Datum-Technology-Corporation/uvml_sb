// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_SB_ENTRY_SV__
`define __UVML_SB_ENTRY_SV__


/**
 * TODO Describe uvml_sb_simplex_entry_c
 */
class uvml_sb_simplex_entry_c #(
   type T_ACT_TRN  = uvm_object,
   type T_EXP_TRN  = T_ACT_TRN
) extends uvm_object;
   
   realtime                   actual_timestamp  ; ///< 
   realtime                   expected_timestamp; ///< 
   T_ACT_TRN                  actual_trn        ; ///< 
   T_EXP_TRN                  expected_trn      ; ///< 
   uvml_sb_entry_result_enum  result            ; ///< 
   
   
   `uvm_object_param_utils_begin(uvml_sb_simplex_entry_c#(.T_ACT_TRN(T_ACT_TRN), .T_EXP_TRN(T_EXP_TRN)))
      `uvm_field_real  (                           actual_timestamp  , UVM_DEFAULT + UVM_TIME)
      `uvm_field_real  (                           expected_timestamp, UVM_DEFAULT + UVM_TIME)
      `uvm_field_object(                           actual_trn        , UVM_DEFAULT           )
      `uvm_field_object(                           expected_trn      , UVM_DEFAULT           )
      `uvm_field_enum  (uvml_sb_entry_result_enum, result            , UVM_DEFAULT           )
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_simplex_entry");
   
endclass : uvml_sb_simplex_entry_c


function uvml_sb_simplex_entry_c::new(string name="uvml_sb_simplex_entry");
   
   super.new(name);
   expected_timestamp = $realtime();
   
endfunction : new


`endif // __UVML_SB_ENTRY_SV__

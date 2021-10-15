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


`ifndef __UVML_SB_ENTRY_SV__
`define __UVML_SB_ENTRY_SV__


/**
 * TODO Describe uvml_sb_simplex_entry_c
 */
class uvml_sb_simplex_entry_c #(
   type T_ACT_TRN  = uvm_object,
   type T_EXP_TRN  = T_ACT_TRN
) extends uvm_object;
   
   realtime                   timestamp; ///< 
   T_ACT_TRN                  actual   ; ///< 
   T_EXP_TRN                  expected ; ///< 
   uvml_sb_entry_result_enum  result   ; ///< 
   
   
   `uvm_object_param_utils_begin(uvml_sb_simplex_entry_c#(.T_ACT_TRN(T_ACT_TRN), .T_EXP_TRN(T_EXP_TRN)))
      `uvm_field_real  (                           timestamp, UVM_DEFAULT)
      `uvm_field_object(                           actual   , UVM_DEFAULT)
      `uvm_field_object(                           expected , UVM_DEFAULT)
      `uvm_field_enum  (uvml_sb_entry_result_enum, result   , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_simplex_entry");
   
endclass : uvml_sb_simplex_entry_c


function uvml_sb_simplex_entry_c::new(string name="uvml_sb_simplex_entry");
   
   super.new(name);
   timestamp = $realtime();
   
endfunction : new


`endif // __UVML_SB_ENTRY_SV__

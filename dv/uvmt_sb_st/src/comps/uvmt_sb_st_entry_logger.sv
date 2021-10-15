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


`ifndef __UVMT_SB_ST_ENTRY_LOGGER_SV__
`define __UVMT_SB_ST_ENTRY_LOGGER_SV__


/**
 * TODO Describe uvmt_sb_st_entry_logger_c
 */
class uvmt_sb_st_entry_logger_c extends uvm_subscriber #(uvmt_sb_st_entry_t);
   
   // Fields
   
   
   
   `uvm_component_utils_begin(uvmt_sb_st_entry_logger_c)
      // UVM Field Util Macros
   `uvm_component_utils_end
   
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvmt_sb_st_entry_logger", uvm_component parent=null);
   
   // Methods
   
   
endclass : uvmt_sb_st_entry_logger_c


function uvmt_sb_st_entry_logger_c::new(string name="uvmt_sb_st_entry_logger", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


`endif // __UVMT_SB_ST_ENTRY_LOGGER_SV__

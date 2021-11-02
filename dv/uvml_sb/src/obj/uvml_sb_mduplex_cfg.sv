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


`ifndef __UVML_SB_MDUPLEX_CFG_SV__
`define __UVML_SB_MDUPLEX_CFG_SV__


/**
 * TODO Describe uvml_sb_mduplex_cfg_c
 */
class uvml_sb_mduplex_cfg_c extends uvml_cfg_c;
   
   rand bit                   enabled            ; ///< 
   rand bit                   enable_all_channels; ///< 
   rand int unsigned          num_channels       ; ///< 
   rand uvml_sb_duplex_cfg_c  channel_sb_cfg[]   ; ///< 
   
   
   `uvm_object_utils_begin(uvml_sb_mduplex_cfg_c)
      `uvm_field_int         (enabled            , UVM_DEFAULT          )
      `uvm_field_int         (enable_all_channels, UVM_DEFAULT          )
      `uvm_field_int         (num_channels       , UVM_DEFAULT + UVM_DEC)
      `uvm_field_array_object(channel_sb_cfg     , UVM_DEFAULT          )
   `uvm_object_utils_end
   
   
   constraint rules_cons {
      channel_sb_cfg.size() == num_channels;
      foreach (channel_sb_cfg[ii]) {
         if (enabled) {
            if (enable_all_channels) {
               channel_sb_cfg[ii].enabled == 1;
            }
         }
         else {
            channel_sb_cfg[ii].enabled == 0;
         }
      }
   }
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvml_sb_mduplex_cfg");
   
endclass : uvml_sb_mduplex_cfg_c


function uvml_sb_mduplex_cfg_c::new(string name="uvml_sb_mduplex_cfg");
   
   super.new(name);
   channel_sb_cfg = new[`UVML_SB_MDUPLEX_MAX_CHANNELS];
   foreach (channel_sb_cfg[ii]) begin
      channel_sb_cfg[ii] = uvml_sb_duplex_cfg_c::type_id::create($sformatf("channel_sb_cfg[%0d]", ii));
   end
   
endfunction : new


`endif // __UVML_SB_MDUPLEX_CFG_SV__
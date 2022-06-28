// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
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

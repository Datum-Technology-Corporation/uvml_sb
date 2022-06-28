// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_SB_MDUPLEX_CNTXT_SV__
`define __UVML_SB_MDUPLEX_CNTXT_SV__


/**
 * TODO Describe uvml_sb_mduplex_cntxt_c
 */
class uvml_sb_mduplex_cntxt_c extends uvml_cntxt_c;
   
   uvml_sb_duplex_cntxt_c  channel_sb_cntxt[]; ///< 
   
   
   `uvm_object_utils_begin(uvml_sb_mduplex_cntxt_c)
      `uvm_field_array_object(channel_sb_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvml_sb_mduplex_cntxt");
   
   /**
    * TODO Describe uvml_sb_mduplex_cntxt_c::build()
    */
   extern function void build(ref uvml_sb_mduplex_cfg_c cfg);
   
   /**
    * Resets all state variables
    */
   extern function void reset();
   
endclass : uvml_sb_mduplex_cntxt_c


function uvml_sb_mduplex_cntxt_c::new(string name="uvml_sb_mduplex_cntxt");
   
   super.new(name);
   
endfunction : new


function void uvml_sb_mduplex_cntxt_c::build(ref uvml_sb_mduplex_cfg_c cfg);
   
   channel_sb_cntxt = new[cfg.num_channels];
   foreach (channel_sb_cntxt[ii]) begin
      channel_sb_cntxt[ii] = uvml_sb_duplex_cntxt_c::type_id::create($sformatf("channel_sb_cntxt[%0d]", ii));
   end
   
endfunction : build


function void uvml_sb_mduplex_cntxt_c::reset();
   
   foreach (channel_sb_cntxt[ii]) begin
      channel_sb_cntxt[ii].reset();
   end
   
endfunction : reset


`endif // __UVML_SB_MDUPLEX_CNTXT_SV__

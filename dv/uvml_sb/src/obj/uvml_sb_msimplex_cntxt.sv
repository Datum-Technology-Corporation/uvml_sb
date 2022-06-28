// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_SB_MSIMPLEX_CNTXT_SV__
`define __UVML_SB_MSIMPLEX_CNTXT_SV__


/**
 * TODO Describe uvml_sb_msimplex_cntxt_c
 */
class uvml_sb_msimplex_cntxt_c extends uvml_cntxt_c;
   
   uvml_sb_simplex_cntxt_c  stream_sb_cntxt[]; ///< 
   
   
   `uvm_object_utils_begin(uvml_sb_msimplex_cntxt_c)
      `uvm_field_array_object(stream_sb_cntxt, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvml_sb_msimplex_cntxt");
   
   /**
    * TODO Describe uvml_sb_msimplex_cntxt_c::build()
    */
   extern function void build(ref uvml_sb_msimplex_cfg_c cfg);
   
   /**
    * Resets all state variables
    */
   extern function void reset();
   
endclass : uvml_sb_msimplex_cntxt_c


function uvml_sb_msimplex_cntxt_c::new(string name="uvml_sb_msimplex_cntxt");
   
   super.new(name);
   
endfunction : new


function void uvml_sb_msimplex_cntxt_c::build(ref uvml_sb_msimplex_cfg_c cfg);
   
   stream_sb_cntxt = new[cfg.num_streams];
   foreach (stream_sb_cntxt[ii]) begin
      stream_sb_cntxt[ii] = uvml_sb_simplex_cntxt_c::type_id::create($sformatf("stream_sb_cntxt[%0d]", ii));
   end
   
endfunction : build


function void uvml_sb_msimplex_cntxt_c::reset();
   
   foreach (stream_sb_cntxt[ii]) begin
      stream_sb_cntxt[ii].reset();
   end
   
endfunction : reset


`endif // __UVML_SB_MSIMPLEX_CNTXT_SV__

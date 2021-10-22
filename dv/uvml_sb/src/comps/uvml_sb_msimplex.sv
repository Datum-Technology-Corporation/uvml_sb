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



`ifndef __UVML_SB_MSIMPLEX_SV__
`define __UVML_SB_MSIMPLEX_SV__


/**
 * @warning Untested
 * TODO Describe uvml_sb_msimplex_c
 */
class uvml_sb_msimplex_c #(
   type T_ACT_TRN  = uvm_object,
   type T_EXP_TRN  = T_ACT_TRN
) extends uvm_scoreboard;
   
   /**
    * Scoreboarding entry type for this scoreboard
    */
   typedef uvml_sb_simplex_entry_c #(
      .T_ACT_TRN(T_ACT_TRN),
      .T_EXP_TRN(T_EXP_TRN)
   )  entry_t;
   
   // Objects
   uvml_sb_msimplex_cfg_c    cfg  ; ///< 
   uvml_sb_msimplex_cntxt_c  cntxt; ///< 
   
   
   // Components
   uvml_sb_simplex_c #(T_EXP_TRN, T_ACT_TRN)  stream_sb[]; ///< 
   
   // TLM
   uvm_analysis_export  #(T_ACT_TRN)  act_export []; ///< TODO Describe uvml_sb_simplex_c::act_export
   uvm_analysis_export  #(T_EXP_TRN)  exp_export []; ///< TODO Describe uvml_sb_simplex_c::exp_export
   uvm_analysis_port    #(entry_t  )  ap         []; ///< TODO Describe uvml_sb_simplex_c::ap
   
   
   `uvm_component_param_utils_begin(uvml_sb_msimplex_c#(.T_ACT_TRN(T_ACT_TRN), .T_EXP_TRN(T_EXP_TRN)))
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_msimplex", uvm_component parent=null);
   
   /**
    * TODO Describe uvml_sb_msimplex_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvml_sb_msimplex_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
endclass : uvml_sb_msimplex_c


function uvml_sb_msimplex_c::new(string name="uvml_sb_msimplex", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvml_sb_msimplex_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvml_sb_msimplex_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   if (cfg.enabled) begin
      foreach (cfg.stream_cfg[ii]) begin
         void'(uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, $sformatf("stream_sb[%0d]", ii) , "cfg", cfg.stream_sb_cfg[ii]));
      end
      
      void'(uvm_config_db#(uvml_sb_msimplex_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (cntxt == null) begin
         `uvm_fatal("CNTXT", "Context handle is null")
      end
      foreach (cntxt.stream_cntxt[ii]) begin
         void'(uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, $sformatf("stream_sb[%0d]", ii) , "cntxt", cntxt.stream_sb_cntxt[ii]));
      end
      
      // Build sub-scoreboards
      stream_sb = new[cfg.num_streams];
      foreach (stream_sb[ii]) begin
         stream_sb[ii] = uvml_sb_simplex_c::type_id::create($sformatf("stream_sb[%0d]", ii), this);
      end
      
      // Build TLM objects
      act_export = new[cfg.num_streams];
      foreach (act_export[ii]) begin
         act_export[ii] = new($sformatf("act_export[%0d]", ii), this);
      end
      exp_export = new[cfg.num_streams];
      foreach (exp_export[ii]) begin
         exp_export[ii] = new($sformatf("exp_export[%0d]", ii), this);
      end
      ap = new[cfg.num_streams];
      foreach (ap[ii]) begin
         ap[ii] = new($sformatf("ap[%0d]", ii), this);
      end
   end
   
endfunction : build_phase


function void uvml_sb_msimplex_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      for (int unsigned ii=0; ii<cfg.num_streams; ii++) begin
         act_export [ii] = stream_sb[ii].act_export;
         exp_export [ii] = stream_sb[ii].exp_export;
         ap         [ii] = stream_sb[ii].ap        ;
      end
   end
   
endfunction: connect_phase


`endif // __UVML_SB_MSIMPLEX_SV__

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



`ifndef __UVML_SB_DUPLEX_SV__
`define __UVML_SB_DUPLEX_SV__


/**
 * @warning Untested
 * TODO Describe uvml_sb_duplex_c
 */
class uvml_sb_duplex_c #(
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
   uvml_sb_duplex_cfg_c    cfg  ; ///< 
   uvml_sb_duplex_cntxt_c  cntxt; ///< 
   
   
   // Components
   uvml_sb_simplex_c #(T_EXP_TRN, T_ACT_TRN)  egress_sb ; ///< 
   uvml_sb_simplex_c #(T_EXP_TRN, T_ACT_TRN)  ingress_sb; ///< 
   
   // TLM
   uvm_analysis_export  #(T_ACT_TRN)  egress_act_export ; ///< TODO Describe uvml_sb_simplex_c::egress_act_export
   uvm_analysis_export  #(T_EXP_TRN)  egress_exp_export ; ///< TODO Describe uvml_sb_simplex_c::egress_exp_export
   uvm_analysis_export  #(T_ACT_TRN)  ingress_act_export; ///< TODO Describe uvml_sb_simplex_c::ingress_act_export
   uvm_analysis_export  #(T_EXP_TRN)  ingress_exp_export; ///< TODO Describe uvml_sb_simplex_c::ingress_exp_export
   uvm_analysis_port    #(entry_t  )  egress_ap         ; ///< TODO Describe uvml_sb_simplex_c::egress_ap
   uvm_analysis_port    #(entry_t  )  ingress_ap        ; ///< TODO Describe uvml_sb_simplex_c::ingress_ap
   
   
   `uvm_component_param_utils_begin(uvml_sb_duplex_c#(.T_ACT_TRN(T_ACT_TRN), .T_EXP_TRN(T_EXP_TRN)))
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_duplex", uvm_component parent=null);
   
   /**
    * TODO Describe uvml_sb_duplex_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvml_sb_duplex_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
endclass : uvml_sb_duplex_c


function uvml_sb_duplex_c::new(string name="uvml_sb_duplex", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvml_sb_duplex_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvml_sb_duplex_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   void'(uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "egress_sb" , "cfg", cfg.egress_sb_cfg ));
   void'(uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "ingress_sb", "cfg", cfg.ingress_sb_cfg));
   
   void'(uvm_config_db#(uvml_sb_duplex_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   void'(uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "egress_sb" , "cntxt", cntxt.egress_sb_cntxt ));
   void'(uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "ingress_sb", "cntxt", cntxt.ingress_sb_cntxt));
   
   // Build sub-scoreboards
   egress_sb  = uvml_sb_simplex_c::type_id::create("egress_sb" , this);
   ingress_sb = uvml_sb_simplex_c::type_id::create("ingress_sb", this);
   
   // Build TLM objects
   egress_act_export  = new("egress_act_export" , this);
   egress_exp_export  = new("egress_exp_export" , this);
   ingress_act_export = new("ingress_act_export", this);
   ingress_exp_export = new("ingress_exp_export", this);
   egress_ap          = new("egress_ap"         , this);
   ingress_ap         = new("ingress_ap"        , this);
   
endfunction : build_phase


function void uvml_sb_duplex_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      egress_act_export  = egress_sb .act_export;
      egress_exp_export  = egress_sb .exp_export;
      ingress_act_export = ingress_sb.act_export;
      ingress_exp_export = ingress_sb.exp_export;
      egress_ap          = egress_sb .ap        ;
      ingress_ap         = ingress_sb.ap        ;
   end
   
endfunction: connect_phase


`endif // __UVML_SB_DUPLEX_SV__

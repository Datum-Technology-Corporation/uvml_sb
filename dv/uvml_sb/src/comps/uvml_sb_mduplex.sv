// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



`ifndef __UVML_SB_MDUPLEX_SV__
`define __UVML_SB_MDUPLEX_SV__


/**
 * @warning Untested
 * TODO Describe uvml_sb_mduplex_c
 */
class uvml_sb_mduplex_c #(
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
   uvml_sb_mduplex_cfg_c    cfg  ; ///< 
   uvml_sb_mduplex_cntxt_c  cntxt; ///< 
   
   
   // Components
   uvml_sb_duplex_c #(T_EXP_TRN, T_ACT_TRN)  channel_sb[]; ///< 
   
   // TLM
   uvm_analysis_export  #(T_ACT_TRN)  egress_act_export []; ///< TODO Describe uvml_sb_duplex_c::egress_act_export
   uvm_analysis_export  #(T_EXP_TRN)  egress_exp_export []; ///< TODO Describe uvml_sb_duplex_c::egress_exp_export
   uvm_analysis_export  #(T_ACT_TRN)  ingress_act_export[]; ///< TODO Describe uvml_sb_duplex_c::ingress_act_export
   uvm_analysis_export  #(T_EXP_TRN)  ingress_exp_export[]; ///< TODO Describe uvml_sb_duplex_c::ingress_exp_export
   uvm_analysis_port    #(entry_t  )  egress_ap         []; ///< TODO Describe uvml_sb_duplex_c::egress_ap
   uvm_analysis_port    #(entry_t  )  ingress_ap        []; ///< TODO Describe uvml_sb_duplex_c::ingress_ap
   
   
   `uvm_component_param_utils_begin(uvml_sb_mduplex_c#(.T_ACT_TRN(T_ACT_TRN), .T_EXP_TRN(T_EXP_TRN)))
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_mduplex", uvm_component parent=null);
   
   /**
    * TODO Describe uvml_sb_mduplex_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvml_sb_mduplex_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
endclass : uvml_sb_mduplex_c


function uvml_sb_mduplex_c::new(string name="uvml_sb_mduplex", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvml_sb_mduplex_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvml_sb_mduplex_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   if (cfg.enabled) begin
      foreach (cfg.channel_cfg[ii]) begin
         void'(uvm_config_db#(uvml_sb_duplex_cfg_c)::set(this, $sformatf("channel_sb[%0d]", ii) , "cfg", cfg.channel_sb_cfg[ii]));
      end
      
      void'(uvm_config_db#(uvml_sb_mduplex_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (cntxt == null) begin
         `uvm_fatal("CNTXT", "Context handle is null")
      end
      foreach (cntxt.channel_cntxt[ii]) begin
         void'(uvm_config_db#(uvml_sb_duplex_cntxt_c)::set(this, $sformatf("channel_sb[%0d]", ii) , "cntxt", cntxt.channel_sb_cntxt[ii]));
      end
      
      // Build sub-scoreboards
      channel_sb = new[cfg.num_channels];
      foreach (channel_sb[ii]) begin
         channel_sb[ii] = uvml_sb_duplex_c::type_id::create($sformatf("channel_sb[%0d]", ii), this);
      end
      
      // Build TLM objects
      egress_act_export = new[cfg.num_channels];
      foreach (egress_act_export[ii]) begin
         egress_act_export[ii] = new($sformatf("egress_act_export[%0d]", ii), this);
      end
      egress_exp_export = new[cfg.num_channels];
      foreach (egress_exp_export[ii]) begin
         egress_exp_export[ii] = new($sformatf("egress_exp_export[%0d]", ii), this);
      end
      ingress_act_export = new[cfg.num_channels];
      foreach (ingress_act_export[ii]) begin
         ingress_act_export[ii] = new($sformatf("ingress_act_export[%0d]", ii), this);
      end
      ingress_exp_export = new[cfg.num_channels];
      foreach (ingress_exp_export[ii]) begin
         ingress_exp_export[ii] = new($sformatf("ingress_exp_export[%0d]", ii), this);
      end
      egress_ap = new[cfg.num_channels];
      foreach (egress_ap[ii]) begin
         egress_ap[ii] = new($sformatf("egress_ap[%0d]", ii), this);
      end
      ingress_ap = new[cfg.num_channels];
      foreach (ingress_ap[ii]) begin
         ingress_ap[ii] = new($sformatf("ingress_ap[%0d]", ii), this);
      end
   end
   
endfunction : build_phase


function void uvml_sb_mduplex_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      for (int unsigned ii=0; ii<cfg.num_channels; ii++) begin
         egress_act_export [ii] = channel_sb[ii].egress_act_export ;
         egress_exp_export [ii] = channel_sb[ii].egress_exp_export ;
         ingress_act_export[ii] = channel_sb[ii].ingress_act_export;
         ingress_exp_export[ii] = channel_sb[ii].ingress_exp_export;
         egress_ap         [ii] = channel_sb[ii].egress_ap         ;
         ingress_ap        [ii] = channel_sb[ii].ingress_ap        ;
      end
   end
   
endfunction: connect_phase


`endif // __UVML_SB_MDUPLEX_SV__

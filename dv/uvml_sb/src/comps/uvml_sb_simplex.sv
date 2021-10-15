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


`ifndef __UVML_SB_SIMPLEX_SV__
`define __UVML_SB_SIMPLEX_SV__


/**
 * Scoreboard comparing expected and actual packet stream to/from DUT.
 */
class uvml_sb_simplex_c#(
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
   uvml_sb_simplex_cfg_c    cfg  ; ///< Handle to scoreboard configuration
   uvml_sb_simplex_cntxt_c  cntxt; ///< Handle to scoreboard context
   
   // TLM
   uvm_analysis_export  #(T_ACT_TRN)  act_export; ///< TODO Describe uvml_sb_simplex_c::act_export
   uvm_analysis_export  #(T_EXP_TRN)  exp_export; ///< TODO Describe uvml_sb_simplex_c::exp_export
   uvm_tlm_analysis_fifo#(T_ACT_TRN)  act_fifo  ; ///< TODO Describe uvml_sb_simplex_c::act_fifo
   uvm_tlm_analysis_fifo#(T_EXP_TRN)  exp_fifo  ; ///< TODO Describe uvml_sb_simplex_c::exp_fifo
   uvm_analysis_port    #(entry_t  )  ap        ; ///< TODO Describe uvml_sb_simplex_c::ap
   
   
   `uvm_component_param_utils_begin(uvml_sb_simplex_c#(.T_ACT_TRN(T_ACT_TRN), .T_EXP_TRN(T_EXP_TRN)))
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_simplex", uvm_component parent=null);

   /**
    * TODO Describe uvml_sb_simplex_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::check_phase()
    */
   extern virtual function void check_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::extract_phase()
    */
   extern virtual function void extract_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::mode_in_order()
    */
   extern task mode_in_order();

   /**
    * TODO Describe uvml_sb_simplex_c::mode_out_of_order()
    */
   extern task mode_out_of_order();
   
   /**
    * TODO Describe uvml_sb_simplex_c::get_act()
    */
   extern task get_act(output T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::get_exp()
    */
   extern task get_exp(output T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::calc_act_stats()
    */
   extern virtual function void calc_act_stats(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::calc_exp_stats()
    */
   extern virtual function void calc_exp_stats(ref T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_new_act()
    */
   extern virtual function void log_new_act(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_new_exp()
    */
   extern virtual function void log_new_exp(ref T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_act_before_exp()
    */
   extern virtual function void log_act_before_exp(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_match()
    */
   extern virtual function void log_match(ref T_ACT_TRN act_trn, T_EXP_TRN exp_trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_mismatch()
    */
   extern virtual function void log_mismatch(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_drop()
    */
   extern virtual function void log_drop(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_sync_loss()
    */
   extern virtual function void log_sync_loss(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   /**
    * TODO Describe uvml_sb_simplex_c::on_new_act()
    */
   extern virtual task on_new_act(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::on_new_exp()
    */
   extern virtual task on_new_exp(ref T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::on_sync_loss()
    */
   extern virtual task on_sync_loss(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   /**
    * TODO Describe uvml_sb_simplex_c::purge_may_drops()
    */
   extern function void purge_may_drops(input bit skip_tail=0);
   
endclass : uvml_sb_simplex_c


function uvml_sb_simplex_c::new(string name="uvml_sb_simplex", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvml_sb_simplex_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvml_sb_simplex_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvml_sb_simplex_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   // Build TLM objects
   act_export  = new("act_export", this);
   exp_export  = new("exp_export", this);
   act_fifo    = new("act_fifo"  , this);
   exp_fifo    = new("exp_fifo"  , this);
   ap          = new("ap"        , this);
   
endfunction : build_phase


function void uvml_sb_simplex_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      // Connect TLM objects
      act_export.connect(act_fifo.analysis_export);
      exp_export.connect(exp_fifo.analysis_export);
   end
   
endfunction: connect_phase


task uvml_sb_simplex_c::run_phase(uvm_phase phase);
   
   T_EXP_TRN  exp_trn;
   T_ACT_TRN  act_trn;
   
   super.run_phase(phase);
   
   if (cfg.enabled) begin
      fork
         begin : exp
            forever begin
               get_exp       (exp_trn);
               calc_exp_stats(exp_trn);
               log_new_exp   (exp_trn);
            end
         end
         
         begin : act
            forever begin
               get_act       (act_trn);
               calc_act_stats(act_trn);
               log_new_act   (act_trn);
               
               case (cfg.mode)
                  UVML_SB_MODE_IN_ORDER    : mode_in_order    ();
                  UVML_SB_MODE_OUT_OF_ORDER: mode_out_of_order();
                   
                  default: begin
                     `uvm_error("SB_SIMPLEX", $sformatf("Invalid cfg.mode:%0d", cfg.mode))
                  end
               endcase
            end
         end
      join
   end
   
endtask: run_phase


function void uvml_sb_simplex_c::extract_phase(uvm_phase phase);
   
   super.extract_phase(phase);

   if (cfg.enabled) begin
      purge_may_drops();
   end
   
endfunction : extract_phase


function void uvml_sb_simplex_c::check_phase(uvm_phase phase);
   
   super.check_phase(phase);

   if (cfg.enabled) begin
      if (cntxt.exp_q.size() != 0) begin
         `uvm_error("SB_SIMPLEX", $sformatf("Expected queue is not empty! exp_q.size() = %0d", cntxt.exp_q.size()))
         foreach(cntxt.exp_q[ii]) begin
            `uvm_info("SB_SIMPLEX", $sformatf("exp_q[%0d]: \n%s", ii, cntxt.exp_q[ii].sprint()), UVM_MEDIUM)
         end
      end
      
      if (cntxt.match_count == 0) begin
         `uvm_error("SB_SIMPLEX", "Scoreboard did not see any matches during simulation")
      end
   end
   
endfunction: check_phase


task uvml_sb_simplex_c::mode_in_order();
   
   T_ACT_TRN   act_trn;
   T_EXP_TRN   exp_trn;
   uvm_object  act_obj;
   uvm_object  exp_obj;
   entry_t     entry;
   
   act_obj = cntxt.act_q.pop_front();
   if (!$cast(act_trn, act_obj)) begin
      `uvm_fatal("SB_SIMPLEX", $sformatf("Could not cast 'act_obj' (%s) to 'act_trn' (%s)", $typename(act_obj), $typename(act_trn)))
   end
   purge_may_drops(1'b1);
   entry = entry_t::type_id::create("entry");
   entry.actual = act_trn;
   
   if (cntxt.exp_q.size() == 0) begin
      log_act_before_exp(act_trn);
      entry.result = UVML_SB_ENTRY_RESULT_NO_EXPECTED;
   end
   else begin
      exp_obj = cntxt.exp_q[0];
      if (!$cast(exp_trn, exp_obj)) begin
         `uvm_fatal("SB_SIMPLEX", $sformatf("Could not cast 'exp_obj' (%s) to 'exp_trn' (%s)", $typename(exp_obj), $typename(exp_trn)))
      end
      if (exp_trn.compare(act_trn)) begin
         void'(cntxt.exp_q.pop_front());
         log_match(act_trn, exp_trn);
         cntxt.synced = 1;
         cntxt.match_count++;
         entry.expected = exp_trn;
         entry.result = UVML_SB_ENTRY_RESULT_MATCH;
      end
      else begin
         if (exp_trn.get_may_drop()) begin
            void'(cntxt.exp_q.pop_front());
            log_drop(act_trn, exp_trn);
            //cntxt.dropped++;
            entry.expected = exp_trn;
            entry.result = UVML_SB_ENTRY_RESULT_DROP;
         end
         else begin
            log_mismatch(act_trn, exp_trn);
            cntxt.missed_count++;
            entry.result = UVML_SB_ENTRY_RESULT_MISMATCH;
         end
      end
   end
   
   ap.write(entry);
   
endtask : mode_in_order


task uvml_sb_simplex_c::mode_out_of_order();
   
   T_ACT_TRN     act_trn;
   T_EXP_TRN     exp_trn;
   uvm_object    act_obj, exp_obj;
   bit           found_match = 0;
   int unsigned  exp_match_idx = 0;
   entry_t       entry;
   
   act_obj = cntxt.act_q.pop_front();
   if (!$cast(act_trn, act_obj)) begin
      `uvm_fatal("SB_SIMPLEX", $sformatf("Could not cast 'act_obj' (%s) to 'act_trn' (%s)", $typename(act_obj), $typename(act_trn)))
   end
   entry = entry_t::type_id::create("entry");
   entry.actual = act_trn;
   
   if (cntxt.exp_q.size() == 0) begin
      log_act_before_exp(act_trn);
      entry.result = UVML_SB_ENTRY_RESULT_NO_EXPECTED;
   end
   else begin
      foreach (cntxt.exp_q[ii]) begin
         exp_obj = cntxt.exp_q[ii];
         if (!$cast(exp_trn, exp_obj)) begin
            `uvm_fatal("SB_SIMPLEX", $sformatf("Could not cast 'exp_obj' (%s) to 'exp_trn' (%s)", $typename(exp_obj), $typename(exp_trn)))
         end
         if (exp_trn.compare(act_trn)) begin
            exp_match_idx = ii;
            found_match = 1;
            cntxt.match_count++;
            break;
         end
      end
      if (found_match) begin
         log_match(act_trn, exp_trn);
         cntxt.exp_q.delete(exp_match_idx);
         entry.expected = exp_trn;
         entry.result = UVML_SB_ENTRY_RESULT_MATCH;
      end
      else begin
         if (act_trn.get_may_drop()) begin
            log_drop(act_trn);
            entry.result = UVML_SB_ENTRY_RESULT_DROP;
         end
         else begin
            log_mismatch(act_trn);
            cntxt.missed_count++;
            entry.result = UVML_SB_ENTRY_RESULT_MISMATCH;
         end
      end
   end
   
   ap.write(entry);
   
endtask : mode_out_of_order


task uvml_sb_simplex_c::get_act(output T_ACT_TRN trn);
   
   act_fifo.get(trn);
   on_new_act  (trn);
   cntxt.act_observed_e.trigger(trn);
   
endtask : get_act


task uvml_sb_simplex_c::get_exp(output T_EXP_TRN trn);
   
   exp_fifo.get(trn);
   on_new_exp  (trn);
   cntxt.exp_observed_e.trigger(trn);
   
endtask : get_exp


function void uvml_sb_simplex_c::calc_act_stats(ref T_ACT_TRN trn);
   
   bit [7:0]  packed_trn[];
   
   void'(trn.pack_bytes(packed_trn));
   cntxt.act_observed++;
   cntxt.act_bits_observed += packed_trn.size();
   
   if (trn.has_error()) begin
      cntxt.act_bad_observed++;
      cntxt.act_bad_bits_observed += packed_trn.size();
   end
   else begin
      cntxt.act_good_observed++;
      cntxt.act_good_bits_observed += packed_trn.size();
   end
   
   cntxt.act_q     .push_back(trn);
   cntxt.act_time_q.push_back($realtime());
   
endfunction : calc_act_stats


function void uvml_sb_simplex_c::calc_exp_stats(ref T_EXP_TRN trn);
   
   bit [7:0]  packed_trn[];
   
   void'(trn.pack_bytes(packed_trn));
   cntxt.exp_observed++;
   cntxt.exp_bits_observed += packed_trn.size();
   
   if (trn.has_error()) begin
      cntxt.exp_bad_observed++;
      cntxt.exp_bad_bits_observed += packed_trn.size();
   end
   else begin
      cntxt.exp_good_observed++;
      cntxt.exp_good_bits_observed += packed_trn.size();
   end
   
   cntxt.exp_q     .push_back(trn);
   cntxt.exp_time_q.push_back($realtime());
   
endfunction : calc_exp_stats


function void uvml_sb_simplex_c::log_new_act(ref T_ACT_TRN trn);
   
   `uvm_info("SB_SIMPLEX", $sformatf("New actual transaction from %s: \n%s", trn.get_initiator(), trn.sprint()), UVM_HIGH)
   
endfunction : log_new_act


function void uvml_sb_simplex_c::log_new_exp(ref T_EXP_TRN trn);
   
   `uvm_info("SB_SIMPLEX", $sformatf("New expected transaction from %s: \n%s", trn.get_initiator(), trn.sprint()), UVM_HIGH)
   
endfunction : log_new_exp


function void uvml_sb_simplex_c::log_act_before_exp(ref T_ACT_TRN trn);
   
   `uvm_error("SB_SIMPLEX", $sformatf("Actual received before expected:\n%s", trn.sprint()))
   
endfunction : log_act_before_exp


function void uvml_sb_simplex_c::log_match(ref T_ACT_TRN act_trn, T_EXP_TRN exp_trn);
   
   `uvm_info("SB_SIMPLEX", "Actual and Expected match!", UVM_HIGH)
   
endfunction : log_match


function void uvml_sb_simplex_c::log_mismatch(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   if (exp_trn != null) begin
      `uvm_error("SB_SIMPLEX", $sformatf("Actual and Expected do not match: \nActual:\n%s \n Expected:\n%s", act_trn.sprint(), exp_trn.sprint()))
   end
   else begin
      `uvm_error("SB_SIMPLEX", $sformatf("Did not find match for Actual:\n%s", act_trn.sprint()))
   end
   
endfunction : log_mismatch


function void uvml_sb_simplex_c::log_drop(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   if (exp_trn != null) begin
      `uvm_warning("SB_SIMPLEX", $sformatf("Actual and Expected do not match, but expected is marked as 'may drop':\nActual:\n%s \n Expected:\n%s", act_trn.sprint(), exp_trn.sprint()))
   end
   else begin
      `uvm_warning("SB_SIMPLEX", $sformatf("Did not find match for Actual, but actual is marked as 'may drop':\n%s", act_trn.sprint()))
   end
   
endfunction : log_drop


function void uvml_sb_simplex_c::log_sync_loss(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   if (exp_trn != null) begin
      `uvm_error("SB_SIMPLEX", $sformatf("Loss of sync.\nActual:\n%s \n Expected:\n%s", act_trn.sprint(), exp_trn.sprint()))
   end
   else begin
      `uvm_error("SB_SIMPLEX", $sformatf("Loss of sync with no Expected.  Actual:\n%s", act_trn.sprint()))
   end
   
endfunction : log_sync_loss


task uvml_sb_simplex_c::on_new_act(ref T_ACT_TRN trn);
   
   
   
endtask : on_new_act


task uvml_sb_simplex_c::on_new_exp(ref T_EXP_TRN trn);
   
   
   
endtask : on_new_exp


task uvml_sb_simplex_c::on_sync_loss(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn);
   
   
   
endtask : on_sync_loss


function void uvml_sb_simplex_c::purge_may_drops(input bit skip_tail=0);
   
   int unsigned  may_drops[$];
   T_EXP_TRN     exp_trn;
   uvm_object    exp_obj;
   
   foreach (cntxt.exp_q[ii]) begin
      if (skip_tail && (ii == (cntxt.exp_q.size()-1))) begin
         continue;
      end
      
      exp_obj = cntxt.exp_q[ii];
      if (!$cast(exp_trn, exp_obj)) begin
         `uvm_fatal("SB_SIMPLEX", $sformatf("Could not cast 'exp_obj' (%s) to 'exp_trn' (%s)", $typename(exp_obj), $typename(exp_trn)))
      end
      if (exp_trn.get_may_drop()) begin
         may_drops.push_back(ii);
      end
   end
   
   foreach (may_drops[ii]) begin
      cntxt.exp_q.delete(may_drops[ii]);
   end
   
endfunction : purge_may_drops


`endif // __UVML_SB_SIMPLEX_SV__

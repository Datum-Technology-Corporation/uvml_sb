// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_SB_ST_PKG_SV__
`define __UVME_SB_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_hrtbt_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_trn_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_sb_macros.svh"
`include "uvme_sb_st_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types needed for an UVM environment capable of
 * self-testing an the Moore.io UVM Scoreboarding Library VIP.
 */
package uvme_sb_st_pkg;

   import uvm_pkg       ::*;
   import uvml_hrtbt_pkg::*;
   import uvml_logs_pkg ::*;
   import uvml_trn_pkg  ::*;
   import uvml_sb_pkg   ::*;
   import uvma_sb_pkg   ::*;

   // Constants / Structs / Enums
   `include "uvme_sb_st_constants.sv"
   `include "uvme_sb_st_tdefs.sv"

   // Objects
   `include "uvme_sb_st_cfg.sv"
   `include "uvme_sb_st_cntxt.sv"

   // Environment components
   `include "uvme_sb_st_cov_model.sv"
   `include "uvme_sb_st_prd.sv"
   `include "uvme_sb_st_vsqr.sv"
   `include "uvme_sb_st_env.sv"

   // Sequences
   `include "uvme_sb_st_base_vseq.sv"

endpackage : uvme_sb_st_pkg


// Module(s) / Checker(s)
`ifdef UVME_SB_ST_INC_CHKR
`include "uvme_sb_st_chkr.sv"
`endif


`endif // __UVME_SB_ST_PKG_SV__

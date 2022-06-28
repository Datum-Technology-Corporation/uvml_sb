// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_SB_PKG_SV__
`define __UVML_SB_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_sb_macros.svh"


/**
 * Encapsulates all the types needed for the Moore.io Scoreboard library.
 */
package uvml_sb_pkg;

   import uvm_pkg ::*;
   import uvml_pkg::*;

   // Constants / Structs / Enums
   `include "uvml_sb_tdefs.sv"
   `include "uvml_sb_constants.sv"

   // Objects
   `include "uvml_sb_simplex_cfg.sv"
   `include "uvml_sb_simplex_cntxt.sv"
   `include "uvml_sb_simplex_entry.sv"
   `include "uvml_sb_msimplex_cfg.sv"
   `include "uvml_sb_msimplex_cntxt.sv"
   `include "uvml_sb_duplex_cfg.sv"
   `include "uvml_sb_duplex_cntxt.sv"
   `include "uvml_sb_mduplex_cfg.sv"
   `include "uvml_sb_mduplex_cntxt.sv"

   // Scoreboard components
   `include "uvml_sb_simplex.sv"
   `include "uvml_sb_msimplex.sv"
   `include "uvml_sb_duplex.sv"
   `include "uvml_sb_mduplex.sv"

endpackage : uvml_sb_pkg


`endif // __UVML_SB_PKG_SV__

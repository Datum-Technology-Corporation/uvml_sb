// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_PKG_SV__
`define __UVMT_SB_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvmt_sb_st_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s)
`include "uvmt_sb_st_clknrst_gen_if.sv"


/**
 * Encapsulates all the types and test cases for self-testing the Moore.io UVM Scoreboarding Library.
 */
package uvmt_sb_st_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;
   import uvml_sb_pkg  ::*;

   // Constants / Structs / Enums
   `include "uvmt_sb_st_tdefs.sv"
   `include "uvmt_sb_st_constants.sv"

   // Components
   `include "uvmt_sb_st_cov_model.sv"
   `include "uvmt_sb_st_sqr.sv"
   `include "uvmt_sb_st_vsqr.sv"

   // Objects
   `include "uvmt_sb_st_test_cfg.sv"
   `include "uvmt_sb_st_seq_item.sv"

   // Sequences
   `include "uvmt_sb_st_base_vseq.sv"
   `include "uvmt_sb_st_vseq_lib.sv"

   // Base test
   `include "uvmt_sb_st_base_test.sv"
   `include "uvmt_sb_st_in_order_test.sv"
   `include "uvmt_sb_st_out_of_order_test.sv"

endpackage : uvmt_sb_st_pkg


// Module(s) / Checker(s)
`include "uvmt_sb_st_tb.sv"


`endif // __UVMT_SB_ST_PKG_SV__

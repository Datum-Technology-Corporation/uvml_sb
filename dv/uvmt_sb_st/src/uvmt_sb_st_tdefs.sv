// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_SB_ST_TDEFS_SV__
`define __UVMT_SB_ST_TDEFS_SV__


/**
 * Scoreboarding entry type for this test-bench
 */
typedef uvml_sb_simplex_entry_c #(
   .T_ACT_TRN(uvmt_sb_st_seq_item_c),
   .T_EXP_TRN(uvmt_sb_st_seq_item_c)
) uvmt_sb_st_entry_t;


`endif // __UVMT_SB_ST_TDEFS_SV__

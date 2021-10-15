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

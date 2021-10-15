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


`ifndef __UVML_SB_TDEFS_SV__
`define __UVML_SB_TDEFS_SV__


/**
 * 
 */
typedef enum {
   UVML_SB_MODE_IN_ORDER    ,
   UVML_SB_MODE_OUT_OF_ORDER
} uvml_sb_mode_enum;

/**
 * 
 */
typedef enum {
   UVML_SB_ENTRY_RESULT_MATCH      ,
   UVML_SB_ENTRY_RESULT_DROP       ,
   UVML_SB_ENTRY_RESULT_MISMATCH   ,
   UVML_SB_ENTRY_RESULT_NO_EXPECTED
} uvml_sb_entry_result_enum;


`endif // __UVML_SB_TDEFS_SV__

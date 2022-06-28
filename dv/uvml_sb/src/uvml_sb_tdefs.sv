// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
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
   UVML_SB_ENTRY_REDULT_NO_ACTUAL    ,
   UVML_SB_ENTRY_RESULT_MATCH        ,
   UVML_SB_ENTRY_RESULT_DROP_ACTUAL  ,
   UVML_SB_ENTRY_RESULT_DROP_EXPECTED,
   UVML_SB_ENTRY_RESULT_MISMATCH     ,
   UVML_SB_ENTRY_RESULT_NO_EXPECTED  
} uvml_sb_entry_result_enum;


`endif // __UVML_SB_TDEFS_SV__

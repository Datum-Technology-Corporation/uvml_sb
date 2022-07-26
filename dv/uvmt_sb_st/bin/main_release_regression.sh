#! /bin/bash
########################################################################################################################
## Copyright 2021-2022 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvml_sb project sim dir
mio sim     uvmt_sb_st -CE
mio sim     uvmt_sb_st -S -t in_order -s 1 -c
#mio sim     uvmt_sb_st -S -t out_of_order -s 1 -c
mio results uvmt_sb_st results
mio cov     uvmt_sb_st

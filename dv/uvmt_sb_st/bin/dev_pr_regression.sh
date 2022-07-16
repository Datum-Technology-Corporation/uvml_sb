#! /bin/bash
########################################################################################################################
## Copyright 2021 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvml project sim dir
shopt -s expand_aliases
source ~/.bashrc
mio cpel    uvmt_sb_st
mio sim     uvmt_sb_st -t in_order -s 1 -c
#mio sim     uvmt_sb_st -t out_of_order -s 1 -c
mio results uvmt_sb_st results
mio cov     uvmt_sb_st

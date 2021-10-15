# About
## [Home Page](https://datum-technology-corporation.github.io/uvml_sb/)
The Moore.io UVM Scoreboarding Library is a vital component to any self-checking test bench.  This project consists of the library (`uvml_sb_pkg`) and its self-testing UVM Test Bench (`uvmt_sb_st_pkg`).

## IP
* DV
> * uvml_sb
> * uvmt_sb_st
* RTL
* Tools


# Simulation
```
cd ./sim
cat ./README.md
./setup_project.py
source ./setup_terminal.sh
export VIVADO=/path/to/vivado/install
dvm --help
clear && dvm cmp uvml_sb
```

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
**1. Change directory to 'sim'**

This is from where all jobs will be launched.
```
cd ./sim
```

**2. Project Setup**

Only needs to be done once, or when libraries must be updated. This will pull in dependencies from the web.
```
./setup_project.py
```

**3. Terminal Setup**

This must be done per terminal. The script included in this project is for bash:

```
export VIVADO=/path/to/vivado/bin # Set locaton of Vivado installation
source ./setup_terminal.sh
```

**4. Launch**

All jobs for simulation are performed via `dvm`.

> At any time, you can invoke its built-in documentation:

```
dvm --help
```

> To run test 'in_order' with seed '1' and wave capture enabled:

```
clear && dvm all uvmt_sb_st -t in_order -s 1 -w
```

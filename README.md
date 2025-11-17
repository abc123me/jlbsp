# JL-BSP
This is a buildroot framework used for my personal raspberry pis and other development

## Usage

**USE AT YOUR OWN RISK**

This external framework is managed via a simple shell script to configure, setup, and run builds. See below:
```
Usage: ./bsp <operation>
Operations:
  setup <board> - Sets up a build for a given board
  build <board> - Builds the given board
  list          - Lists all available boards
  help          - Shows this menu
```

Using `./bsp build` is not required, and `make all` in the build directory can be used instead.

Required tooling: `fd-find python3 bash git make gcc`

## Config files

Buildroot .config / defconfig files are generated via `gencfg.py` which adds syntax for including config files via `#include <config>`, these configs are sourced from either the external framework or the buildroot branch the target uses. Including a config that is named the same in both buildroot as in this framework will result in undefined behavior hence all configs are suffixed with `.config` for actual boards, and `.frag` for fragments.

### Developmental builds

Name        | Support | Description
------------|---------|------------------------------------------
amd64-dev   | ⚠️      | X86 / AMD64 developmental image
rpi5-dev    | ✅      | RPi 5 developmental image
rpi2-dev    | ✅      | RPi 2 developmental image
rpi0w-dev   | ✅      | RPi 0 developmental image (with wifi)

### Primary builds

Name     | Support | For          | Description
---------|---------|--------------|------------------------------------------
rpi-ntp  | ✅      | RPi 2 w/ GPS | Raspberry pi based NTP server
tdisp    | ✅      | BPi M2 Zero  | Banana pi based clock / time display

## Packages

Name                                                                    | Used By | Description
------------------------------------------------------------------------|---------|-------------------------------------------------------------------------
[jl-secret-keys](https://shattereddisk.github.io/rickroll/rickroll.mp4) | all     | Git repository containing my SSH keys and wifi credentials
[driver-74hc595](https://github.com/abc123me/driver-74hc595)            | tdisp   | Driver for translating raw data into GPIO pins on the 74HC595
[time-display](https://github.com/abc123me/time-display)                | tdisp   | Userspace app for updating the digits on my time display
[bpi-wifi-fw](https://github.com/abc123me/bpi-m2-zero-wifi-fw)          | tdisp   | WiFi firmware for the BananaPi M2 Zero

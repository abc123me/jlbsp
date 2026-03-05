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

Required tooling: `fd-find python3 bash git make gcc` and [buildroot requirements](https://buildroot.org/downloads/manual/manual.html#requirement-mandatory)

## Config files

Buildroot .config / defconfig files are generated via `gencfg.py` which adds syntax for including config files via `#include <config>`, these configs are sourced from either the external framework or the buildroot branch the target uses. Including a config that is named the same in both buildroot as in this framework will result in undefined behavior hence all configs are suffixed with `.config` for actual boards, and `.frag` for fragments.

### Config file syntax

Normal buildrood configuration but with the below extended syntax:

 - `#include <filename>` recursively includes another configuration file
 - `#include_only <option> <filename>` recursively includes only one configuration entry from anothjer configuration file
 - `#unclude <filename>` recursively un-includes everything in another configuration file

Future planned additional syntax:

- `#ifyes, #ifno, #ifeq, #ifunset, #else, #endif`

## Supported builds

### Developmental builds

Name          | Support | Description
--------------|---------|------------------------------------------
amd64-dev     | ⚠️🖧🖮🖵   | X86 / AMD64 developmental image
rpi5-dev      | ✅🖧     | RPi 5 developmental image
rpi2-dev      | ✅🖧     | RPi 2 developmental image
rpi0w-dev     | ✅🌐    | RPi 0 developmental image (with wifi)
lepotato-dev  | ✅🖧💾   | Libre Le-Potato developmental image
radxa0-3e-dev | ✅🖧     | Libre Le-Potato developmental image
thinkpad390e  | ✅🖧🖮🖵 | Pentium II based Thinkpad 390E
z7lite-dev    | ✅🖧⚙️   | Off-brand chinese Zynq-7010 dev board
ultrazed-dev  | ✅🖧⚙️   | Avnet ZU3EG SOM with an UltraCarrier dev board


### Primary builds

Name          | Support | For          | Description
--------------|---------|--------------|-----------------------------------------------------------------
ntp           | ✅🖧🛰️   | RPi 2 w/ GPS | Local Stratum 0 GPS based NTP server
tdisp         | ✅🌐⚙️  | BPi M2 Zero  | 7-Segment clock / time display, needs special bpi-wifi-fw
wg-proxy      | ✅🖧🧱   | RPi 5        | Wireguard proxy that forwards media server / VM
led-alarm     | ✅🌐⚙️   | RPi 0w       | LED alarm clock that uses a WS2812 led strip

### Support legend

Symbol | Meaning
-------|------------------------------
⚠️     | Danger, not regularly tested
✅     | Regularly built and tested
🖧      | Has ethernet support
🌐     | Has wireless (wifi) support
💾     | Has eMMC support
🖵      | Has graphics / fb support
🖮      | Has input support
🛰️     | Has GPS support
🧱     | Has firewall / iptables support
⚙️     | Has custom drivers / software

## Packages

Name                                                                    | Used By   | Description
------------------------------------------------------------------------|-----------|-------------------------------------------------------------------------
[bad-apple-frames](https://github.com/pikapower9080/bad-apple-frames)   | N/A       | Frame and audio files for bad apple
[bad-apple-rs](https://github.com/abc123me/bad-apple-rs)                | N/A       | Rust program that plays bad apple using fbgl-rs
[btop](https://github.com/aristocratos/btop)                            | dev       | Better version of top, rewrite of bashtop in C++
[bpi-wifi-fw](https://github.com/abc123me/bpi-m2-zero-wifi-fw)          | tdisp     | WiFi firmware for the BananaPi M2 Zero
[driver-74hc595](https://github.com/abc123me/driver-74hc595)            | tdisp     | Driver for translating raw data into GPIO pins on the 74HC595
[fbgl-rs](https://github.com/abc123me/fbgl-rs)                          | N/A       | My FBGL graphics library ported to Rust
[jl-secret-keys](https://shattereddisk.github.io/rickroll/rickroll.mp4) | all       | Repository containing SSH, WiFI, and VPN keys / credentials
[led-alarm](https://github.com/abc123me/led-alarm)                      | led-alarm | LED alarm clock daemon and web files
[libconfig-rw](https://github.com/abc123me/libconfig-rw)                | led-alarm | Simple tool for reading/writing to libconfig style config files
[time-display](https://github.com/abc123me/time-display)                | tdisp     | Userspace app for updating the digits on my time display
[tty-resize](https://github.com/abc123me/tty-resize)                    | all       | Simple program to resize a TTY
[zynq-bit2bin](https://github.com/railnova/zynq-bit2bin)                | N/A       | Convert Xilinx FPGA bitstream from .bit to .bin

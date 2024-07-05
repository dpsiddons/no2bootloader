/*
 * boards.vh
 *
 * vim: ts=4 sw=4 syntax=verilog
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`ifdef BOARD_BITSY_V0
	// 1bitsquared iCEbreaker bitsy prototypes (v0.x)
	`define HAS_RGB
`elsif BOARD_BITSY_V1
	// 1bitsquared iCEbreaker bitsy prod (v1.x)
	`define HAS_RGB
`elsif BOARD_ICEBREAKER
	// 1bitsquared iCEbreaker
	`define HAS_RGB
`elsif BOARD_ICEPICK
	// iCEpick
	`define PLL_CORE
	`define MISC_SEL 2'b11
	`define HAS_RGB
`elsif BOARD_ICE1USB
	// icE1usb
		// 30.72M input, 48M output
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0011000
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b011
	`define HAS_RGB
`elsif BOARD_E1TRACER
	// osmocom E1 tracer
	`define PLL_CORE
	`define MISC_SEL 2'b11
`elsif BOARD_FOMU_HACKER
	// FOMU Hacker version
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0001111
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b100
	`define HAS_RGB
`elsif BOARD_FOMU_PVT1
	// FOMU PVT1 (prod version)
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0001111
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b100
	`define HAS_RGB
`elsif BOARD_REDIP_SID
	// reDIP-SID
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0011111
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b010
	`define HAS_1LED
`elsif BOARD_ICE40_USBTRACE
	// iCE40 USB trace ( https://gitea.osmocom.org/electronics/ice40-usbtrace )
	`define HAS_RGB
`elsif BOARD_ICE_DONGLE
	// @emeb ice-dongle
	`define HAS_RGB
`elsif BOARD_XMAS_SNOOPY
	// @tnt xmas-snoopy led controller
	`define USE_HF_OSC
	`define MISC_SEL 2'b10

`elsif BOARD_TT_ASIC_SIM
	`define HAS_USB
	// TT ASIC simulator
	// 20M input, 48M output
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_DIVR 4'b0001
	`define PLL_DIVF 7'b1001100
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b001
	
	
`elsif BOARD_TT04_ASIC_SIM
	`define HAS_USB
	`define HAS_RGB
	`define USE_HF_OSC
	
	
`elsif BOARD_ANYTHING_PMOD
	`define HAS_USB
	`define HAS_RGB
	`define RGB_MAP 12'h021		// 41=Red, 40=Blue, 39=Green
	// TT ASIC simulator
	// 24M input, 48M output, from icepll -i 24 -o 48
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0011111
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b010
`endif


// Defaults
	// PLL params 12M input, 48M output
`ifndef PLL_CUSTOM
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0111111
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b001
`endif

`ifdef USE_HF_OSC
	`define PLL_CORE
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0111111
	`define PLL_DIVQ 3'b100
	`define PLL_FILTER_RANGE 3'b001
`endif

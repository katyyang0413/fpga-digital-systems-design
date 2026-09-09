# FPGA Digital Systems Design

This repository contains a selection of FPGA and digital systems projects completed as part of my Computer Engineering degree at Trinity College Dublin.

The projects were developed using Verilog HDL and Xilinx Vivado and were designed for implementation on the Basys-3 FPGA board. The work involved combinational and sequential logic design, simulation, testbenches, FPGA implementation and hardware testing.

> **Note:** These projects were originally completed on a previous laptop. After changing laptops, I was only able to recover part of the original project files and source code. This repository therefore contains the source files and reports that I was able to retrieve rather than the complete original Vivado projects.

---

## 6-bit Mini-ALU

The Mini-ALU was the main FPGA assignment and involved designing and implementing a 6-bit Arithmetic Logic Unit using Verilog.

The ALU takes two 6-bit inputs, A and B, represented using two's complement, and a 3-bit function selector.

It supports eight different operations:

| fxn | Operation |
| --- | --- |
| 000 | Output A |
| 001 | Output B |
| 010 | -A |
| 011 | -B |
| 100 | A < B |
| 101 | A XNOR B |
| 110 | A + B |
| 111 | A - B |

The design used a hierarchical structure with smaller Verilog modules connected together. A 1-bit full adder and 6-bit ripple-carry adder from previous lab work were reused as part of the arithmetic section of the ALU.

A testbench was used to test the different arithmetic and logical operations before the design was synthesised and implemented using Vivado.

The completed design was then programmed onto a Basys-3 FPGA, using the board switches for the inputs and function selector and the LEDs to display the 6-bit result.

### Implementation Results

- Implemented and tested on a Basys-3 FPGA
- 31 LUTs used out of 20,800 available (~0.15%)
- 31 I/O pins used
- No failing timing paths
- Worst Negative Slack (WNS): 0 ns
- Total Negative Slack (TNS): 0 ns

The original Verilog source files for this assignment were not recovered when I changed laptops, but the submitted project report is included in the [`mini-alu`](mini-alu/) folder. It contains the design structure, simulation results, Vivado implementation results and photographs of the design running on the FPGA.

---

## D Flip-Flop and Counter

This lab focused on sequential digital logic and implementing flip-flop based designs on the FPGA.

The work included using D-type flip-flops, clocked logic and a counter design, together with a constraints file for mapping the design to the physical inputs and outputs of the Basys-3 board.

The recovered files include Verilog source/testbench files and the FPGA constraints file.

Some supporting modules from the original Vivado project could not be recovered, so this folder represents only the parts of the original lab that are still available.

Files can be found in the [`flip-flop-counter`](flip-flop-counter/) folder.

---

## 21-bit LFSR

This project involved designing a 21-bit Linear Feedback Shift Register (LFSR) in Verilog.

The LFSR uses feedback logic to generate a repeating pseudo-random binary sequence. The design was first tested using a Verilog testbench and was then integrated into a larger top-level FPGA design.

This project involved:

- Sequential logic design
- Shift registers
- Feedback logic
- Verilog testbenches
- Clock handling
- FPGA I/O mapping
- Vivado simulation and implementation

The recovered source includes the LFSR module and its testbench, as well as top-level, clock and constraints files from the FPGA implementation.

Files can be found in the [`lfsr`](lfsr/) folder.

---

## Tools and Technologies

- Verilog HDL
- Xilinx Vivado
- Basys-3 FPGA
- Digital logic design
- FPGA synthesis and implementation
- Testbenches and simulation
- Timing analysis
- FPGA constraints (.xdc)

---

## Repository Structure

```text
fpga-digital-systems-design/
│
├── mini-alu/
│   └── Assign1_Yang.pdf
│
├── flip-flop-counter/
│   ├── dff_tb.v
│   ├── top_module.v
│   └── practicaldff.xdc
│
├── lfsr/
│   ├── lfsr_21bit.v
│   ├── lfsr_21bit_tb.v
│   ├── clock.v
│   ├── partD_top.v
│   └── partD.xdc
│
└── README.md
```

## About

These projects were completed as part of my Digital Systems Design coursework at Trinity College Dublin and gave me practical experience designing, simulating and implementing digital systems using Verilog and FPGA hardware.

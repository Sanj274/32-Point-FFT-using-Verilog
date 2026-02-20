# 32-Point FFT using Verilog (DIT Architecture)

## Overview
This project presents a hardware implementation of a 32-point Fast Fourier Transform (FFT) using Verilog, based on the Decimation-in-Time (DIT) butterfly algorithm.

The design is modular and optimized for hardware implementation, making it suitable for FPGA or ASIC-based digital signal processing systems.

---

## Objective
- Implement a 32-point FFT using DIT algorithm
- Develop modular Verilog components for FFT computation
- Enable parallel processing and efficient memory usage
- Validate correctness using simulation and testbench

---

## Architecture

The design is divided into the following core modules:

### 1. Butterfly Unit (BFU)
- Performs complex addition and subtraction
- Executes twiddle factor multiplication
- Implements the core FFT butterfly operation:
  
  Y[i]  = X[i] + W × X[j]  
  Y[j]  = X[i] − W × X[j]

---

### 2. Address Generation Unit (AGU)
- Generates read/write addresses for RAM
- Controls FFT stage progression
- Signals completion using `fft_done`

---

### 3. Twiddle Factor ROM
- Stores precomputed complex exponential values
- Supplies rotation factors for each stage

---

### 4. Dual-Port RAM
- Enables simultaneous read and write operations
- Supports high-throughput FFT computation
- Stores intermediate stage outputs

---

### 5. MUX
- Controls data selection during read operations
- Maintains proper stage-wise data flow

---

## Implementation Details

- Algorithm: Decimation-In-Time (DIT)
- Data Representation: Fixed-point complex format
- Parallel butterfly operations
- Modular design for scalability
- Written entirely in Verilog HDL

---

## 8-Point FFT (Intermediate Stage)

An 8-point FFT module was first implemented and verified before scaling to 32-point architecture.

Modules implemented:
- Complex multiplier
- Complex adder
- Complex subtractor
- Butterfly logic

---

## 32-Point FFT Design

The 32-point FFT:
- Divides input into smaller FFT blocks
- Applies butterfly operations in stages
- Uses twiddle factor multiplication between stages
- Produces 32 frequency-domain outputs

Testbench included to validate:
- Functional correctness
- Output waveform behavior
- Proper stage transitions

---

## Key Features

- Modular hardware architecture
- Parallel processing capability
- Efficient memory management using dual-port RAM
- Scalable to larger FFT sizes
- Suitable for FPGA implementation
- Low-latency signal processing

---

## Applications

- Digital Signal Processing (DSP)
- Wireless Communication Systems
- OFDM Systems
- Audio/Video Processing
- Radar Signal Analysis

---

## Tools Used

- Verilog HDL
- Simulation Tool (ModelSim / equivalent)
- RTL verification

---

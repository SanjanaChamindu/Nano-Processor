# 4-Bit Nanoprocessor Design

## Project Overview
This repository contains the design and implementation of a simple 4-bit nanoprocessor capable of executing a set of four basic instructions. The project is part of the CS1050 Computer Organization and Digital Design course at the University of Moratuwa.

The main components include:
- 4-bit arithmetic unit for addition and subtraction of signed integers
- Instruction decoder
- Program counter and multiplexers
- Register bank and program ROM

## Features
- **4-Bit Arithmetic Unit**: Supports addition and subtraction using 2’s complement representation.
- **Instruction Set**: 
  - `MOVI R, d`: Move immediate value `d` to register `R`
  - `ADD Ra, Rb`: Add the values in registers `Ra` and `Rb` and store the result in `Ra`
  - `NEG R`: Compute the 2’s complement of the value in register `R`
  - `JZR R, d`: Jump to address `d` if the value in register `R` is zero
- **Register Bank**: Consists of 8 registers, where `R0` is hardcoded to zero.
- **Program ROM**: Stores assembly programs, which are hardcoded in machine code.
- **Slow Clock**: The processor runs on a slow clock with a tick rate of 2 to 3 seconds to allow observation of program execution.

## Project Structure
- **VHDL Codes**: Includes the VHDL code for all major components (arithmetic unit, program counter, multiplexers, register bank, etc.).
- **Assembly Program**: A simple program that calculates the total of all integers between 1 and 3, with the final result stored in `R7`.
- **Simulation Files**: Test simulations to verify the functionality of the nanoprocessor.
- **Lab Report**: Documentation of the design process, timing diagrams, and contributions of each team member.

## Getting Started
### Prerequisites
- **BASYS 3 FPGA Board**: The design is tested on the BASYS 3 FPGA board.
- **Vivado Design Suite**: Required to synthesize and simulate the VHDL design.

### Setup
1. Clone the repository:  
   ```bash
   git clone https://github.com/SanjanaChamindu/Nano-Processor.git
   ```
2. Open the project in Vivado.
3. Synthesize and implement the design.
4. Load the bitstream onto the BASYS 3 FPGA board.

### Running the Program
1. Reset the processor using the designated pushbutton.
2. The assembly program will execute on the slow clock, with results displayed on the LEDs and the 7-segment display.
3. Monitor the output of register `R7` to verify the correct execution of the program.

## Contributions
@SanjanaChamindu - Chamindu Sanjana<br /> 
@NirukshaSandeepa - Niruksha Sandeepa

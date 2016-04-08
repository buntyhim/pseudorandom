# hardware-programming
Hardware programming with Verilog on FPGAs. Worked with Aakash Verma on LFSRs for pseudorandom output generation.

![FPGA Prototyping](https://github.com/madhav-datt/hardware-programming/blob/master/Resources/fpga.jpg)

An LFSR is a shift register that, when clocked, advances the signal through the register from one bit to the next most-significant bit. Some of the outputs are combined in exclusive-OR configuration to form a feedback mechanism. A linear
feedback shift register can be formed by performing exclusive-OR on the outputs of two or more of the flip-flops together and
feeding those outputs back into the input of one of the flip-flops.  When the outputs of the flip-flops are loaded with a seed value and when the LFSR is clocked, it will generate a pseudorandom pattern of 1s and 0s.



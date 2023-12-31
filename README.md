# MIPS-Singe-Cycle-Processor
MIPS (Microprocessor without Interlocked Pipelined Stages) is a family of reduced instruction set computer (RISC) instruction set architectures (ISA). This is my implementation of a 32-bit single-cycle MIPS processor in Verilog HDL, created according to the general principles described in the book "Digital Design and Computer Architecture" by David Harris and Sarah Harris.

Refer to this book for a better understanding of how this code works. 

I used the QuestaSim simulation environment to simulate the operation of the designed device and VIVADO for evaluating the RTL and the Synthesis design.

Supported instructions:
- ADD
- SUB
- SLT
- MUL
- J
- BEQ
- ADDI
- LW
- SW

The structure of machine codes for processor instructions — MIPS instructions formats:

  ![mips_instructions_formats](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/d324c9ba-2c76-43f1-b36b-2f4d0d76a2ae)


  Processor Structure:
  
  ![Screenshot (494)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/fd2dfd57-3fb0-4c51-93ec-52e64db256e1)


  TOP MODULE View:
  
  ![Screenshot (501)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/da8d4ad9-fe16-4d34-b75d-b3fd62e8a949)


  The Control_Unit Specs:
  1) Control_Unit Structure:

     ![Screenshot (496)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/f10a9f5a-d9ea-4baf-8f90-8021ce3ead26)


 2) ALU_Decoder
    
    ![Screenshot (497)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/0a968cc9-b220-47a8-81f7-5795ebfb8bc0)


 3) Main_Decoder
    
    ![Screenshot (500)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/f9fa9253-d134-40f1-8afc-95064b9c238c)


Simulation result for Program1_Machine_Code (GCD of 240 and 210) in QuestaSim:

![Program1](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/fcda08b9-2ab2-4eef-a86e-a0017903fba3)


Simulation result for Program2_Machine_Code (Factorial of 8 (8!)) in QuestaSim:

![Program2](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/c1fb0bc6-69f7-49f3-ba22-43e02c7917ac)


RTL Design of the TOP_MODULE in VIVADO:

![Screenshot (493)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/a23ce52d-6a4d-4fed-a62d-6053d3fd76d1)


Synthesis Design of the TOP_MODULE in VIVADO:

![Screenshot (495)](https://github.com/EngAhmed21/MIPS-Singe-Cycle-Processor/assets/90782588/2069d72f-26c7-46ff-a113-d4653fe517fa)

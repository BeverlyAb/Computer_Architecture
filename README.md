## Computer_Architecture
# Introduction: 
This was a collaborative effort between my lab partner, Kyle Lee, and me as we implemented MIPS datapath by simulating a behavioral model written in Verilog.  

I look back at these codes after taking my FPGA Design class and see that there were errors in our semantics. To see better practice of Verilog look at my FPGA Respository, otherwise be cautious about following these codes as examples. 
The concept is there, but the semantics are inconsistent.


# Pipeline:  

Creates instances of the IF,ID, EXECUTE, MEMORY, and WB modules. The EX/MEM address input and the select signal for the multiplexer portion of the IF module will be initialized to 0, while the wires for ID are set based on the overall diagram on  Lab 1-2. 

For the final implementation of the MIPS datapath, mem.v's memory reads from the added risc.txt file. To verify that the pipeline functions correctly, within the 24 cycles REG[1] should iterate from 1, 3, 6, and 12.  

Altogether the pipeline is dynamic. The connections divvies with functionality ranging from iterator through addresses, selecting when to initiate jumps, accessing and writing to memory, and parsing/decoding instructions in order to finally execute them.

There appears to be formatting issues after uploading the files from ISE Design Suite 14.7.

*Feel free to use my work as a reference, but please refrain from copying code to serve as assignments in computer science related courses.* 

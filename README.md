# M-extention-for-riscv 
## The Multiply unit (mul_try)
## MADE BY : 2019ee25unioni
Multiply and divide for the risc v 32bit

The multiply unit uses only unsigned numbers generated from M_unit 
It also takes variable cycles to calculate depending on the number you give it
ie if 00100 and 00011 is multiplied we first need to take the bigger value of the two and put it into a register (A_reg)
we need a flag from the RISC V Comparator to tell us which number is bigger (unsigned comparasion) 
then we preform a check on it using or operation, this is the check bit 
next we take the lesser term and make it's indivisual bits the selector of mux
if the bit is 1 then we add the term to a 64 bit register (Mul_reg) and then left shift the A_reg by 1
we also right shift(zero added) the check register and use it in the conditions for calculations 
to start calculations we only need to give it a high start signal then wait till we get the input, then turn the start signal off




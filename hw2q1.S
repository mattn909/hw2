#### Matthew Nguyen
	
# EECE.3170: Microprocessors I
# UMass Lowell
#
.global    main

.data
# Remember, an word is a signed word (32 bits)
a:      .word       8192
# define the remaining variable
b:	.word 65536		    
c:      .word 17
x:      .word 10
z:      .space 32

.text
.set       noreorder
.ent       main

main:
## In this part, you need to convert the following C statement into MIPS
##   	int a = 8192, b = 65536, c = 17, x = 10, z;
##      a |= b;
##	z = 3*c + a*x;
##	z -= a;
## Your code goes here using the following procedure.
## 1. Define variables in data section (a, b, c, x, z)
##    "a" is already given as an example. 
##    Note that "z" needs a different definition as it doesn't have initial value.
## 2. Load each variable into temporary registers.
## 3. Implement the above arithmetic statment. 
##    During C to MIPS translation, follow the overflow behaviors in C.
##    Use the temporary registers to keep the intermediate results.
## 4. Store the result into "z".
        
    OR a,a,b
    MUL $t01, 3, c
    MUL $t02, a, x
    ADDU z, $t01, $t02
    SUBU z, z, a
    

# This code simply loops infinitely -- we will cover jump (j) instructions soon
spin:   j          spin
    nop

       .end        main
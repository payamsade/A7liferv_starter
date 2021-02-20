	.arch armv6
	.global doRow
	
	.cpu cortex-a53
	.equ 	NUL, 0
	.equ 	FP_OFFSET, 16	//<FIX-ME>:fill in with appropriate value -> (# of saved regs - 1) * 4 
				//'16' is just a place holder to make sure that the starter code 
				//compiles. It should be updated depending on the # of saved regs you 
				// use in your assembly program
		
	.align 4
	.text

// TODO: Write doRow

doRow:

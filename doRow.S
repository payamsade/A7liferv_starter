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
	/////////////////////PROLOGUE//////////////////////////////
	push	(r4-r9, fp, lr}		// use r4-r9 protected regs
	add	fp, sp, FP_OFFSET	// locate our frame pointer
	// prologue from A6
	// You can use temporary r0-r3 and preserved r4-r9
	// Store return value (results) in r0
	///////////////////////////////////////////////////////////




	//write your code here





	/////////////////EPILOGUE/////////////////////////////////
	sub	sp, fp, FP_OFFSET	// restore sp
	pop	{r4-r9,fp, lr}		// restore saved registers
	bx	lr			// function return
	.size	doRow,(. - doRow)	// What is this?
	//////////////////////////////////////////////////////////

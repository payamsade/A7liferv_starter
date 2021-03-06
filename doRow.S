	.arch armv6
	.global doRow
	
	.cpu cortex-a53
	.equ 	NUL, 0
	.equ 	FP_OFFSET, 20	//<FIX-ME>:fill in with appropriate value -> (# of saved regs - 1) * 4 
				//'16' is just a place holder to make sure that the starter code 
				//compiles. It should be updated depending on the # of saved regs you 
				// use in your assembly program
		
	.align 4
	.text

// TODO: Write doRow

doRow:
	/////////////////////PROLOGUE//////////////////////////////
	push	{r4-r7, fp, lr}		// use r4-r9 protected regs
	add	fp, sp, #FP_OFFSET	// locate our frame pointer
	// prologue from A6
	// You can use temporary r0-r3 and preserved r4-r9
	// Store return value (results) in r0
	///////////////////////////////////////////////////////////




	//write your code here
		ADD 		r2, r2, #1 // srcEnd ++;
loop:		CMP		r1, r2 // while(srcStart != srcEnd)
		BEQ		end // .
		MOV		r4, #0 // reqNum = 0;

		MOV		r5, r1 //&srcStart
	//	MUL 		r3, r3, #1 //to account for each array value
		SUB 		r5, r5, r3 //.
		SUB 		r5, r5, #1 //srcStart =srcStart-cols-1
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart-cols-1)

		MOV		r5, r1 //&srcStart
	//	MUL 	r3, r3, #1 //to account for each array value
		SUB 		r5, r5, r3 //srcStart =srcStart-cols
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart-cols)
		
		MOV		r5, r1 //&srcStart
	//	MUL 	r3, r3, #1 //to account for each array value
		SUB 		r5, r5, r3 //.
		ADD 		r5, r5, #1 //srcStart =srcStart-cols+1
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart-cols+1)
		
		MOV		r5, r1 //&srcStart
		SUB 		r5, r5, #1 //srcStart =srcStart-1
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart-1)

		MOV		r5, r1 //&srcStart
		ADD 		r5, r5, #1 //srcStart =srcStart+1
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart+1)

		MOV		r5, r1 //&srcStart
	//	MUL 		r3, r3, #1 //to account for each array value
		ADD 		r5, r5, r3 //.
		SUB 		r5, r5, #1 //srcStart =srcStart+cols-1
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart+cols-1)

		MOV		r5, r1 //&srcStart
	//	MUL 		r3, r3, #1 //to account for each array value
		ADD 		r5, r5, r3 //srcStart =srcStart+cols
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart+cols)

		MOV		r5, r1 //&srcStart
	//	MUL 		r3, r3, #1 //to account for each array value
		ADD 		r5, r5, r3 //.
		ADD 		r5, r5, #1 //srcStart =srcStart+cols+1
		LDRB 		r5, [r5] // .
		ADD 		r4, r4, r5 // reqNum += *(srcStart+cols+1)
		
		LDRB 		r6, [r1] // *srcStart
		CMP 		r6, #1 // if (*srcStart == 1)
		BEQ 		alive //.
		CMP		r6, #1 // if (*srcStart != 1)
		BNE 		dead //?? Not sure if I can do this.. else
		B		loop  //?? do we need to push before, pop after?
		
alive: 		CMP 	r4, #2 		//if (reqNum == 2)
		BEQ		newAlive
		CMP 		r4, #3 // if (reqNum == 3)
		BEQ		newAlive
		B		newDead //?? Not sure if I can do this.. else 

dead:		CMP 	r4, #3 		// if (reqNum == 3)
		BEQ		newAlive
		B		newDead //?? Not sure if I can do this.. else

newAlive: 	MOV		r7, #1 // x = 1;
		STRB		r7, [r0] // *dest = x
		ADD 		r0, r0, #1 //dest++
		ADD		r1, r1, #1 //srcStart++
		B 		loop // iterate loop

newDead: 	MOV		r7, #0 // x = 0;
		STRB		r7, [r0] // *dest = x
		ADD 		r0, r0, #1 //dest++
		ADD		r1, r1, #1 //srcStart++
		B 		loop // iterate loop

end:





	/////////////////EPILOGUE/////////////////////////////////
	sub	sp, fp, #FP_OFFSET	// restore sp
	pop	{r4-r7,fp, lr}		// restore saved registers
	bx	lr			// function return
	.size	doRow,(. - doRow)	// What is this?
	//////////////////////////////////////////////////////////

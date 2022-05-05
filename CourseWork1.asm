TITLE  CalcGrade procedure

include Irvine32.inc

.data
cover BYTE "--------------------------------------------------",0
state BYTE "<----score,grade---->",0 ;inlustration sentenses 
num dword 0
mo byte ":"
mo1 byte " "
mo2 byte " "
mo3 byte "  "
mo4 byte "  "
.code
main PROC
	call Randomize			;if using RandomRange alone the Random Number generated is incomplete randomization
    mov ecx,10             ; make loop1 loops for 10 times
;loop to call the random number and pass it to CalcGrade
	mov	 edx,OFFSET cover	; give illustration sentence " The  grade of the letter is "
	call WriteString
	call Crlf				;change lines
Loop1:
	mov eax,0
	mov eax,num
	add eax,1
	call WriteDec
	mov edx,offset mo
	call WriteString
	mov num,eax
	call Alig1
	call WriteString
    mov  eax,51				;move the range into eax
    call RandomRange        ; value range from 50 to 100
    add  eax,50             ; the value ranges from 
    call WriteDEC           ; optional print statement
	mov edx,0
	call Alig
	;call WriteString
    call CalcGrade          ; returns the grade in AL
    mov	 edx,OFFSET state	; give illustration sentence " The  grade of the letter is "
	call WriteString		
	mov	 edx,OFFSET mo3	; give illustration sentence " The  grade of the letter is "
	call WriteString	
	call WriteChar			; display grade letter
	call Crlf				;change lines
    loop Loop1		
	INVOKE ExitProcess,0
main ENDP
;every comdition of the grade of letter

CalcGrade proc
grA:
	cmp	eax,90 
	jl	grB		; we can use jl or jb here, jl aims to compare signed value, jb for the unsigned one, I use jl here
	mov	al,'A'
	jmp	finished
grB:
	cmp	eax,80
	jl	grC
	mov	al,'B'
	jmp	finished
grC:
	cmp	eax,70
	jl	grD
	mov	al,'C'
	jmp	finished
grD:
	cmp	eax,60
	jl	grF
	mov	al,'D'
	jmp	finished
grF:
	mov	al,'F'
finished:
    ret
CalcGrade endp
Alig proc ;make the Strign Aliged, if the random number is case 100, get the output aligned
Case_0:
	mov edx,0
	cmp	eax,100
	je Case_100
	mov	edx,offset mo4
	jmp finished
Case_100:
	mov edx,0
	mov	edx,offset mo1
finished:
	ret
Alig endp
Alig1 proc;make the Strign Aliged, if the random number is case 10, get the output aligned
Case_0:
	cmp	eax,10
	je Case_10
	mov	edx,offset mo2
	jmp finished
Case_10:
	mov	edx,offset mo3
finished:
	ret
Alig1 endp

END main




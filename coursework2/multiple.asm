; amultiple.asm
.386
.model flat,C

multiple PROTO
.data

.code

multiple PROC USES edi
   
    mov eax,[esp+8]
    mov ebx,[esp+12]
    mov edi,0
L1:
    mov edx,eax
    and edx,1
    cmp edx,0
    jp L2
    add edi, ebx
 
L2:
    shr eax,1
    shl ebx,1
    cmp eax,0
    jg L1
    mov eax,edi

 ret   
multiple ENDP

END 

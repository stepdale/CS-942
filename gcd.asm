include Irvine32.inc

.data
dividend WORD ?
divisor WORD ?
gcdText BYTE "The gcd is: ", 0;
dividendText BYTE "The dividend x is: ", 0
divisorText BYTE " ,The divisor y is: ", 0

.code

main PROC

	; x = 1331, y = 1001
	mov dividend, 1331d
	mov divisor, 1001d

	;Print text
	mov edx, OFFSET dividendText
	call WriteString
	movsx eax, dividend
	call WriteInt

	mov edx, OFFSET divisorText
	call WriteString
	movsx eax, divisor
	call WriteInt
	call Crlf

	mov eax, 0
	mov ebx, 0
	mov edx, 0 ; clear high dividend

	mov ax, dividend
	mov bx, divisor
	call GreatestCommonDivisor


	call WaitMsg
	INVOKE ExitProcess,0
main ENDP

GreatestCommonDivisor PROC
L1: 
	div bx
	cmp dx, 0    ;r == 0
	je L2
	mov ax, bx ; x= y
	mov bx, dx ; y =r
	mov dx, 0 ;clear dividend
	jmp L1

L2: 
	movsx eax, bx
	mov edx, OFFSET gcdText
	call WriteString
	call WriteInt
	call Crlf

	ret
GreatestCommonDivisor ENDP


END main
;double ASMsqrt(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fsqrt"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMsqrt

_ASMsqrt:
	enter 0,0
	fld  qword[ebp + 8]
	fsqrt
	leave
	ret
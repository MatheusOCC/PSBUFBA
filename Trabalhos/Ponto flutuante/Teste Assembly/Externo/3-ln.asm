;double ASMln(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fld1;"
;		"fxch;"
;		"fyl2x;"
;		"fldl2e;"
;		"fxch;"
;		"fdivp;"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMln

_ASMln:
	enter 0, 0
	fld qword [ebp + 8]
	fld1
	fxch
	fyl2x
	fldl2e
	fxch
	fdivp
	leave
	ret
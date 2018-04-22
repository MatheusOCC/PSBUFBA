;double ASMexp(double x) {//WORKING
;	double ans;
;	double e = 2.71828182846;
;	asm("fldl %1;"
;		"fldl %2;"
;		"fyl2x;"
;		"fld1;"
;		"fld %%st(1);"
;		"fprem;"
;		"f2xm1;"
;		"faddp;"
;		"fscale;"
;		"fxch %%st(1);"
;		"fstp %%st"
;		:"=st"(ans)
;		:"m"(x), "m"(e)
;	);
;	return ans;
;}

section .data
	e	dq	2.71828182846

section .text

global _ASMexp

_ASMexp:
	enter 0, 0
	fld qword [e]
	fld qword [ebp + 8]
	fyl2x
	fld1
	fld ST1
	fprem
	f2xm1
	faddp
	fscale
	fxch ST1
	fstp ST0
	leave
	ret
;double ASMsin(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fsin"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMsin

_ASMsin:
	enter 0,0
	fld qword [ebp + 8]
	fsin
	leave
	ret
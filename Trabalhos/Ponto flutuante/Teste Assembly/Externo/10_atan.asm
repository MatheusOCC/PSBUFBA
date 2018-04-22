;double ASMatan(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fld1;"
;		"fpatan;"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMatan

_ASMatan:
	enter 0, 0
	fld qword [ebp + 8]
	fld1
	fpatan
	leave
	ret
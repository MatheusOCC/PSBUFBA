;double ASMacos(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fldl %1;"
;		"fmulp;"
;		"fld1;"
;		"fsubp;"
;		"fsqrt;"
;		"fldl %1;"
;		"fpatan;"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMacos

_ASMacos:
	enter 0, 0
	fld	qword [ebp + 8]
	fld	qword [ebp + 8]
	fmulp
	fld1
	fsubp
	fsqrt
	fld	qword [ebp + 8]
	fpatan
	leave
	ret
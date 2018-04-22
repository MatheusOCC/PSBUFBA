;double ASMasin(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fldl %1;"
;		"fldl %1;"
;		"fmulp;"
;		"fld1;"
;		"fsubp;"
;		"fsqrt;"
;		"fpatan;"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMasin

_ASMasin:
	enter 0, 0
	fld qword [ebp + 8]
	fld qword [ebp + 8]
	fld qword [ebp + 8]
	fmulp
	fld1
	fsubp
	fsqrt
	fpatan
	leave
	ret
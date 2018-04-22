;double ASMcos(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fcos"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMcos

_ASMcos:
	enter 0, 0
	fld qword [ebp + 8]
	fcos
	leave
	ret
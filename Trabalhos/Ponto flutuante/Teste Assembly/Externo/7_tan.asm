;double ASMtan(double x) {//WORKING
;	double ans;
;	asm("fldl %1;"
;		"fptan;"
;		"fstp %%st;"
;		:"=st"(ans)
;		:"m"(x)
;	);
;	return ans;
;}

section .text

global _ASMtan

_ASMtan:
	enter 0, 0
	fld qword [ebp + 8]
	fptan
	fstp ST0
	leave
	ret
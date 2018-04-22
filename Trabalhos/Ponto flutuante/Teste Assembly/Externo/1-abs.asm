;	double ans;
;	asm("fldl %1;" //carrega x em st0
;		"fabs;" //abs
;		:"=st"(ans) //saida: st0
;		:"m"(x) //entrada: x (na memoria)
;	);
;	return ans;

section .text

global _ASMabs

_ASMabs:
	enter 	0,0
	fld	qword [ebp + 8]
	fabs
	leave
	ret
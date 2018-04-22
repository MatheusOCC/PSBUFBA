#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

/*
double ASMacos(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fldl %1;"
		"fmulp;"
		"fld1;"
		"fsubp;"
		"fsqrt;"
		"fldl %1;"
		"fpatan;"
		:"=st"(ans)
		:"m"(x)
	);
	return ans;
}
*/

extern double ASMacos(double x);

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double ARCOCOSSENO;
	for(i=-100000;i<100000;i++){
		ARCOCOSSENO = ASMacos(i);
		printf("\n%lf", ARCOCOSSENO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
        printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}

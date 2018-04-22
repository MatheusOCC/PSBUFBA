#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

/*
double ASMasin(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fldl %1;"
		"fldl %1;"
		"fmulp;"
		"fld1;"
		"fsubp;"
		"fsqrt;"
		"fpatan;"
		:"=st"(ans)
		:"m"(x)
	);
	return ans;
}
*/

extern double ASMasin(double x);

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double ARCOSENO;
	for(i=-100000;i<100000;i++){
		ARCOSENO = ASMasin(i);
		printf("\n%lf", ARCOSENO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
        printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
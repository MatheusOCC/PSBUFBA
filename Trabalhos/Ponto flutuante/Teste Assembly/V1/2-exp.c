#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>
#include <sys\timeb.h>	

double ASMexp(double x) {//WORKING
	double ans;
	double e = 2.71828182846;
	asm("fldl %1;"
		"fldl %2;"
		"fyl2x;"
		"fld1;"
		"fld %%st(1);"
		"fprem;"
		"f2xm1;"
		"faddp;"
		"fscale;"
		"fxch %%st(1);"
		"fstp %%st"
		:"=st"(ans)
		:"m"(x), "m"(e)
	);
	return ans;
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double EXPONENCIAL;
	for(i=-100000;i<100000;i++){
		EXPONENCIAL = ASMexp(i);
		printf("\n%lf", EXPONENCIAL);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
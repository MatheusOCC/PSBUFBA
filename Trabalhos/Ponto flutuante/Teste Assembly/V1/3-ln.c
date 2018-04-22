#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

double ASMln(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fld1;"
		"fxch;"
		"fyl2x;"
		"fldl2e;"
		"fxch;"
		"fdivp;"
		:"=st"(ans)
		:"m"(x)
	);
	return ans;
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double LOGARITMO;
	for(i=-100000;i<100000;i++){
		LOGARITMO = ASMln(i);
		printf("\n%lf", LOGARITMO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
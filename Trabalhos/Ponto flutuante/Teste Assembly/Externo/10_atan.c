#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

/*
double ASMatan(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fld1;"
		"fpatan;"
		:"=st"(ans)
		:"m"(x)
	);
	return ans;
}
*/

extern double ASMatan(double x);

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double ARCOTANGENTE;
	for(i=-100000;i<100000;i++){
		ARCOTANGENTE = ASMatan(i);
		printf("\n%lf", ARCOTANGENTE);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
        printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
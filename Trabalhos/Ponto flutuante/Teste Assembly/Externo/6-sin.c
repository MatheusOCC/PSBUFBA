#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

/*
double ASMsin(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fsin"
		:"=st"(ans)
		:"m"(x)
	);
	return ans;
}
*/

extern double ASMsin(double x);

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double SENO;
	for(i=-100000;i<100000;i++){
		SENO = ASMsin(i);
		printf("\n%lf", SENO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
        printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
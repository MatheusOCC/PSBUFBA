#include <stdio.h>		
#include <stdlib.h>		
#include <conio.h>
#include <math.h>	
#include <sys\timeb.h>

double ASMcos(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fcos"
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
	double COSSENO;
	for(i=-100000;i<100000;i++){
		COSSENO ASMcos(i);
		printf("\n%lf", COSSENO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
        printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
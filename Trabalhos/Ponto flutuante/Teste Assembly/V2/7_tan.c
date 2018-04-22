#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

double ASMtan(double x) {//WORKING
	double ans;
	asm("fldl %1;"
		"fptan;"
		"fstp %%st;"
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
	double TANGENTE;
	for(i=-100000;i<100000;i++){
		TANGENTE = ASMtan(i);
		printf("\n%lf", TANGENTE);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
        printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
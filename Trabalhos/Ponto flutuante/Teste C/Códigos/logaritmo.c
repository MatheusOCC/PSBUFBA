#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void iteraLogaritmoN(){
	int	i;
	double LOGARITMO;
	for(i=-100000;i<100000;i++){
		LOGARITMO = log(i);
		printf("Log n de %d: %lf",i, LOGARITMO);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraLogaritmoN();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

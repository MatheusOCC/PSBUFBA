#include <stdio.h>		
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>

void iteraModulo(){
	int i;
	double MODULO;
	for(i=-100000;i<100000;i++){
		MODULO = abs(i);
		printf("Modulo de %d: %lf",i, MODULO);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraModulo();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

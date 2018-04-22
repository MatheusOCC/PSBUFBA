#include <stdio.h>		
#include <stdlib.h>		
#include <conio.h>
#include <math.h>	
#include <sys\timeb.h>

void iteraRaiz(){
	int i;
	double RAIZ;
	for(i=-100000;i<100000;i++){
		RAIZ = sqrt(i);
		printf("Raiz de %d: %lf",i, RAIZ);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraRaiz();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

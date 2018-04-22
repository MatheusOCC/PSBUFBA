#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void iteraArcoTangente(){
	int	i;
	double ARCOTANGENTE;
	for(i=-100000;i<100000;i++){
		ARCOTANGENTE = atan(i);
		printf("Arco tangente de %lf: %lf",i, ARCOTANGENTE);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraArcoTangente();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

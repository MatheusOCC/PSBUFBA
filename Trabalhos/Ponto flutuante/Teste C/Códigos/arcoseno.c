#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void iteraArcoSeno(){
	int	i;
	double ARCOSENO;
	for(i=-100000;i<100000;i++){
		ARCOSENO = asen(i);
		printf("Seno de %lf: %lf",i, ARCOSENO);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraArcoSeno();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void iteraCosseno(){
	int	i;
	double COSSENO;
	for(i=-100000;i<100000;i++){
		COSSENO = cos(i);
		printf("Cosseno de %d: %f",i, COSSENO);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraCosseno();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

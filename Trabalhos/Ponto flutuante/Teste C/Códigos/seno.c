#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void iteraSeno(){
	int	i;
	double SENO;
	for(i=-100000;i<100000;i++){
		SENO = sen(i);
		printf("Seno de %d: %lf",i, SENO);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraSeno();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int	i;
	double ARCOCOSSENO;
	for(i=-100000;i<100000;i++){
		ARCOCOSSENO = acos(i);
		printf("Arco cosseno de %d: %lf",i, ARCOCOSSENO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}
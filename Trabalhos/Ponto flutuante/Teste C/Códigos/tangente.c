#include <stdio.h>	
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>	

void iteraTangente(){
	int	i;
	double TANGENTE;
	for(i=-100000;i<100000;i++){
		TANGENTE = tan(i);
		printf("Tangente de %lf: %lf",i, TANGENTE);
	}
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	iteraTangente();
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
    printf("\nOperation took %u milliseconds\n", diff);
    system("pause");
}

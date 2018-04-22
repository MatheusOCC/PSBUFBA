#include <stdio.h>		
#include <stdlib.h>		
#include <conio.h>
#include <math.h>		
#include <sys\timeb.h>

double ASMabs(double x) {//WORKING
	double ans;
	asm("fldl %1;" //carrega x em st0
		"fabs;" //abs
		:"=st"(ans) //saida: st0
		:"m"(x) //entrada: x (na memoria)
	);
	return ans;
}

void main() {
	struct timeb start, end;
    int diff;
    ftime(&start);
	int i;
	double MODULO;
	for(i=-100000;i<100000;i++){
		MODULO = ASMabs(i);
		printf("\n%lf", MODULO);
	}
	ftime(&end);
	diff = (int) (1000.0 * (end.time - start.time)+(end.millitm - start.millitm));
 printf("\n\nTempo total em milissegundos: %u\n", diff);
    system("pause");
}
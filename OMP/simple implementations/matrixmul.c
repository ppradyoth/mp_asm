#include<omp.h>
#include<stdio.h>
#include<stdlib.h>
int main()
{
int a[100][100],b[100][100],c[100][100],i,j,k,l,m;
for(i=0;i<5;i++)
	for(j=0;j<5;j++)
	{
		a[i][j]=i;
		b[i][j]=j;
		c[i][j]=0;
	}
#pragma omp parallel num_threads(2)
{
#pragma omp critical
if(omp_get_thread_num()==0)
{
printf("There are %d threads\n",omp_get_num_threads());
printf("Thread %d is performing multiplication",omp_get_thread_num());
for(i=0;i<5;i++)
{
for(j=0;j<5;j++)
{
	c[i][j]=0;
	for(k=0;k<5;k++)
		c[i][j]+=a[i][k]+b[k][j];
}
}
}
else
{
printf("Thread %d printing matrix results\n",omp_get_thread_num());
for(l=0;l<5;l++){
	for(m=0;m<5;m++)
		printf("%d\t",c[l][m]);
	printf("\n");
}
}
}
return 0;
}

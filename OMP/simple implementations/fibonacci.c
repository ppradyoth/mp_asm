#include<omp.h>
#include<stdio.h>
int fib(int n)
{
if(n<2)
	return n;
else
	return (fib(n-1)+fib(n-2));
}
int main()
{
int fibn[100],i,j,n;
printf("enter limit");
scanf("%d",&n);
#pragma omp parallel num_threads(2)
{
#pragma omp critical
if(omp_get_thread_num()==0)
{
printf("There are %d threads\n",omp_get_num_threads());
printf("Thread %d generating numbers...",omp_get_thread_num());
for(i=0;i<n;i++)
	fibn[i]=fib(i);
}
else
{
printf("Thread %d printing numbers...\n",omp_get_thread_num());
for(j=0;j<n;j++)
	printf("%d\t",fibn[j]);
}
}
return 0;
}

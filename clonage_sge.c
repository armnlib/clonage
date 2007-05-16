#include <stdio.h>
#include <string.h>
main ()
{
  char buf[4000*1024], line1[256], line2[256], line3[256], line4[256];
  int i,ncl,nce,mem,temps,nbtour,jobnb;
  char nomf[256];

  fgets(line1,256,stdin);
  fgets(line2,256,stdin);
  fgets(line3,256,stdin);
  fgets(line4,256,stdin);

  sscanf(&line1[2],"%s %d %d %d %d",nomf,&mem,&temps,&nbtour,&jobnb);
/*
  fprintf(stderr,"debug nomf=%s\n mem=%d\n temps=%d\n nbtour=%d\n jobnb=%d\n",
                 nomf,mem,temps,nbtour,jobnb);
*/
  ncl = fread(buf,sizeof(char),4000*1024,stdin);
  if ((temps <= 1801) && (mem > 200000))
     if ((jobnb % nbtour) == 0)
	temps = 1801;
     else
	temps = 1800;
  jobnb++;
  sprintf(line1,"# %s %d %d %d %d\n",nomf,mem,temps,nbtour,jobnb);
  sprintf(line4,"#$ -o %s.%d\n",nomf,jobnb);
  fputs(line1,stdout);
  fputs(line2,stdout);
  fputs(line3,stdout);
  fputs(line4,stdout);
  nce = fwrite(buf,sizeof(char),ncl,stdout);
  }

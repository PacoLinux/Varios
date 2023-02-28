//---------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <process.h>
#pragma hdrstop
#define PREFIX "-U"
#define OMF "-felf"
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
int main(int argc, char **argv)
{



	char* args[6];
	int i,r;
	for(i=0;i<6 ;i++)if(i<argc)args[i]=argv[i+1]; else args[i]=0;

	r=execlp("java","-verbose","-jarmmpc.jar",args[0],PREFIX,OMF,
	args[1],args[2],args[3],args[4],args[5],0);
    if(r!=0)printf("Return code %d",r);
		return r;
}
//---------------------------------------------------------------------------

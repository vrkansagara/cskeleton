/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {

	if(argc == 2 && !strcmp("-v", argv[1]))
	{

		printf("main-"VERSION", © 2020-2021 Vallabh Kansagara, see LICENSE for details\n");
	}	else if(argc != 1){

		printf("usage: main  [-v]\n");
	}

	printf(" I am main binary....");

	return 0;
}


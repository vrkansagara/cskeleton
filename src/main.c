/* See LICENSE file for copyright and license details. */
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
	if(argc == 2 && !strcmp("-v", argv[1]))
		printf("vrk-"VERSION", © 2020-2021 VRK engineers, see LICENSE for details\n");
	else if(argc != 1)
		printf("usage: vrk [-v]\n");
	return 0;
}


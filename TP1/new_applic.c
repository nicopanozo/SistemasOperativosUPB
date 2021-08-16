#include "common.h"
#include <stdio.h>

int main(int argc, char** argv) {
	printf("El host actual es:%s\t|\tEl IP es:%s\n", getNetAddr(), getIPAddr());
	return 0;
}

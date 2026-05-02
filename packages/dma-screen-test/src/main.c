#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <errno.h>
#include <string.h>

void *mmap_region(int, off_t, size_t);
uint64_t micros();

int main(int argc, char **argv) {
	int fd, err = EXIT_FAILURE;
	void *map1 = NULL;
	void *map2 = NULL;

	int cnt = 0, displays = 2, off = 0, mode = 0;
	if (argc > 1) {
		cnt = atoi(argv[1]);
		printf("Will stop early at %d!\n", cnt);
	}
	if(argc > 2) {
		displays = atoi(argv[2]);
		printf("Using %d displays!\n", displays);
	}
	if(argc > 4) {
		off = atoi(argv[4]);
		printf("Using %d offset!\n", off);
	}
	if(argc > 3) {
		mode = atoi(argv[3]);
		printf("Using %d mode!\n", mode);
	}

	fd = open("/dev/mem", O_RDWR | O_SYNC);
	if (fd < 0) {
		perror("open");
		goto cleanup;
	}

	void* dma = mmap_region(fd, 0x40400000 + off, 0x30);
	if (!dma) goto cleanup;
	printf("AXI DMA mapped at virtual address: %p\n", dma);
	uint32_t* dma_ctrl = (uint32_t*) (dma + 0x00);
	uint32_t* dma_stat = (uint32_t*) (dma + 0x04);
	uint32_t* dma_addr = (uint32_t*) (dma + 0x18);
	uint32_t* dma_size = (uint32_t*) (dma + 0x28);

	void* ddr = mmap_region(fd, 0x1FC00000, 0x400000);
	if (!ddr)  goto cleanup;
	printf("DMA region mapped at virtual address: %p\n", ddr);

	int w = 240 * displays, h = 320;
	int pos = 0;
	for(int y = 0; y < h; y++) {
		for(int x = 0; x < w; x++) {
			int n = 0;
			pos = x + (y * w);

			switch (mode) {
				case 1: n = (x * 8) / (w - 1); break;
				case 2: n = x; break;
				case 3: n = y; break;
				case 4: n = x + y; break;
				case 5: n = 0; break;
				case 6: n = 1; break;
				case 7: n = 2; break;
				case 8: n = 3; break;
				case 9: n = 4; break;
				case 10: n = 5; break;
				case 11: n = 6; break;
				case 12: n = 7; break;
				case 13: n = -y; break;
				case 14: n = -x; break;
				case 15: n = -pos; break;
				case 16: n = pos & 1 ? 0 : 7; break;
				case 17: n = pos & 2 ? 0 : 7; break;
				case 18: n = pos & 4 ? 0 : 7; break;
				case 19: n = pos & 8 ? 0 : 7; break;
				case 20: n = x & 1 ? 0 : 7; break;
				case 21: n = y & 1 ? 0 : 7; break;
				case 22: n = x & 2 ? 0 : 7; break;
				case 23: n = y & 2 ? 0 : 7; break;
				case 24: n = x & 4 ? 0 : 7; break;
				case 25: n = y & 4 ? 0 : 7; break;
				case 26: n = x & 8 ? 0 : 7; break;
				case 27: n = y & 8 ? 0 : 7; break;
				case 28: n = x & 16 ? 0 : 7; break;
				case 29: n = y & 16 ? 0 : 7; break;
				case 30: n = x & 32 ? 0 : 7; break;
				case 31: n = y & 32 ? 0 : 7; break;
				default: n = (y * 8) / (h - 1); break;
			}

			uint16_t color = 0;
			if (n < 0) {
				color = -n;
			} else {
				if (n & 1) color |= 0xF800;
				if (n & 2) color |= 0x07E0;
				if (n & 4) color |= 0x001F;
			}

			((uint16_t*) ddr)[pos] = color;

			if (cnt > 0 && pos >= cnt) {
				printf("Stopping early at %d, color=%04X\n", pos, color);
				goto exit_cnt;
			}
		}
	}

exit_cnt:
	pos = 2 * (pos + 1);
	printf("Starting DMA with size: %08X!\n", pos);
	uint64_t begin = micros();
	dma_ctrl[0] |= 0x04;
	fsync(fd); usleep(1000);
	dma_addr[0] = 0x1FC00000;
	fsync(fd); usleep(1000);
	dma_ctrl[0] |= 0x01;
	fsync(fd); usleep(1000);
	dma_size[0] = pos;
	fsync(fd);
	while((dma_stat[0] & 0x02) == 0) {
		usleep(1000);
	}
	uint64_t end = micros();
	printf("DMA Completed, took %lluμS!\n", ddr, end - begin);

	// Cleanup
	err = EXIT_SUCCESS;
cleanup:
	if (dma) munmap(dma, 0x30);
	if (ddr) munmap(ddr, 0x400000);
	close(fd);
	return err;
}

uint64_t micros() {
	struct timeval tv;
	gettimeofday(&tv,NULL);
	return 1000000 * tv.tv_sec + tv.tv_usec;
}

void *mmap_region(int fd, off_t off, size_t size) {
	void *map = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, off);
	if (map == MAP_FAILED) {
		perror("mmap region failed");
		close(fd);
		return NULL;
	}
	return map;
}

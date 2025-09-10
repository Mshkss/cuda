#include <cstdio>

// CUDA kernel — выполняется на GPU
__global__ void cuda_hello() { printf("Hello World from GPU1!\n"); }

int main() {
    // Запуск kernel: 1 блок, 1 поток
    cuda_hello<<<1, 1>>>();

    // Ждём завершения всех потоков GPU перед завершением программы
    cudaDeviceSynchronize();

    // Можно проверить, была ли ошибка запуска kernel
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        return 1;
    }

    printf("Hello World from CPU1!\n");
    return 0;
}
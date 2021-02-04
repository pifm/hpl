#!/usr/bin/env python3
import numpy as np

class MatrixMultiplication:

    def __init__(self, M: int, N: int, K: int):
        self._setup(M, N, K)
        pass

    def _setup(self, M: int, N: int, K: int):
        self._M = M
        self._N = N
        self._K = K
        self._a = np.array(np.random.random((M, N)), dtype=np.double, order='C', copy=False)
        self._b = np.array(np.random.random((N, K)), dtype=np.double, order='C', copy=False)
        self._ta = tf.constant(self._a)
        self._tb = tf.constant(self._b)
        pass

    def setup(self, M: int, N: int, K: int):
        self._setup(M, N, K)

    def multiply(self):
        c = self._a.dot(self._b)
        return c
    
    def benchmark(self) -> float:
        # Warm up
        self.multiply()
        times = 5
        start = time.time()
        for i in range(times):
            self.multiply()
        end = time.time()
        run_time = (end-start)/times
        return self._get_gflops()/run_time

    def _get_gflops(self)->float:
        return self._M * self._N * (2*self._K - 1.0) / 1000 ** 3

if __name__ == "__main__":
    file_name = 'flops'
    timeout = random.uniform(1, 5)
    m = MatrixMultiplication(2048, 2048, 128)
    for i in range(0, 100):
        flops = m.benchmark()
        print(flops, 'gflops')
        time.sleep(timeout)
    pass
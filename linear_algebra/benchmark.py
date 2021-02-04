from matrix_multiplication import MatrixMultiplication

m = MatrixMultiplication(2048, 2048, 2048)

def test_numpy_dot(benchmark):
    benchmark(m.multiply)
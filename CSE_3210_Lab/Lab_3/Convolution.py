import numpy as np

x_n = np.arange(1, 6)  # input signal
h_n = np.linspace(1, 3, 3) # impulse response signal 

x_n_length = len(x_n)
h_n_length = len(h_n)
output_length = x_n_length + h_n_length - 1
result = np.zeros(output_length)

for i in range(output_length):
    for j in range(h_n_length):
        if i - j >= 0 and i - j < x_n_length:
            result[i] += x_n[i - j] * h_n[j]

print("Input Signal,x(n):", x_n)
print("Impulse Response Signal,h(n):", h_n)
print("Convolution Result:", result)

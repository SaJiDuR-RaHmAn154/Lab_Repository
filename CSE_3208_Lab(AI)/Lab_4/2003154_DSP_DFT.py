import numpy as np
import matplotlib.pyplot as plt

n = np.linspace(100, 2, 100) 
x = 3 * np.sin(2 * np.pi * 5 * n)  # Sinusoidal Signal

# DFT
C = np.zeros(100, dtype=complex)
for k in range(100):
    for p in range(100):
        C[k] += x[p] * np.exp(-2j * np.pi * k * p / 100)

# Energy Density Spectrum 
PSD = (np.abs(C) ** 2) / 100

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.plot(n, x)
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Sinusoidal Signal')
plt.legend()

plt.subplot(1, 2, 2)
plt.stem(PSD)
plt.xlabel('Frequency Index (k)')
plt.ylabel('Power')
plt.title('Energy Density Spectrum')

plt.tight_layout()
plt.show()
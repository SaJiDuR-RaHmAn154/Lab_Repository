# Question 2: Z-Transform of a Sum of Signals
# Consider the following signal:

# x[n] = 2^n * u[n] + 3^n * u[n]z
# Where u[n] is the unit step function.
# 1. Find the Z-Transform of the signal x[n].
# 2. Find the ROC of the system.

#Solution:

import numpy as np
import matplotlib.pyplot as plt

# Defining the Z-Transformation function
def Z_Transformation(signal, n):
    N = len(signal)
    Z = np.zeros(N, dtype=complex)
    for k in range(N):
        Z[k] = np.sum(signal * np.exp(-1j * 2 * np.pi * n * k / N))
    # Analytical ROC for x[n] = 2^n u[n] + 3^n u[n]
    roc = 'ROC: |z| > 3'  # Based on the analytical solution
    return Z, roc

# Define the signal x[n] = 2^n u[n] + 3^n u[n]
N = 6
n = np.arange(N)
signal = 2**n + 3**n # u[n]=1 when n>=0

# Computing the Z-transformation
Z, roc = Z_Transformation(signal, n)

# Print the Z-transform values and ROC
print('Z-Transform Values:')
for i, z in enumerate(Z):
    print(f'Z[{i}]: {z}')
print(roc,'\n')


# Plotting the Region of Convergence (ROC)
fig, ax = plt.subplots()
ax.set_facecolor('#228B22')
radius = max(2,3) # radius will be max(a,b)
circle = plt.Circle((0, 0), radius=radius, edgecolor='r',facecolor='white',linestyle='--',label=f'ROC: |Z|>3')
ax.add_patch(circle)
ax.legend()
plt.xlim(-radius - 4, radius + 4)
plt.ylim(-radius - 4, radius + 4)
plt.xlabel('Real')
plt.ylabel('Imaginary')
plt.title('Region of Convergence (ROC)')
plt.grid(True, linestyle='--', linewidth=0.5)
plt.show()



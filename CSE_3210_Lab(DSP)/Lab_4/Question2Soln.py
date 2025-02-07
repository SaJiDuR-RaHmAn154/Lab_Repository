# Question 2: Z-Transform of a Sum of Signals
# Consider the following signal:

# x[n] = 2^n * u[n] + 3^n * u[n]z
# Where u[n] is the unit step function.
# 1. Find the Z-Transform of the signal x[n].
# 2. Find the ROC of the system.


import numpy as np
import matplotlib.pyplot as plt

# Signal x[n] = 2^n * u[n] + 3^n * u[n]
# Both portion denotes Causal Signal

def signal(n):
    # u[n] is 1 for n>=0
    return (2 ** n) * (n >= 0) + (3 ** n) * (n >= 0)  

# Z-Transform calculation function
def z_transformation(signal_fn, n_range):
    N = len(n_range)
    Z = np.zeros(N, dtype=complex)
    z_values = []
    for k in range(N):
        z_values.append(np.sum(signal_fn(n_range) * np.exp(-1j * 2 * np.pi * k * n_range / N)))

    # ROC is determined by the individual terms' convergence
    roc_radius = max(2, 3)  # Given x[n] = 2^n * u[n] + 3^n * u[n], ROC is max(2, 3), so |Z| > 3

    roc = f"ROC: |Z| > {roc_radius}"

    return np.array(z_values), roc

n = np.arange(5) 

# Compute Z-transform
Z, roc = z_transformation(signal, n)

# Z-transform values
print("Z-Transform values:")
for i, z_val in enumerate(Z):
    print(f"Z[{i}]: {z_val}")

print(roc, '\n')

# Showing the borderline of the ROC 
fig, ax = plt.subplots()
circle = plt.Circle((0, 0), radius=3, color='r', fill=False, linestyle='--', label=f'ROC Boundary |Z|>3')
ax.add_patch(circle)

x = np.linspace(-5, 5, 500)
y = np.linspace(-5, 5, 500)
x, y = np.meshgrid(x, y)
z_magnitude = np.sqrt(x**2 + y**2)

# Highlighting the ROC
ROC = z_magnitude > 3  
ax.imshow(ROC, extent=[-5, 5, -5, 5], origin='lower', cmap='Greens',alpha=0.8)

plt.xlim(-5, 5)
plt.ylim(-5, 5)
plt.xlabel('Real')
plt.ylabel('Imaginary')
plt.title('Region of Convergence.')

plt.grid(True, linestyle='--', linewidth=1.0)
plt.axhline(0, color='black', linewidth=1.0)
plt.axvline(0, color='black', linewidth=1.0)
plt.legend()

plt.show()

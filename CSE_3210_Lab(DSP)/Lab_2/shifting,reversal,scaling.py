import numpy as np
import matplotlib.pyplot as plt

# Define a sample discrete-time signal
n = np.arange(-5, 6)
x = np.array([0, 0, 1, 2, 3, 4, 3, 2, 1, 0, 0])  # sample signal

# Time Shifting: shift x[n] by k samples to the right -> x[n - k]
k = 2
n_shifted = n + k  # the index axis shifts right by k

# Time Reversal: x[-n]
n_reversed = -n
x_reversed = x[::-1]

# Time Scaling: x[a*n] - downsampling (keep every a-th sample)
a = 2
n_scaled = n[::a]
x_scaled = x[::a]

# Plot results
fig, axes = plt.subplots(2, 2, figsize=(12, 8))

# Original signal
axes[0, 0].stem(n, x)
axes[0, 0].set_title("Original Signal x[n]")
axes[0, 0].set_xlabel("n")
axes[0, 0].set_ylabel("Amplitude")
axes[0, 0].grid(True)

# Time shifting
axes[0, 1].stem(n_shifted, x)
axes[0, 1].set_title(f"Time Shifting: x[n - {k}]")
axes[0, 1].set_xlabel("n")
axes[0, 1].set_ylabel("Amplitude")
axes[0, 1].grid(True)

# Time reversal
axes[1, 0].stem(n_reversed, x_reversed)
axes[1, 0].set_title("Time Reversal: x[-n]")
axes[1, 0].set_xlabel("n")
axes[1, 0].set_ylabel("Amplitude")
axes[1, 0].grid(True)

# Time scaling
axes[1, 1].stem(n_scaled, x_scaled)
axes[1, 1].set_title(f"Time Scaling: x[{a}n]")
axes[1, 1].set_xlabel("n")
axes[1, 1].set_ylabel("Amplitude")
axes[1, 1].grid(True)

plt.tight_layout()
plt.show()

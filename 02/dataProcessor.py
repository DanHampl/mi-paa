import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

x = None
y = []
with open('./data/dataSetDetailCalls_stupid.txt') as f:
    x = f.readlines()

for i in x:
    y.append(int(i))


x = pd.Series(y)

# histogram on linear scale
plt.subplot(211)
hist, bins, _ = plt.hist(x, bins=8)

# histogram on log scale. 
# Use non-equal bin sizes, such that they look equal on log scale.
logbins = np.logspace(np.log10(bins[0]),np.log10(bins[-1]),len(bins))
plt.subplot(212)
plt.hist(x, bins=logbins)
plt.xscale('log')
plt.show()
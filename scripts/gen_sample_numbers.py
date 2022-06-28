import sys
from random import choices
import numpy as np
upper_limit = int(sys.argv[1])
n_choose = int(sys.argv[2])
n_times = int(sys.argv[3])
x = list(range(1, upper_limit + 1))

for i in range(n_times):
    vals = choices(x, k = n_choose)
    m_val = np.mean(vals)
    print (str(m_val) + "\t" + str(i) + "\t" + "k=" + str(n_choose))
        

import matplotlib
matplotlib.use('Agg')
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import tkinter


# Get CPU data
cpu = pd.read_csv("./code/cpu.txt")
# Get fileio data
fileio = pd.read_csv("./code/fileio.txt")
# Get stress data
stress = pd.read_csv("./code/stress.txt")


# Extract metrics from txt files
eps = (cpu[list(cpu.columns)[0]].iloc[8]).split(" ")
eps = float([eps[i] for i in range(len(eps)) if len(eps[i]) > 0][-1])

avg = (cpu[list(cpu.columns)[0]].iloc[14]).split(" ")
avg = float([avg[i] for i in range(len(avg)) if len(avg[i]) > 0][-1])

read = (fileio[list(fileio.columns)[1]].iloc[21]).split(" ")
read = float([read[i] for i in range(len(read)) if len(read[i]) > 0][-1])

write = (fileio[list(fileio.columns)[1]].iloc[22]).split(" ")
write = float([write[i] for i in range(len(write)) if len(write[i]) > 0][-1])

bogo = (stress[list(stress.columns)[0]].iloc[3]).split(" ")
bogo = float([bogo[i] for i in range(len(bogo)) if len(bogo[i]) > 0][-2])

# Open masterTable
# If masterTable doesn't exist, create masterTable
try:
    masterTable = pd.read_csv("./code/masterTable.csv")
except FileNotFoundError:
    masterTable = pd.DataFrame(columns = ["events/s","avg_latency (ms)","read (mb/s)","write (mb/s)","bogo (ops/s)"])


# Update masterTable with new data
masterTable = pd.DataFrame(np.array([[eps, avg, read, write, bogo]]), columns =["events/s","avg_latency (ms)","read (mb/s)","write (mb/s)","bogo (ops/s)"]).append(masterTable, ignore_index = True)

# Save current version of masterTable
masterTable.to_csv("./code/masterTable.csv", index = False)

masterTable.plot(subplots = True, layout = (2,3))
plt.show()
plt.savefig("./code/benchGraph.png")






























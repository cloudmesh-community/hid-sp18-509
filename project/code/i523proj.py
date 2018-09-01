import matplotlib
matplotlib.use('Agg')
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import subprocess
import sys
import os
import tkinter

# cd ~/GoogleDrive/MSDS/Coursework/fa.BigData/project/code

os.system("sh ./code/benchmarks.sh")

# Get CPU data
cpu = pd.read_csv("./cpu.txt", error_bad_lines=False)
# Get fileio data
fileio = pd.read_csv("./fileio.txt", error_bad_lines=False)
# Get stress data
stress = pd.read_csv("./stress.txt", error_bad_lines=False)


# Extract metrics from txt files
eps = (cpu[list(cpu.columns)[0]].iloc[8]).split(" ")
eps = float([eps[i] for i in range(len(eps)) if len(eps[i]) > 0][-1])

avg = (cpu[list(cpu.columns)[0]].iloc[14]).split(" ")
avg = float([avg[i] for i in range(len(avg)) if len(avg[i]) > 0][-1])

read = (fileio[list(fileio.columns)[1]].iloc[21]).split(" ")
read = float([read[i] for i in range(len(read)) if len(read[i]) > 0][-1])

write = (fileio[list(fileio.columns)[1]].iloc[22]).split(" ")
write = float([write[i] for i in range(len(write)) if len(write[i]) > 0][-1])

bogo = str(stress.iloc[3]).split(" ")
bogo = float([bogo[i] for i in range(len(bogo)) if len(bogo[i]) > 0][-4])

# Open masterTable
# If masterTable doesn't exist, create masterTable
try:
    masterTable = pd.read_csv("./masterTable.csv")
except FileNotFoundError:
    masterTable = pd.DataFrame(columns = ["events/s","avg_latency (ms)","read (mb/s)","write (mb/s)","bogo (ops/s)"])


# Update masterTable with new data
masterTable = pd.DataFrame(np.array([[eps, avg, read, write, bogo]]), columns =["events/s","avg_latency (ms)","read (mb/s)","write (mb/s)","bogo (ops/s)"]).append(masterTable, ignore_index = True)

# Save current version of masterTable
masterTable.to_csv("./masterTable.csv", index = False)

masterTable.plot(subplots = True, layout = (2,3))
plt.savefig("./benchGraph.png")






























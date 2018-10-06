import matplotlib
matplotlib.use('Agg')
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import subprocess
import sys
import os
import tkinter
pd.set_option('display.max_colwidth', -1)

# cd ~/GoogleDrive/MSDS/Coursework/fa.BigData/project/

os.system("sh ./code/benchmarks.sh")

# Get sysbench data
cpu = pd.read_csv("./cpu.txt", error_bad_lines=False)
fileio = pd.read_csv("./fileio.txt", error_bad_lines=False)
# Get stress-ng data
stress = pd.read_csv("./stress.txt", header = None, error_bad_lines=False)
hdd = pd.read_csv("./hdd.txt", header = None, error_bad_lines=False)
mem = pd.read_csv("./memthrash.txt", header = None, error_bad_lines=False)


# Extract metrics from txt files
eps = (cpu[list(cpu.columns)[0]].iloc[8]).split(" ")
eps = float([eps[i] for i in range(len(eps)) if len(eps[i]) > 0][-1])

avg = (cpu[list(cpu.columns)[0]].iloc[14]).split(" ")
avg = float([avg[i] for i in range(len(avg)) if len(avg[i]) > 0][-1])

read = (fileio[list(fileio.columns)[1]].iloc[21]).split(" ")
read = float([read[i] for i in range(len(read)) if len(read[i]) > 0][-1])

write = (fileio[list(fileio.columns)[1]].iloc[22]).split(" ")
write = float([write[i] for i in range(len(write)) if len(write[i]) > 0][-1])

bogo1 = str(stress.iloc[-1]).split(" ")
bogo1 = float([bogo1[i] for i in range(len(bogo1)) if len(bogo1[i]) > 0][-5])

bogo2 = str(hdd.iloc[-1]).split(" ")
bogo2 = float([bogo2[i] for i in range(len(bogo2)) if len(bogo2[i]) > 0][-5])

bogo3 = str(mem.iloc[-1]).split(" ")
bogo3 = float([bogo3[i] for i in range(len(bogo3)) if len(bogo3[i]) > 0][-5])

# Open masterTable
# If masterTable doesn't exist, create masterTable
try:
    masterTable = pd.read_csv("./masterTable.csv")
except FileNotFoundError:
    masterTable = pd.DataFrame(columns = ["events/s","avg_latency (ms)","read (mb/s)","write (mb/s)","cpu bogo (ops/s)","hdd bogo (ops/s)","mem bogo (ops/s)"])

# Update masterTable with new data
masterTable = pd.DataFrame(np.array([[eps, avg, read, write, bogo1, bogo2, bogo3]]), columns =["events/s","avg_latency (ms)","read (mb/s)","write (mb/s)","cpu bogo (ops/s)","hdd bogo (ops/s)","mem bogo (ops/s)"]).append(masterTable, ignore_index = True)

# Save current version of masterTable
masterTable.to_csv("./masterTable.csv", index = False)

# Plot and save
masterTable.plot(subplots = True, layout = (3,3), figsize = (20,12))
plt.savefig("./benchGraph.png")




























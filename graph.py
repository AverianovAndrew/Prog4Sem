import plotly
import plotly.graph_objs as go
import plotly.express as px
from plotly.subplots import make_subplots
import os
from multiprocessing import Process
import numpy as np
import pandas as pd

def cord1(res):
    with open(res) as f:
        lines = f.readlines()
    xes = []
    yes = []

    for i in lines:
        xes.append(int(i.partition(' ')[0]))
        yes.append(float(i.partition(' ')[2]))
    return [xes, yes]
def cords(res):
    with open(res) as f:
        lines = f.readlines()
    xes = []
    yes = []

    for i in lines:
        xes.append(int(i.partition(' ')[0]))
        yes.append(float(i.partition(' ')[2]))
    print([xes, yes])

fig = go.Figure()
fig.add_trace(go.Scatter(x=cord1('res1.txt')[0], y=cord1('res1.txt')[1]))
fig.add_trace(go.Scatter(x=cord1('res2.txt')[0], y=cord1('res2.txt')[1]))
fig.show()
proc1 = Process(target=cords, args=('res1.txt',))
#proc2 = Process(target=cord1, args=('res2.txt',))
proc1.start()
#proc2.start()
proc1.join()
#proc2.join()
import numpy as np
import random
def get_h2(r):
    alpha=np.random.rand()*np.pi
    betta=np.random.rand()*2*np.pi
    data=[]
    h=0.37
    z_h=h*np.sin(alpha)
    x_h=h*np.cos(alpha)*np.cos(betta)
    y_h=h*np.cos(alpha)*np.sin(betta)
    r_h=np.array([x_h,y_h,z_h])
    data.append([0, r+r_h])# первый элемент - спин (ион-0)
    data.append([0, r-r_h])# первый элемент - спин (ион-0)
    h=0.1
    z_h=h*np.sin(alpha)
    x_h=h*np.cos(alpha)*np.cos(betta)
    y_h=h*np.cos(alpha)*np.sin(betta)
    r_h=np.array([x_h,y_h,z_h])
    data.append([1, r+r_h]) # первый элемент - спин
    h=-0.2
    z_h=h*np.sin(alpha)
    x_h=h*np.cos(alpha)*np.cos(betta)
    y_h=h*np.cos(alpha)*np.sin(betta)
    r_h=np.array([x_h,y_h,z_h])
    data.append([-1, r+r_h]) # первый элемент - спин
    return data
def structure_generator():
    lst = []
    res = []
    k = 0
    while (k < 500):
        a = random.randrange(1, 11, 1)
        b = random.randrange(1, 11, 1)
        c = random.randrange(1, 11, 1)
        n = 0
        for j in lst:
            if (j == [a, b, c]):
                n = 1
        if (n == 0):
            lst.append([a, b, c])
            res.append(get_h2([a*1.7, b*1.7, c*1.7])[0])
            res.append(get_h2([a*1.7, b*1.7, c*1.7])[1])
            res.append(get_h2([a*1.7, b*1.7, c*1.7])[2])
            res.append(get_h2([a*1.7, b*1.7, c*1.7])[3])
            k = k + 1
    return res
structure_generator()

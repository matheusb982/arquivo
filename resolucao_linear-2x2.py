#!/usr/bin/env python
import sys
import math
from tkinter import *
from math import *
 
class Calc:
    def __init__ (self, toplevel):
        toplevel.title("Resolução Linear")
        toplevel.geometry("480x310")
 
        self.espa = Frame(toplevel)
        self.espa.pack()
 
        self.frame1 = Frame(toplevel)
        self.frame1.pack()
 
        self.frame2 = Frame(toplevel)
        self.frame2.pack()

        self.frame3 = Frame(toplevel)
        self.frame3.pack()

        self.frame4 = Frame(toplevel)
        self.frame4.pack()

        self.frame5 = Frame(toplevel)
        self.frame5.pack()

        self.frame6 = Frame(toplevel)
        self.frame6.pack()
 
        self.op = Frame(toplevel, pady=12)
        self.op.pack()

        self.ms = Frame(toplevel, pady=12)
        self.ms.pack()
 
        self.result = Frame(toplevel)
        self.result.pack()
 
        self.bot = Frame(toplevel, pady = 12)
        self.bot.pack()
 
        Label(self.espa,text="", fg = "black", font=("Comic Sans MS", "10"), height = 1).pack
        fonte1 = ("Comic Sans MS", "10")
 
        resolucao = Button(self.op,font=fonte1, text="Resolver",command= self.resolucao)
        resolucao.pack(side = LEFT)
 
        sair = Button(self.op, font = fonte1, text="Fechar", command= self.sair)
        sair.pack(side=LEFT)
 
        Label(self.frame1, text="a1 :",font=fonte1, width=8).pack(side=LEFT)
        self.x=Entry(self.frame1,width=10, font=fonte1)
        self.x.pack(side=LEFT)
 
        Label(self.frame2, text="a2 :",font=fonte1, width=8).pack(side=LEFT)
        self.y=Entry(self.frame2,width=10, font=fonte1)
        self.y.pack(side=LEFT)

        Label(self.frame1, text="a3 :",font=fonte1, width=8).pack(side=LEFT)
        self.z=Entry(self.frame1,width=10, font=fonte1)
        self.z.pack(side=LEFT)

        Label(self.frame2, text="a4 :",font=fonte1, width=8).pack(side=LEFT)
        self.w=Entry(self.frame2,width=10, font=fonte1)
        self.w.pack(side=LEFT)

        Label(self.frame1, text="x :",font=fonte1, width=8).pack(side=LEFT)
        self.m=Entry(self.frame1,width=10, font=fonte1)
        self.m.pack(side=LEFT)

        Label(self.frame2, text="y :",font=fonte1, width=8).pack(side=LEFT)
        self.q=Entry(self.frame2,width=10, font=fonte1)
        self.q.pack(side=LEFT)
 
        Label(self.result,text="a1 :", font=fonte1, width=8).pack(side=LEFT)
        self.mx = Label(self.result,width=10,font = fonte1)
        self.mx.pack(side=LEFT)

        Label(self.result,text="a3 :", font=fonte1, width=8).pack(side=LEFT)
        self.my = Label(self.result,width=10,font = fonte1)
        self.my.pack(side=LEFT)

        Label(self.result,text="x :", font=fonte1, width=8).pack(side=LEFT)
        self.mq = Label(self.result,width=10,font = fonte1)
        self.mq.pack(side=LEFT)

        Label(self.bot,text="a2 :", font=fonte1, width=8).pack(side=LEFT)
        self.mz = Label(self.bot,width=10,font = fonte1)
        self.mz.pack(side=LEFT)

        Label(self.bot,text="a4 :", font=fonte1, width=8).pack(side=LEFT)
        self.mm = Label(self.bot,width=10,font = fonte1)
        self.mm.pack(side=LEFT)

        Label(self.bot,text="y :", font=fonte1, width=8).pack(side=LEFT)
        self.mc = Label(self.bot,width=10,font = fonte1)
        self.mc.pack(side=LEFT)

        Label(self.ms,text="", font=fonte1, width=1).pack(side=LEFT)
        self.msg = Label(self.ms,width=30,font = fonte1)
        self.msg.pack(side=LEFT)
 
    def resolucao(self):
        x = self.x.get()
        y = self.y.get()
        z = self.z.get()
        w = self.w.get()
        m = self.m.get()
        q = self.q.get()
        
        x = float(x)
        y = float(y)
        z = float(z)
        w = float(w)
        m = float(m)
        q = float(q)

        det = (x*w)-(z*y)

        e = x/x
        f = z/x
        s = m/x

        g = y+e*(-y)
        h = w+f*(-y)
        t = q+s*(-y)

        e=math.floor(e)
        f=math.floor(f)
        s=math.floor(s)
        g=math.floor(g)
        h=math.floor(h)
        t=math.floor(t)

        if g == 0 and h == 0 and t != 0:
            self.msg["text"] = "O Sistema é Imposivel"
            self.mx["text"] = e
            self.my["text"] = f
            self.mz["text"] = g
            self.mm["text"] = h
            self.mq["text"] = z
            self.mc["text"] = t
        else:
          if h != 0:
            i = g/h
          else:
            i=0
          
          if h != 0:
            j = h/h
          else:
            j = 0

          if h != 0:
            u = t/h
          else:
            u = 0

        l = e+i*(-f)
        n = f+j*(-f)
        b = s+u*(-f)

        l=math.floor(l)
        n=math.floor(n)
        b=math.floor(b)
        i=math.floor(i)
        j=math.floor(j)
        u=math.floor(u)

        if det != 0:
            self.msg["text"] = "O Sistema é Possivel e Determinado"
            self.mx["text"] = l
            self.my["text"] = n
            self.mz["text"] = i
            self.mm["text"] = j
            self.mq["text"] = b
            self.mc["text"] = u
        else:
            self.msg["text"] = "O Sistema é Possivel e Indeterminado"
            self.mx["text"] = l
            self.my["text"] = n
            self.mz["text"] = i
            self.mm["text"] = j
            self.mq["text"] = b
            self.mc["text"] = u
 
    def sair(self):
        call.destroy()
 
call = Tk()
Calc(call)
 
call.mainloop()

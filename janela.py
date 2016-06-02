import sys
from tkinter import *
from math import *
 
class Calc:
    def __init__ (self, toplevel):
        toplevel.title("Calc")
        toplevel.geometry("210x210")
 
        self.espa = Frame(toplevel)
        self.espa.pack()
 
        self.frame1 = Frame(toplevel)
        self.frame1.pack()
 
        self.frame2 = Frame(toplevel)
        self.frame2.pack()
 
        self.op = Frame(toplevel, pady=12)
        self.op.pack()
 
        self.result = Frame(toplevel)
        self.result.pack()
 
        self.bot = Frame(toplevel, pady = 12)
        self.bot.pack()
 
        Label(self.espa,text="", fg = "black", font=("Comic Sans MS", "10"), height = 1).pack
        fonte1 = ("Comic Sans MS", "10")
 
        somar = Button(self.op,font=fonte1, text="Soma",command= self.somar)
        somar.pack(side = LEFT)
 
        subtrair = Button(self.op,font=fonte1, text="Subtrair",command= self.subtrair)
        subtrair.pack(side = LEFT)
 
        sair = Button(self.bot, font = fonte1, text="Fechar", command= self.sair)
        sair.pack(side=LEFT)
 
        Label(self.frame1, text="Valor :",font=fonte1, width=8).pack(side=LEFT)
        self.x=Entry(self.frame1,width=10, font=fonte1)
        self.x.pack(side=LEFT)
 
        Label(self.frame2, text="Valor :",font=fonte1, width=8).pack(side=LEFT)
        self.y=Entry(self.frame2,width=10, font=fonte1)
        self.y.pack(side=LEFT)
 
        Label(self.result,text="Igual :", font=fonte1, width=8).pack(side=LEFT)
        self.msg = Label(self.result,width=10,font = fonte1)
        self.msg.pack(side=LEFT)
 
    def somar(self):
        x = self.x.get()
        y = self.y.get()
        x = float(x)
        y = float(y)
        resultado = x+y
        resultado = float(resultado)
        self.msg["text"] = resultado
       
    def subtrair(self):
        x = self.x.get()
        y = self.y.get()
        x = float(x)
        y = float(y)
        resultado = x-y
        resultado = float(resultado)
        self.msg["text"] = resultado
 
    def sair(self):
        call.destroy()
 
call = Tk()
Calc(call)
 
call.mainloop()

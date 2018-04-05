import turtle

# Create our turtle and screen objects
t = turtle.Turtle()
wn = turtle.Screen()
wn.setup(300,300)

# define the callback
def gotopoint(x, y):
    t.goto(x,y)

# connect the callback with the click event and wait
wn.onclick(gotopoint)
wn.listen()
turtle.mainloop()


class Clicky:
    def __init__(self):
        self.t = turtle.Turtle()
        self.wn = turtle.Screen()
        self.wn.setup(300,300)
        self.wn.onclick(self.t.goto)

    def main(self):
        turtle.mainloop()

Clicky().main()

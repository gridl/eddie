import collections

grid = collections.namedtuple('Box', ['height', 'width'])
grid.height = 7
grid.width = 7


import pygame, sys

from pygame.locals import *


def main():
    pygame.init()

    DISPLAY = pygame.display.set_mode((500,400),0,32)

    WHITE=(255,255,255)
    blue=(0,0,255)

    DISPLAY.fill(WHITE)

    for i in range(grid.height):
        for i in range(grid.width):
            pygame.draw.rect(
                DISPLAY,
                blue,
                (200,150,100,50)
            )

    while True:
        for event in pygame.event.get():
            if event.type==QUIT:
                pygame.quit()
                sys.exit()
        pygame.display.update()


main()

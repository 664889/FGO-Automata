import os
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
os.chdir(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from core.Automata import Automata


def battle(times):
    bb = Automata("assets/jp/free quest/1.png", "assets/jp/support/1.png", (0, 0))
    bb.select_checkpoint()
    for i in range(times):
        bb.wait("assets/jp/support/1.png")
        bb.advance_support()
        if i == 0:
            bb.start_battle()
        # BATTLE 1
        bb.select_servant_skill(3)
        bb.select_cards([1,2,3])
        # BATTLE 2
        bb.select_cards([6,1,2])
        # FINISH
        if i == times - 1:
            bb.finish_battle(False)
        else:
            bb.finish_battle(True)
            bb.tap_continue(count=i+1)

if __name__ == "__main__":
    battle(45)
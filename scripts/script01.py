from core.Automata import Automata
bb = Automata("assets/free1.png", "assets/support.png", (0, 0))
bb.quick_start()
# BATTLE 1
bb.select_cards([1,2,3])
# BATTLE 2
bb.select_cards([1,2,3])
# BATTLE 3
bb.select_cards([6,1,2])
# FINISH
bb.finish_battle()
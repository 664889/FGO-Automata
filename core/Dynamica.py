from core.Card import Card
from core import util, crds


class Dynamica():
    def __init__(self, sft=(0, 0)):
        """
        Parameters
        ----------
            sft: (int, int), optional
        Coordinate shifts in (x, y). When there are blues straps at the edges. (Default: (0, 0))
        """
        self.cards = []
        self.shifts = sft

    def read_cards(self):
        # util.split_cards(util.get_sh(self.shifts))
        tmp = []
        for i in range(5):
            mark = self.match_mark(i)
            color = self.match_color(i)
            tmp.append(Card(i, mark, color))
        self.cards = tmp

    def match_mark(self, cur: int) -> float:  # note 看不是很懂這是怎麼運作的
        resist = crds.CARD_IMAGE["resist"]
        weak = crds.CARD_IMAGE["weak"]
        mark = f"temp/{cur}.png"
        if util.standby(mark, resist, threshold=0.8):
            return 0.5
        elif util.standby(mark, weak, threshold=0.8):
            return 2
        else:
            return 1

    def match_color(self, cur: int) -> float:
        quick = crds.CARD_IMAGE["quick"]
        # arts = "assets/extra/arts.png"
        buster = crds.CARD_IMAGE["buster"]
        mark = f"temp/{cur}.png"
        if util.check_color(mark, quick, threshold=0.8):
            return 0.8
        elif util.check_color(mark, buster, threshold=0.8):
            return 2
        else:
            return 1

    def arrange_cards(self) -> [Card]:
        max_atk = 0
        max_comb = []
        for fst in self.cards:
            for sec in self.cards:
                if fst == sec:
                    continue
                for trd in self.cards:
                    if sec == trd or fst == trd:
                        continue
                    ex = False
                    if fst.atk == 2:
                        ex = True
                    cur_atk = sum([fst.get_atk(1, ex), sec.get_atk(
                        1.2, ex), trd.get_atk(1.4, ex)])
                    if cur_atk > max_atk:
                        max_atk = cur_atk
                        max_comb = [fst, sec, trd]
        # print(max_atk)
        return max_comb

    def dynamic_battle(self) -> int:
        """ Dynamic Battle
        Returns
        -------
            list: int
        Card order
        """
        self.read_cards()
        out = [i.identity for i in self.arrange_cards()]
        return out

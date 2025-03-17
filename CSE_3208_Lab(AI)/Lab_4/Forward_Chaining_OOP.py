class Forward_Chaining:
    def __init__(self):
        self.facts = ["fever", "cough"]

    def rule1(self):
        if "fever" in self.facts and "infection" not in self.facts:
            self.facts.append("infection")

    def rule2(self):
        if "cough" in self.facts and "infection" in self.facts and "flu" not in self.facts:
            self.facts.append("flu")

    def rule3(self):
        if "rash" in self.facts and "infection" in self.facts and "measles" not in self.facts:
            self.facts.append("measles")


def main():
    Obj = Forward_Chaining()
    Obj.rule1()
    Obj.rule2()
    Obj.rule3()
    print('Facts:', Obj.facts)
    print('Decision:', Obj.facts[-1])


main()
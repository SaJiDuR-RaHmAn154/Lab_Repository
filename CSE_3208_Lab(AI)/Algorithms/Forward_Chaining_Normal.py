facts = ["fever","cough"]

def rule1():
    if "fever" in facts and "infection" not in facts:
        facts.append("infection")
def rule2():
    if "cough" in facts and "infection" in facts  and "flu" not in facts:
        facts.append("flu")
def rule3():
    if "rash" in facts  and "infection" in facts and "measles" not in facts:
        facts.append("measles")


def main():
    rule1()
    rule2()
    rule3()

    print('Facts:',facts)
    print('Decision:',facts[-1])
    
main()
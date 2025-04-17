facts = ["fever", "cough"]

def rule1():
    if "fever" in facts and "infection" not in facts:
        facts.append("infection")
        return True
    return False

def rule2():
    if "cough" in facts and "infection" in facts and "flu" not in facts:
        facts.append("flu")
        return True
    return False

def rule3():
    if "rash" in facts and "infection" in facts and "measles" not in facts:
        facts.append("measles")
        return True
    return False

def backward_chaining(goal):
    if goal in facts:
        return True
    if goal == "infection":
        return rule1()
    elif goal == "flu":
        if backward_chaining("infection"):
            return rule2()
    elif goal == "measles":
        if backward_chaining("infection") and "rash" in facts:
            return rule3()
    return False

def main():
    goal = "flu"
    if backward_chaining(goal):
        print('Facts:', facts)
        print('Goal achieved.\nDecision:', goal)
    else:
        print('Facts:', facts)
        print('Goal not achieved')

main()
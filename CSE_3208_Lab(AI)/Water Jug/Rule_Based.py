from collections import deque

class RuleBase:
    def __init__(self, jug1, jug2, goal):
        self.jug1 = jug1  
        self.jug2 = jug2  
        self.goal = goal  
        self.visited = set()
        self.path = []

    def apply_rule(self, x, y, rule_no):
        if rule_no == 1 and x < self.jug1:
            return (self.jug1, y)
        elif rule_no == 2 and y < self.jug2:
            return (x, self.jug2)
        elif rule_no == 3 and x > 0:
            return (0, y)
        elif rule_no == 4 and y > 0:
            return (x, 0)
        elif rule_no == 5 and x + y >= self.jug1 and y > 0:
            return (self.jug1, x + y - self.jug1)
        elif rule_no == 6 and x + y >= self.jug2 and x > 0:
            return (x + y - self.jug2, self.jug2)
        elif rule_no == 7 and x + y <= self.jug1 and y > 0:
            return (x + y, 0)
        elif rule_no == 8 and x + y <= self.jug2 and x > 0:
            return (0, x + y)
        return None

    def is_goal(self, x, y):
        gx, gy = self.goal
        return (gx == x or gx == -1) and (gy == y or gy == -1)

    def solve(self):
        initial = (0, 0)
        self.visited.add(initial)
        queue = deque()
        queue.append((initial, []))

        while queue:
            (x, y), path = queue.popleft()

            if self.is_goal(x, y):
                self.path = path
                return

            for rule in range(1, 9):
                result = self.apply_rule(x, y, rule)
                if result and result not in self.visited:
                    self.visited.add(result)
                    queue.append((result, path + [(result[0], result[1], rule)]))

        print("No solution found.")

    def print_solution(self):
        if not self.path:
            print("No solution found.")
            return

        print("Rule-Based Solution:")
        print("Jug1\tJug2\tRule Applied")
        for x, y, rule in self.path:
            print(f" {x}\t {y}\t     {rule}")

#  Goal = (2,x) 
result = RuleBase(jug1=4, jug2=3, goal=(2, -1))
result.solve()
result.print_solution()

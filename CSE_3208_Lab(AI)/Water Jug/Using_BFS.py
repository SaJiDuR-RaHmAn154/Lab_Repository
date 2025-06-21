
from collections import deque

class Node:
    def __init__(self, x, y, parent=None):
        self.x = x  # water in jug1
        self.y = y  # water in jug2
        self.parent = parent

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))

    def path(self):
        result = []
        node = self
        while node:
            result.append((node.x, node.y))
            node = node.parent
        return result[::-1]

class BFSWaterJug:
    def __init__(self, cap1, cap2, goal):
        self.cap1 = cap1
        self.cap2 = cap2
        self.goal = goal  

    def is_goal(self, x, y):
        gx, gy = self.goal
        return (gx == -1 or gx == x) and (gy == -1 or gy == y)

    def get_next_states(self, x, y):
        c1, c2 = self.cap1, self.cap2
        states = []

        # Fill Jug1
        states.append((c1, y))
        # Fill Jug2
        states.append((x, c2))
        # Empty Jug1
        states.append((0, y))
        # Empty Jug2
        states.append((x, 0))
        # Pour Jug1 → Jug2
        transfer = min(x, c2 - y)
        states.append((x - transfer, y + transfer))
        # Pour Jug2 → Jug1
        transfer = min(y, c1 - x)
        states.append((x + transfer, y - transfer))

        return states

    def solve(self):
        start = Node(0, 0)
        visited = set()
        queue = deque([start])
        visited.add((0, 0))

        while queue:
            current = queue.popleft()
            if self.is_goal(current.x, current.y):
                return current.path()

            for nx, ny in self.get_next_states(current.x, current.y):
                if (nx, ny) not in visited:
                    visited.add((nx, ny))
                    queue.append(Node(nx, ny, current))

        return None

    def print_solution(self, path):
        if not path:
            print("No solution found.")
        else:
            print("BFS Solution:")
            print("Jug1\tJug2")
            for x, y in path:
                print(f" {x}\t {y}")

# goal (2,x)
result = BFSWaterJug(4, 3, (2, -1))  
bfs_path = result.solve()
result.print_solution(bfs_path)
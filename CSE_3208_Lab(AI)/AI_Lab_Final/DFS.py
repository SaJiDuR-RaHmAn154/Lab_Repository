class Node:
    def __init__(self, value):
        self.value = value
        self.children = []

    def add_child(self, child_node):
        self.children.append(child_node)

def generate_tree():
    root = Node("A")
    node_b = Node("B")
    node_c = Node("C")
    node_d = Node("D")
    node_e = Node("E")
    node_f = Node("F")
    node_g = Node("G")

    root.add_child(node_b)
    root.add_child(node_c)
    node_b.add_child(node_d)
    node_b.add_child(node_e)
    node_c.add_child(node_f)
    node_c.add_child(node_g)

    return root

def DFS(root, goal):
    if root is None:
        return []

    stack = [root]
    visited = []

    while stack:
        current_node = stack.pop()
        visited.append(current_node.value)

        if current_node.value == goal:
            print(f"Goal '{goal}' found!")
            return visited

        for child in reversed(current_node.children):
            stack.append(child)

    print(f"Goal '{goal}' not found.")
    return visited

tree_root = generate_tree()
goal_node = "H"

visited_path = DFS(tree_root, goal_node)

print(f"Traversal Path: {' -> '.join(visited_path)}")
class Node:
    def __init__(self, value):
        self.value = value
        self.children = []

    def add_child(self, child_node):
        self.children.append(child_node)

def dfs_recursive(node, goal, visited):
    if node is None:
        return False

    # Add the current node to the visited list
    visited.append(node.value)

    # Check if the current node is the goal
    if node.value == goal:
        return True

    # Recur for all the children of the current node
    for child in node.children:
        if dfs_recursive(child, goal, visited):
            return True

    # Continue backtracking without removing the node from visited
    return False

# Generate a sample tree
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

# Main function to test the DFS algorithm
if __name__ == "__main__":
    tree_root = generate_tree()
    goal_node = "F"
    visited = []

    if dfs_recursive(tree_root, goal_node, visited):
        print(f"Path to goal node '{goal_node}' (including all visited nodes): {' -> '.join(visited)}")
    else:
        print(f"Goal node '{goal_node}' not found in the tree.")
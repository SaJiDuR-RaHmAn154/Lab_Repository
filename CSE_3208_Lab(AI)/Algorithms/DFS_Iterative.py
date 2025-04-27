class Node:
    def __init__(self, value):
        self.value = value
        self.children = []

    def add_child(self, child_node):
        self.children.append(child_node)

def dfs_iterative(root, goal):
    if root is None:
        return []

    stack = [root]  # Initialize the stack with the root node
    visited = []    # List to store the visited nodes

    while stack:
        # Pop the top node from the stack
        current_node = stack.pop()

        # Add the current node to the visited list
        visited.append(current_node.value)

        # Check if the current node is the goal
        if current_node.value == goal:
            return visited

        # Push the children of the current node to the stack
        # Push right child first so that left child is processed first
        for child in reversed(current_node.children):
            stack.append(child)

    return visited  # Return visited nodes if goal is not found

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

    visited_path = dfs_iterative(tree_root, goal_node)

    if goal_node in visited_path:
        print(f"Path to goal node '{goal_node}' (including all visited nodes): {' -> '.join(visited_path)}")
    else:
        print(f"Goal node '{goal_node}' not found in the tree.")
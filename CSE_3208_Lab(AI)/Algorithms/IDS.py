class Node:
    def __init__(self, value):
        self.value = value
        self.children = []

    def add_child(self, child_node):
        self.children.append(child_node)

def depth_limited_search(node, goal, depth_limit, current_depth=0, path=[]):
    if node is None:
        return False

    # Add the current node to the path
    path.append(node.value)

    # Check if the current node is the goal
    if node.value == goal:
        return True

    # Check if the depth limit is reached
    if current_depth == depth_limit:
        path.pop()  # Backtrack
        return False

    # Recur for each child with depth incremented by 1
    for child in node.children:
        if depth_limited_search(child, goal, depth_limit, current_depth + 1, path):
            return True

    # Backtrack if the goal is not found in this path
    path.pop()
    return False

def iterative_deepening_search(root, goal):
    depth_limit = 0  # Start with depth limit 0

    while True:
        path = []  # Reset the path for each depth limit
        if depth_limited_search(root, goal, depth_limit, path=path):
            return path  # Return the path if the goal is found
        # If no nodes are visited at this depth and the root is not None, continue
        if depth_limit > 100:  # Add a safeguard to prevent infinite loops
            return None
        depth_limit += 1  # Increment the depth limit

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

# Main function to test the IDS algorithm
if __name__ == "__main__":
    tree_root = generate_tree()
    goal_node = "G"

    path = iterative_deepening_search(tree_root, goal_node)

    if path:
        print(f"Path to goal node '{goal_node}': {' -> '.join(path)}")
    else:
        print(f"Goal node '{goal_node}' not found in the tree.")
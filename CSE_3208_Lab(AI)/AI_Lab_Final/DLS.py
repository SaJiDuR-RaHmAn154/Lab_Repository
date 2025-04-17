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

# Main function to test the DLS algorithm
if __name__ == "__main__":
    tree_root = generate_tree()
    goal_node = "G"
    depth_limit = 2
    path = []

    if depth_limited_search(tree_root, goal_node, depth_limit, path=path):
        print(f"Path to goal node '{goal_node}' within depth limit {depth_limit}: {' -> '.join(path)}")
    else:
        print(f"Goal node '{goal_node}' not found within depth limit {depth_limit}.")
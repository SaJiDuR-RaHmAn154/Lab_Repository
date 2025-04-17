class Node:
    def __init__(self, value):
        self.value = value
        self.children = []

def bfs_with_path(root, goal):
    # Initialize a list with the root node and its path
    queue = [root]
    visited = []  # To keep track of the traversal path

    while queue:
        # Dequeue the front node
        node = queue.pop(0)
        visited.append(node.value)  # Add the node to the visited list
        print(f"Visiting node: {node.value}")

        # Check if it is the goal state
        if node.value == goal:
            print(f"Traversal path: {visited}")
            return visited
        
        # Enqueue its children (level-order traversal)
        for child in node.children:
            queue.append(child)
    
    # If all nodes are explored and goal is not found
    print("Goal node not found.")
    return visited

# Create a sample tree
root = Node(1)
root.children = [Node(2), Node(3)]
root.children[0].children = [Node(4), Node(5)]
root.children[1].children = [Node(6), Node(7)]

# Perform BFS and print the path
goal = 4
path = bfs_with_path(root, goal)
if path:
    print(f"Path from source to goal ({goal}): {path}")
else:
    print(f"Goal node {goal} not found in the tree.")
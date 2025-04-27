from collections import deque

def bfs(root, goal):
    # Initialize a queue with the root node
    queue = deque([root])
    
    while queue:
        # Dequeue the front node
        node = queue.popleft()
        
        # Check if it is the goal state
        if node == goal:
            return True
        
        # Enqueue its children (assuming node has 'children' attribute)
        queue.extend(node.children)
    
    # If all nodes are explored and goal is not found
    return False
import heapq

class Node:
    def __init__(self, value, heuristic):
        self.value = value
        self.heuristic = heuristic  # h(n): Estimated cost to the goal
        self.neighbors = []  # List of neighbor nodes

    def add_neighbor(self, neighbor):
        self.neighbors.append(neighbor)

def best_first_search(start, goal):
    # Priority queue (min-heap) for open_list
    open_list = []
    heapq.heappush(open_list, (start.heuristic, start))  # (h(n), node)

    # Closed list to track visited nodes
    closed_list = set()

    # Parent map to reconstruct the path
    parent_map = {}

    while open_list:
        # Remove the node with the lowest h(n) from the open list
        _, current_node = heapq.heappop(open_list)

        # If the goal is found, reconstruct the path
        if current_node.value == goal:
            return reconstruct_path(parent_map, current_node)

        # Add the current node to the closed list
        closed_list.add(current_node)

        # Explore neighbors
        for neighbor in current_node.neighbors:
            if neighbor not in closed_list:
                # Set the parent of the neighbor for path reconstruction
                parent_map[neighbor] = current_node
                # Add the neighbor to the open list with its heuristic value
                heapq.heappush(open_list, (neighbor.heuristic, neighbor))

    # If the goal is not found
    return None

def reconstruct_path(parent_map, node):
    path = []
    while node:
        path.append(node.value)
        node = parent_map.get(node)
    return path[::-1]  # Reverse the path to get it from start to goal

# Generate the example graph
def generate_example_graph():
    # Create nodes with heuristic values
    node_p = Node("P", 10)
    node_a = Node("A", 11)
    node_r = Node("R", 8)
    node_c = Node("C", 6)
    node_m = Node("M", 9)
    node_l = Node("L", 9)
    node_u = Node("U", 4)
    node_e = Node("E", 3)
    node_n = Node("N", 6)
    node_s = Node("S", 0)  # Goal node with heuristic 0

    # Add neighbors
    node_p.add_neighbor(node_a)
    node_p.add_neighbor(node_r)
    node_p.add_neighbor(node_c)
    node_a.add_neighbor(node_m)
    node_r.add_neighbor(node_c)
    node_r.add_neighbor(node_e)
    node_c.add_neighbor(node_u)
    node_m.add_neighbor(node_l)
    node_u.add_neighbor(node_s)
    node_u.add_neighbor(node_n)
    node_l.add_neighbor(node_n)
    node_n.add_neighbor(node_s)

    return node_p, node_s  # Return the start and goal nodes

# Main function to test the Best First Search algorithm
if __name__ == "__main__":
    start_node, goal_node = generate_example_graph()

    path = best_first_search(start_node, goal_node.value)

    if path:
        print(f"Path to goal node '{goal_node.value}': {' -> '.join(path)}")
    else:
        print(f"Goal node '{goal_node.value}' not found in the graph.")
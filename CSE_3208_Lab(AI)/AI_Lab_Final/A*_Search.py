import heapq

class Node:
    def __init__(self, value, heuristic):
        self.value = value
        self.heuristic = heuristic  # h(n): Estimated cost to the goal
        self.neighbors = []  # List of tuples (neighbor_node, cost)

    def add_neighbor(self, neighbor, cost):
        self.neighbors.append((neighbor, cost))

def a_star_search(start, goal):
    # Priority queue (min-heap) for open_list
    open_list = []
    heapq.heappush(open_list, (0 + start.heuristic, 0, start))  # (f(n), g(n), node)

    # Closed list to track visited nodes
    closed_list = set()

    # Parent map to reconstruct the path
    parent_map = {}

    # g_scores to track the cost to reach each node
    g_scores = {start: 0}

    while open_list:
        # Remove the node with the lowest f(n) from the open list
        _, g_current, current_node = heapq.heappop(open_list)

        # If the goal is found, reconstruct the path
        if current_node.value == goal:
            return reconstruct_path(parent_map, current_node)

        # Add the current node to the closed list
        closed_list.add(current_node)

        # Explore neighbors
        for neighbor, cost in current_node.neighbors:
            if neighbor in closed_list:
                continue

            # Calculate tentative g(n) for the neighbor
            tentative_g = g_current + cost

            # If the neighbor is not in the open list or we found a better path
            if neighbor not in g_scores or tentative_g < g_scores[neighbor]:
                # Update g_score and parent map
                g_scores[neighbor] = tentative_g
                parent_map[neighbor] = current_node

                # Calculate f(n) = g(n) + h(n)
                f_neighbor = tentative_g + neighbor.heuristic

                # Add the neighbor to the open list
                heapq.heappush(open_list, (f_neighbor, tentative_g, neighbor))

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
    node_s = Node("S", 7)
    node_a = Node("A", 8)
    node_b = Node("B", 6)
    node_c = Node("C", 5)
    node_d = Node("D", 5)
    node_e = Node("E", 3)
    node_f = Node("F", 3)
    node_g = Node("G", 0)  # Goal node with heuristic 0
    node_h = Node("H", 7)
    node_i = Node("I", 4)
    node_j = Node("J", 5)
    node_k = Node("K", 3)

    # Add neighbors and costs
    node_s.add_neighbor(node_a, 4)
    node_s.add_neighbor(node_b, 10)
    node_s.add_neighbor(node_c, 11)
    node_a.add_neighbor(node_d, 8)
    node_b.add_neighbor(node_d, 15)
    node_b.add_neighbor(node_e, 20)
    node_c.add_neighbor(node_e, 2)
    node_c.add_neighbor(node_f, 12)
    node_d.add_neighbor(node_h, 16)
    node_d.add_neighbor(node_i, 20)
    node_e.add_neighbor(node_g, 19)
    node_f.add_neighbor(node_g, 13)
    node_h.add_neighbor(node_j, 2)
    node_i.add_neighbor(node_j, 5)
    node_i.add_neighbor(node_k, 13)
    node_j.add_neighbor(node_k, 7)
    node_k.add_neighbor(node_g, 16)

    return node_s, node_g  # Return the start and goal nodes

# Main function to test the A* Search algorithm
if __name__ == "__main__":
    start_node, goal_node = generate_example_graph()

    path = a_star_search(start_node, goal_node.value)

    if path:
        print(f"Path to goal node '{goal_node.value}': {' -> '.join(path)}")
    else:
        print(f"Goal node '{goal_node.value}' not found in the graph.")
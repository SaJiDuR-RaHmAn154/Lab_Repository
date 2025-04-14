// Step 1: Product Interface
interface Transport {
    void deliver();
}

// Step 2: Concrete Products
class RoadTransport implements Transport {
    @Override
    public void deliver() {
        System.out.println("Delivering by road using a truck.");
    }
}

class SeaTransport implements Transport {
    @Override
    public void deliver() {
        System.out.println("Delivering by sea using a ship.");
    }
}

// Step 3: Creator (Abstract Factory)
abstract class Logistics {
    // Factory Method
    public abstract Transport createTransport();

    public void planDelivery() {
        // Common workflow for planning deliveries
        Transport transport = createTransport();
        transport.deliver();
    }
}

// Step 4: Concrete Creators
class RoadLogistics extends Logistics {
    @Override
    public Transport createTransport() {
        return new RoadTransport();
    }
}

class SeaLogistics extends Logistics {
    @Override
    public Transport createTransport() {
        return new SeaTransport();
    }
}

// Step 5: Client Code
public class LogisticsApp {
    public static void main(String[] args) {
        Logistics roadLogistics = new RoadLogistics();
        roadLogistics.planDelivery();

        Logistics seaLogistics = new SeaLogistics();
        seaLogistics.planDelivery();
    }
}

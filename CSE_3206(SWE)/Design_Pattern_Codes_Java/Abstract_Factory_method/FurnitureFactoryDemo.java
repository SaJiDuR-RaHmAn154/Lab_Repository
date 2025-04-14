public class FurnitureFactoryDemo {

    // Abstract Product: Chair
    interface Chair {
        void sitOn();
    }

    // Abstract Product: Sofa
    interface Sofa {
        void relaxOn();
    }

    // Concrete Product: Modern Chair
    static class ModernChair implements Chair {
        public void sitOn() {
            System.out.println("Sitting on a modern chair.");
        }
    }

    // Concrete Product: Victorian Chair
    static class VictorianChair implements Chair {
        public void sitOn() {
            System.out.println("Sitting on a victorian chair.");
        }
    }

    // Concrete Product: Modern Sofa
    static class ModernSofa implements Sofa {
        public void relaxOn() {
            System.out.println("Relaxing on a modern sofa.");
        }
    }

    // Concrete Product: Victorian Sofa
    static class VictorianSofa implements Sofa {
        public void relaxOn() {
            System.out.println("Relaxing on a victorian sofa.");
        }
    }

    // Abstract Factory
    interface FurnitureFactory {
        Chair createChair();
        Sofa createSofa();
    }

    // Concrete Factory: Modern Furniture
    static class ModernFurnitureFactory implements FurnitureFactory {
        public Chair createChair() {
            return new ModernChair();
        }

        public Sofa createSofa() {
            return new ModernSofa();
        }
    }

    // Concrete Factory: Victorian Furniture
    static class VictorianFurnitureFactory implements FurnitureFactory {
        public Chair createChair() {
            return new VictorianChair();
        }

        public Sofa createSofa() {
            return new VictorianSofa();
        }
    }

    // Client
    static class FurnitureStore {
        private Chair chair;
        private Sofa sofa;

        public FurnitureStore(FurnitureFactory factory) {
            chair = factory.createChair();
            sofa = factory.createSofa();
        }

        public void displayFurniture() {
            chair.sitOn();
            sofa.relaxOn();
        }
    }

    // Main method
    public static void main(String[] args) {
        // You can change this to "victorian" to switch styles
        String style = "modern";

        FurnitureFactory factory;
        if (style.equalsIgnoreCase("modern")) {
            factory = new ModernFurnitureFactory();
        } else {
            factory = new VictorianFurnitureFactory();
        }

        FurnitureStore store = new FurnitureStore(factory);
        store.displayFurniture();
    }
}

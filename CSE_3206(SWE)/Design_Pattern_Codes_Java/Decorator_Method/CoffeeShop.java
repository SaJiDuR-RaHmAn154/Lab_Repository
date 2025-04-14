// Component Interface
interface Coffee {
    String getDescription();
    double getCost();
}

// ConcreteComponent
class SimpleCoffee implements Coffee {
    @Override
    public String getDescription() {
        return "Simple Coffee";
    }

    @Override
    public double getCost() {
        return 5.0;
    }
}

// Abstract Decorator
abstract class CoffeeDecorator implements Coffee {
    protected Coffee coffee;

    public CoffeeDecorator(Coffee coffee) {
        this.coffee = coffee;
    }

    @Override
    public String getDescription() {
        return coffee.getDescription();
    }

    @Override
    public double getCost() {
        return coffee.getCost();
    }
}

// Concrete Decorators
class MilkDecorator extends CoffeeDecorator {
    public MilkDecorator(Coffee coffee) {
        super(coffee);
    }

    @Override
    public String getDescription() {
        return coffee.getDescription() + ", Milk";
    }

    @Override
    public double getCost() {
        return coffee.getCost() + 1.5;
    }
}

class SugarDecorator extends CoffeeDecorator {
    public SugarDecorator(Coffee coffee) {
        super(coffee);
    }

    @Override
    public String getDescription() {
        return coffee.getDescription() + ", Sugar";
    }

    @Override
    public double getCost() {
        return coffee.getCost() + 0.5;
    }
}

class WhippedCreamDecorator extends CoffeeDecorator {
    public WhippedCreamDecorator(Coffee coffee) {
        super(coffee);
    }

    @Override
    public String getDescription() {
        return coffee.getDescription() + ", Whipped Cream";
    }

    @Override
    public double getCost() {
        return coffee.getCost() + 2.0;
    }
}

public class CoffeeShop {
    public static void main(String[] args) {
        // Basic Coffee
        Coffee coffee = new SimpleCoffee();
        System.out.println(coffee.getDescription() + " -> $" + coffee.getCost());

        // Add Milk
        coffee = new MilkDecorator(coffee);
        System.out.println(coffee.getDescription() + " -> $" + coffee.getCost());

        // Add Sugar
        coffee = new SugarDecorator(coffee);
        System.out.println(coffee.getDescription() + " -> $" + coffee.getCost());

        // Add Whipped Cream
        coffee = new WhippedCreamDecorator(coffee);
        System.out.println(coffee.getDescription() + " -> $" + coffee.getCost());
    }
}

public class Main 
{
    public static void main(String[] args) 
    {
        Government Gov1 = Government.getInstance();
        Government Gov2 = Government.getInstance();

        Gov1.govern("Implementing new policies.");
        Gov2.govern("Addressing national security.");

        System.out.println("Gov1 and Gov2 are the same Government: " + (Gov1 == Gov2) + '\n');
    }
}



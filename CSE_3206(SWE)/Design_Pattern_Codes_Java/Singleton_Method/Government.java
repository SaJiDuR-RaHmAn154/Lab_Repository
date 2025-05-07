public class Government {
    private static Government instance;

    private Government() {
        System.out.println("\nA new government has been formed.");
    }

    public static Government getInstance() {
        if (instance == null) {
            instance = new Government();
        }
        return instance;
    }

    public void govern(String message) {
        System.out.println("Government action: " + message);
    }
}


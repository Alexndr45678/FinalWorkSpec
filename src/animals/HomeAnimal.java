package animals;

import java.util.List;

public class HomeAnimal extends Animal {
    private String color;
    public HomeAnimal(String name, String birthDay, String voice, String color, List<String> commands) {
        super(name, birthDay, voice, commands);
        this.color = color;
    }

    public String getColor() {
        return color;
    }
}

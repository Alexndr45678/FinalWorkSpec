package animals;


import java.util.List;

public class PackAnimal extends Animal {
    private String color;

    public PackAnimal(String name, String birthDay, String voice, String color, List<String> commands) {
        super(name, birthDay, voice, commands);
        this.color = color;
    }

    public String getColor() {
        return color;
    }
}

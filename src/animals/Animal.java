package animals;

import java.util.List;

public class Animal {
    private String name;
    private String birthDay;
    private String voice;
    private List<String> commands;

    public Animal(String name, String birthDay, String voice, List<String> commands) {
        this.name = name;
        this.birthDay = birthDay;
        this.voice = voice;
        this.commands = commands;
    }

    public String getName() {
        return name;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public String getVoice() {
        return voice;
    }

    public List<String> getCommands() {
        return commands;
    }

    @Override
    public String toString() {
        return String.format("Имя: %s\n" +
                "День рождения: %s\n" +
                "Голос: %s\n" +
                "Команды: %s", name, birthDay, voice, commands.toString());
    }
}

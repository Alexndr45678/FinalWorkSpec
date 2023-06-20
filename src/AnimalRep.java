import animals.Animal;
import animals.HomeAnimal;
import animals.PackAnimal;

import java.util.ArrayList;
import java.util.List;

public class AnimalRep implements AutoCloseable{
    private List<Animal> animals;
    private int counter;

    public AnimalRep() {
        animals = new ArrayList<Animal>();
        counter = 0;
    }

    public void addAnimal(Animal animal) {
        animals.add(animal);
        counter++;
    }

    public void showCommands(Animal animal) {
        System.out.println("Команды животного:");
        for (String command : animal.getCommands()) {
            System.out.println("-- " + command);
        }
    }

    public List<Animal> getAnimals() {
        return animals;
    }

    public void addNewCommand(Animal animal, String command) {
        if (animal instanceof HomeAnimal) {
            System.out.println("Новая команда для домашнего животного: " + command);
            animal.getCommands().add(command);
        } else if (animal instanceof  PackAnimal) {
            System.out.println("Новая команда для вьючного животного: " + command);
        } else {
            System.out.println("Неизвстное животное");
        }
    }

    public Animal getAnimalOfName(String name) throws Exception {
        for (Animal animal : animals) {
            if (animal.getName().equalsIgnoreCase(name)) {
                return animal;
            }
        }
        throw new Exception("Животное не найдено");
    }

    @Override
    public void close() throws Exception {
        if (counter > 0) {
            throw new Exception("Работа с реестром не завершена");
        }
    }
}

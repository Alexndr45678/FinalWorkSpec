import animals.*;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        try (AnimalRep rep = new AnimalRep()) {
            Scanner scanner = new Scanner(System.in);
            int choice = -1;
            menu();
            while (choice != 0) {
                try {
                    choice = scanner.nextInt();
                    scanner.nextLine();
                    switch (choice) {
                        case 1:
                            System.out.println("Введите тип животного (cat, dog, hamster, camel, donkey, horse)");
                            String typeAnimal = scanner.nextLine();

                            System.out.println("Введите имя:");
                            String name = scanner.nextLine();

                            System.out.println("Введите дату рождения: ");
                            String birthDay = scanner.nextLine();

                            System.out.println("Введите звук:");
                            String voice = scanner.nextLine();

                            if (typeAnimal.equals("cat")) {
                                System.out.println("Введите цвет кошки: ");
                                String color = scanner.nextLine();
                                Cat cat = new Cat(name, birthDay, voice, color, new ArrayList<String>());
                                rep.addAnimal(cat);
                            } else if (typeAnimal.equals("dog")) {
                                System.out.println("Введите цвет собаки: ");
                                String color = scanner.nextLine();
                                Dog dog = new Dog(name, birthDay, voice, color, new ArrayList<String>());
                                rep.addAnimal(dog);
                            } else if (typeAnimal.equals("hamster")) {
                                System.out.println("Введите цвет хомяка: ");
                                String color = scanner.nextLine();
                                Hamster hamster = new Hamster(name, birthDay, voice, color, new ArrayList<String>());
                                rep.addAnimal(hamster);
                            } else if (typeAnimal.equals("horse")) {
                                System.out.println("Введите цвет лошади: ");
                                String color = scanner.nextLine();
                                Horse horse = new Horse(name, birthDay, voice, color, new ArrayList<String>());
                                rep.addAnimal(horse);
                            } else if (typeAnimal.equals("camel")) {
                                System.out.println("Введите цвет верблюда: ");
                                String color = scanner.nextLine();
                                Camel camel = new Camel(name, birthDay, voice, color, new ArrayList<String>());
                                rep.addAnimal(camel);
                            } else if (typeAnimal.equals("donkey")) {
                                System.out.println("Введите цвет осла: ");
                                String color = scanner.nextLine();
                                Donkey donkey = new Donkey(name, birthDay, voice, color, new ArrayList<String>());
                                rep.addAnimal(donkey);
                            } else {
                                System.out.println("Такого типа животного нет");
                            }
                            input();
                            break;

                        case 2:
                            System.out.println("Введите имя животного: ");
                            String nameAnimal = scanner.nextLine();
                            Animal animal = rep.getAnimalOfName(nameAnimal);
                            if (animal instanceof HomeAnimal) {
                                System.out.println(nameAnimal + " домашнее животное");
                            } else if (animal instanceof PackAnimal) {
                                System.out.println(nameAnimal + " вьючное животное");
                            } else {
                                System.out.println("Тип животного неизвестен");
                            }
                            input();
                            break;

                        case 3:
                            System.out.println("Введите имя животного: ");
                            String animalName = scanner.nextLine();
                            rep.showCommands(rep.getAnimalOfName(animalName));
                            input();
                            break;

                        case 4:
                            System.out.println("Введите имя животного: ");
                            String nameAnimal_ = scanner.nextLine();
                            System.out.println("Введите новую команду для животного: ");
                            String newCommand = scanner.nextLine();
                            rep.addNewCommand(rep.getAnimalOfName(nameAnimal_), newCommand);
                            input();
                            break;

                        case 5:
                            for (Animal animal1 : rep.getAnimals()) {
                                System.out.println(animal1);
                            }
                            input();
                            break;

                        case 6:
                            menu();
                            break;

                        case 0:
                            System.out.println("Вы вышли из программы.");
                            break;

                        default:
                            System.out.println("Такого пункта в меню нет. Попробуйте ещё раз.");
                            break;
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    input();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void menu() {
        System.out.println("1. Завести новое животное");
        System.out.println("2. Определить класс животного");
        System.out.println("3. Список команд животного");
        System.out.println("4. Обучить новым командам");
        System.out.println("5. Список животных");
        System.out.println("6. Меню");
        System.out.println();
        System.out.println("Выберите пункт меню:");
    }
    public static void input() {
        System.out.println("Выберите действие:");
    }
}

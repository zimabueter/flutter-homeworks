import 'package:flutter/cupertino.dart';

class ProviderAnimal with ChangeNotifier {
  String animalName = "zebra";
var animalDescription = {
  'zebra':
  'Zebras have black fur with white stripes and predominantly white bellies',
  'cat':
  'Cat has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey',
  'dog':
  'Dogs are domesticated mammals, not natural wild animals. They were originally bred from wolves.',
  'horse':
  'Horses have long necks, long legs, and singular solid hooves on the ends of their feet.'
};

  String get getAnimal => animalName;
  String? get description => animalDescription[animalName];

  void changeAnimal(String nameOfAnimal) {
    animalName = nameOfAnimal;
    notifyListeners();
  }
}

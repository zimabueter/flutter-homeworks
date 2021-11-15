
import 'package:midtermtask/data/model/clothes_model.dart';
import 'package:midtermtask/data/model/dummy_data.dart';

class ClothesRepository {
  void addClothes(Clothes clothes) {
    DUMMY_DATA.add(clothes);
  }

  void editClothes(Clothes clothes, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [clothes]);
  }

  void removeClothes(int? id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }
}
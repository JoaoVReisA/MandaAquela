import 'package:get/get.dart';

class SearchPageController extends GetxController {
  SearchPageController();

  final searchInput = ''.obs;

  void onChangeSearchInput(String value) {
    searchInput.value = value;
  }
}

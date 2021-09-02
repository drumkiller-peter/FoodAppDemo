import 'package:get/get.dart';
import 'package:intern_project/network/network_calls.dart';

class HomePageController extends GetxController {
  NetworkCalls _networkCalls = NetworkCalls();
  var _response;
  var isloading = false.obs;
  var categories = [].obs;
  var catId = [].obs;
  var totalBookmarked = [].obs;

  getUserDetails() async {
    return await _networkCalls.getUserDetails();
  }

  getAllCategories() async {
    isloading.value = true;
    _response = await _networkCalls.getCategories();
    _response.forEach((element) {
      categories.add(element.category);
      catId.add(element.id);
      totalBookmarked.add(element.totalBookmarked);
    });
    isloading.value = false;
    return _response;
  }
}

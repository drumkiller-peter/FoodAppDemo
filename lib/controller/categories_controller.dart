import 'package:get/get.dart';
import 'package:intern_project/network/network_calls.dart';
import 'package:intern_project/network/response/categories_response.dart';
import 'package:intern_project/network/response/item_response.dart';
import 'package:intern_project/network/response/labels_response.dart';
import 'package:intern_project/view/categories.dart';

class CategoriesController extends GetxController {
  NetworkCalls _networkCalls = NetworkCalls();

  var newBookmarState = false.obs;
  var isTapped = false.obs;

  Future<List<LabelsResponse>?> getLabels(String catId) async {
    try {
      var labels = await _networkCalls.getLabels(catId);
      return labels;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<List<ItemsResponse>> getItems(String catId) async {
    var items = await _networkCalls.getItems(catId);
    return items;
  }

  updateFavourite(ItemsResponse itemsResponse) async {
    var newBookMark = itemsResponse.isFavorite == true
        ? false
        : itemsResponse.isFavorite == false
            ? true
            : null;
    var requestUpdate = ItemsResponse(
      id: itemsResponse.id,
      image: itemsResponse.image,
      catId: itemsResponse.catId,
      labelId: itemsResponse.labelId,
      isFavorite: newBookMark,
      isBookmarked: itemsResponse.isBookmarked,
    );
    await _networkCalls.updateFavourite(requestUpdate);
  }

  deleteItems(ItemsResponse itemsResponse,
      CategoriesResponse categoriesResponse) async {
    var _response = await _networkCalls.deleteItems(itemsResponse);
    // Get.snackbar("Delete", "Item Deleted Successfully");
    Get.to(() => CategoriesScreen(categoriesResponse: categoriesResponse));

    return _response;
  }
}

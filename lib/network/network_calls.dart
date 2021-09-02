import 'package:intern_project/network/network_base.dart';
import 'package:intern_project/network/response/categories_response.dart';
import 'package:intern_project/network/response/item_response.dart';
import 'package:intern_project/network/response/labels_response.dart';
import 'package:intern_project/network/response/user_detail_response.dart';

class NetworkCalls {
  NetworkBase _networkBase = NetworkBase();
  String _userDetails = "userDetails/";
  String _categories = "categories/";
  String _labels = "labels?catId=";
  String _itemsFilter = "items?catId=";
  String _items = "items/";

  Future getUserDetails() async {
    var _response = await _networkBase.get(_userDetails);

    List<UserDetailResponse> _responses = [];
    if (_response != null) {
      _response.forEach((e) => _responses.add(UserDetailResponse.fromJson(e)));
    }
    return _responses[0].fullName;
  }

  Future getCategories() async {
    var _response = await _networkBase.get(_categories);

    List<CategoriesResponse> _responses = [];
    if (_response != null) {
      _response.forEach((e) => _responses.add(CategoriesResponse.fromJson(e)));
    }
    return _responses;
  }

  Future<List<LabelsResponse>> getLabels(String catId) async {
    var _response = await _networkBase.get(_labels + catId);

    List<LabelsResponse> _responses = [];
    if (_response != null) {
      _response.forEach((e) => _responses.add(LabelsResponse.fromJson(e)));
    }
    return _responses;
  }

  Future<List<ItemsResponse>> getItems(String catId) async {
    var _response = await _networkBase.get(_itemsFilter + catId);

    List<ItemsResponse> _responses = [];
    if (_response != null) {
      _response.forEach((e) => _responses.add(ItemsResponse.fromJson(e)));
    }
    return _responses;
  }

  updateFavourite(ItemsResponse itemsResponse) async {
    var _response = await _networkBase.put(
        _items + itemsResponse.id.toString(), itemsResponse);
    print(_response);
    return _response;
  }

  deleteItems(ItemsResponse itemsResponse) async {
    var _response = await _networkBase.delete(
        _items + itemsResponse.id.toString(), itemsResponse);
    return _response;
  }
}

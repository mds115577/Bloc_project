import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'model/details_model.dart';
import 'model/home_model.dart';

Future<HomeScreenModel?> homeScreenApiCall(int id) async {
  // final prefs = await SharedPreferences.getInstance();
  // final userId = prefs.getInt("userId");
  var body = {
    "user_id": id,
  };
  try {
    final request = await http.post(
        Uri.parse(
            "http://phpstack-732301-3275132.cloudwaysapps.com/api/home-data"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"});
    log(request.statusCode.toString());
    if (request.statusCode == 200) {
      final homeScreenModel = homeScreenModelFromJson(request.body);
      // homeScreeList.assign(homeScreenModel);
      // categoryList.assignAll(homeScreenModel.categories);
      // shopDataList.assignAll(homeScreenModel.shopData);

      // favList = RxList.filled(shopDataList.length, false);

      // update();
      return homeScreenModel;
    }
  } catch (e) {
    log(e.toString());
  }

  return null;
}

Future<ShopDetailsModel?> shopDetails({shopId}) async {
  // final prefs = await SharedPreferences.getInstance();
  // final userId = prefs.getInt("userId");
  // log(userId.toString());
  try {
    final body = {"user_id": 26, "shop_id": shopId};
    final request = await http.post(
        Uri.parse(
            "http://phpstack-732301-3275132.cloudwaysapps.com/api/shop/product"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"});
    log(request.body);
    if (request.statusCode == 200) {
      final shopDetailsModel = shopDetailsModelFromJson(request.body);
      // if (shopDetailsModel.success == true) {
      //   // bannerShopDetailList.assignAll(shopDetailsModel.banners);
      //   // shopDetailsCatedgoryList.assignAll(shopDetailsModel.categories);
      //   // shopDetailsProductList.assignAll(shopDetailsModel.products);
      //   // // log(shopDetailsProductList.toString());
      //   // update();
      // }
      return shopDetailsModel;
    }
  } catch (e) {
    log(e.toString());
  }

  return null;
}

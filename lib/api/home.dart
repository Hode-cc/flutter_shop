import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return (await dioRequest.get(HttpConstants.BANNER_LIST) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return (await dioRequest.get(HttpConstants.CATEGORY_LIST) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<SpecialRecommend> getSpecialRecommendAPI() async {
  return SpecialRecommend.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<SpecialRecommend> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommend.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommend> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommend.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.fromJson(item as Map<String, dynamic>);
      })
      .toList();
}

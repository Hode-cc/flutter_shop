class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json["id"], imgUrl: json["imgUrl"]);
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  List<CategoryItem>? goods;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"],
      name: json["name"],
      picture: json["picture"],
      children: json["children"],
      goods: json["goods"],
    );
  }
}

/// 特惠推荐
class SpecialRecommend {
  String id;
  String title;
  List<SubType> subTypes;
  SpecialRecommend({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommend.fromJson(Map<String, dynamic> json) {
    var subTypesJson = json["subTypes"] as List;
    List<SubType> subTypes = subTypesJson
        .map((item) => SubType.fromJson(item as Map<String, dynamic>))
        .toList();

    return SpecialRecommend(
      id: json["id"],
      title: json["title"],
      subTypes: subTypes,
    );
  }
}

/// 子分类(如:抢先尝鲜、新品预告)
class SubType {
  String id;
  String title;
  GoodsItems? goodsItems;
  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json["id"],
      title: json["title"],
      goodsItems: json["goodsItems"] != null
          ? GoodsItems.fromJson(json["goodsItems"])
          : null,
    );
  }
}

/// 商品分页信息
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem>? items;
  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    var itemsJson = json["items"] as List?;
    List<GoodsItem>? items = itemsJson
        ?.map((item) => GoodsItem.fromJson(item as Map<String, dynamic>))
        .toList();

    return GoodsItems(
      counts: json["counts"],
      pageSize: json["pageSize"],
      pages: json["pages"],
      page: json["page"],
      items: items,
    );
  }
}

/// 商品
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      price: json["price"],
      picture: json["picture"],
      orderNum: json["orderNum"],
    );
  }
}

class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.fromJson(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HomeCategory.dart';
import 'package:hm_shop/components/Home/HomeHot.dart';
import 'package:hm_shop/components/Home/HomeMoreList.dart';
import 'package:hm_shop/components/Home/HomeSlider.dart';
import 'package:hm_shop/components/Home/HomeSuggestion.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> bannerItems = [];
  List<CategoryItem> categoryItems = [];
  // 推荐列表
  List<GoodDetailItem> recommendList = [];
  SpecialRecommend specialRecommend = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  SpecialRecommend inVogueResult = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommend oneStopResult = SpecialRecommend(
    id: "",
    title: "",
    subTypes: [],
  );

  List<Widget> getScrollWidgets() {
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerItems: bannerItems)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeCategory(categoryItems: categoryItems)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: HomeSuggestion(specialRecommend: specialRecommend),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HomeHot(result: inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HomeHot(result: oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HomeMoreList(recommendList: recommendList),
    ];
  }

  @override
  void initState() {
    super.initState();
    registerEvent();
    Future.microtask(() {
      key.currentState?.show();
    });
  }

  void registerEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        getRecommendList();
      }
    });
  }

  Future<void> getSpecialRecommend() async {
    specialRecommend = await getSpecialRecommendAPI();
    setState(() {});
  }

  Future<void> getBannerList() async {
    bannerItems = await getBannerListAPI();
    setState(() {});
  }

  Future<void> getCategoryList() async {
    categoryItems = await getCategoryListAPI();
    setState(() {});
  }

  // 获取热榜推荐列表
  Future<void> getInVogueList() async {
    inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  Future<void> getOneStopList() async {
    oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  // 获取推荐列表
  Future<void> getRecommendList() async {
    if (isLoading || !hasMore) {
      return;
    }
    isLoading = true;
    int limit = page * 10;
    recommendList = await getRecommendListAPI({"limit": limit});
    isLoading = false;
    page++;
    if (recommendList.length < 10) {
      hasMore = false;
    }
    setState(() {});
  }

  ScrollController scrollController = ScrollController();

  Future<void> onRefresh() async {
    page = 1;
    isLoading = false;
    hasMore = true;
    recommendList = [];
    await getBannerList();
    await getCategoryList();
    await getSpecialRecommend();
    await getInVogueList();
    await getOneStopList();
    await getRecommendList();
    ToastUtils.showToast(context, "刷新成功");
  }

  final GlobalKey<RefreshIndicatorState> key =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: key,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
          controller: scrollController,
          slivers: getScrollWidgets(),
        ),
      ),
      onRefresh: () => onRefresh(),
    );
  }
}

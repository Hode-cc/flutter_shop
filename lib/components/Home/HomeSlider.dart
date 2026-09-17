import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.bannerItems});

  final List<BannerItem> bannerItems;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  CarouselSliderController controller = CarouselSliderController();
  int currentPage = 0;
  Widget getSlider() {
    return CarouselSlider(
      carouselController: controller,
      items: List.generate(widget.bannerItems.length, (int index) {
        return Image.network(
          widget.bannerItems[index].imgUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        );
      }),
      options: CarouselOptions(
        autoPlayInterval: Duration(seconds: 1),
        viewportFraction: 1,
        autoPlay: false,
        height: 260,
        onPageChanged: (int index, reason) {
          currentPage = index;
          setState(() {});
        },
      ),
    );
  }

  Widget getSearch() {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget getIndicator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerItems.length, (int index) {
            return GestureDetector(
              onTap: () {
                controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 6,
                width: index == currentPage ? 20 : 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: index == currentPage
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   alignment: Alignment.center,
    //   width: double.infinity,
    //   height: 300,
    //   color: Colors.blue,
    //   child: Text("轮播图", style: TextStyle(fontSize: 24, color: Colors.white)),
    // );
    return Stack(children: [getSlider(), getSearch(), getIndicator()]);
  }
}

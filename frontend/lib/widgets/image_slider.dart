import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  int activeIndex;

  ImageSlider({
    super.key,
    required this.images,
    required this.activeIndex,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.activeIndex,
      viewportFraction: 0.8, // 페이지의 너비 비율 설정
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // 반투명 검은색 배경
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          '대전광역시 동물보호센터',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                widget.activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
            activeIndex: widget.activeIndex,
            count: widget.images.length,
            effect: SlideEffect(
              spacing: 5.0,
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors.grey,
              dotColor: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

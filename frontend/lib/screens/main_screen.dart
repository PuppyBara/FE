import 'package:flutter/material.dart';
import 'package:frontend/widgets/accodian_main.dart';

import 'package:frontend/widgets/image_slider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const buttonTextColor = Color.fromRGBO(59, 59, 59, 0.39);
  static const hsbaColor = Color.fromRGBO(59, 59, 59, 0.23);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.061),
            Row(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(
                              132, 205, 188, 1), // rgba(132, 205, 188, 1)
                          Color.fromRGBO(
                              255, 204, 128, 1), // rgba(255, 204, 128, 1)
                          Color.fromRGBO(
                              207, 219, 169, 1), // rgba(207, 219, 169, 1)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.9, 1.0],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "Findog",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(0, 4),
                                      blurRadius: 15,
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "2가지 AI를 이용하여",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                "당신의 실종된 반려동물을",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                "빠르게 찾아드립니다.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Image.asset(
                            'assets/images/home1.png',
                            width: 194,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Text(
                            "검색어를 입력하세요.",
                            style: TextStyle(
                              fontSize: 16,
                              color: hsbaColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search_sharp),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buttonColumn(Icons.home_filled, "보호소"),
                  _buttonColumn(Icons.circle, "AI검색"),
                  _buttonColumn(Icons.favorite, "보호중"),
                  _buttonColumn(Icons.bookmark, "실종공고"),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const AccodianMain(),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("근처 보호소의 최근 공고",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20)),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                            "대전광역시, 유성구",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageSlider(images: const [
                  'assets/images/samplePuppy.jpeg',
                  'assets/images/samplePuppy2.jpeg',
                  'assets/images/samplePuppy3.jpeg',
                ], activeIndex: 0),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonColumn(IconData iconData, String label) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            side: BorderSide.none,
          ),
          child: Column(
            children: [
              Icon(
                iconData,
                size: 40,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: MainScreen.buttonTextColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

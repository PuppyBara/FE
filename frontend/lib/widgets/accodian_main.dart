import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class AccodianMain extends StatefulWidget {
  const AccodianMain({super.key});

  @override
  _AccodianMainState createState() => _AccodianMainState();
}

class _AccodianMainState extends State<AccodianMain> {
  int _expandedIndex = -1; // 현재 확장된 아코디언의 인덱스를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    const Color customBlack = Color.fromRGBO(58, 58, 58, 1);
    const Color customGrey = Color.fromRGBO(115, 115, 115, 1);

    return Column(
      children: [
        ExpandableCard(
          header: const ExpandableCardText(
              titleText: "등록한 실종공고", customBlack: customBlack),
          isExpanded: _expandedIndex == 0,
          onTap: () {
            setState(() {
              _expandedIndex = _expandedIndex == 0 ? -1 : 0;
            });
          },
          expandedChild: const ExpandableCardContent(
            image: 'assets/images/samplePuppy2.jpeg',
            name: "재롱이",
            age: "8",
            location: "대전광역시 시청역.. 부근",
            date: "2024-06-15",
          ),
        ),
        const SizedBox(height: 10),
        ExpandableCard(
          header: const ExpandableCardText(
            titleText: "등록한 보호동물",
            customBlack: customBlack,
          ),
          isExpanded: _expandedIndex == 1,
          onTap: () {
            setState(() {
              _expandedIndex = _expandedIndex == 1 ? -1 : 1;
            });
          },
          expandedChild: const ExpandableCardContent(
            image: 'assets/images/samplePuppy2.jpeg',
            name: "재롱이",
            location: "대전광역시 시청역.. 부근",
            date: "2024-06-15",
          ),
        ),
      ],
    );
  }
}

class ExpandableCardContent extends StatelessWidget {
  const ExpandableCardContent({
    super.key,
    required this.image,
    this.age,
    required this.name,
    required this.date,
    required this.location,
  });

  final String image;
  final String? age;
  final String name;
  final String date;
  final String location;

  @override
  Widget build(BuildContext context) {
    const Color customBlack = Color.fromRGBO(58, 58, 58, 1);
    const Color customGrey = Color.fromRGBO(115, 115, 115, 1);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ]),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                    height: 93,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: customBlack,
                        ),
                      ),
                      if (age != null) ...[
                        Text(
                          ' (${age!})살',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 13.65,
                        color: customBlack,
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: customBlack,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableCardText extends StatelessWidget {
  const ExpandableCardText({
    super.key,
    required this.customBlack,
    required this.titleText,
  });

  final Color customBlack;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.camera_alt),
        const SizedBox(width: 8),
        Text(
          titleText,
          style: TextStyle(
            color: customBlack,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class ExpandableCard extends StatelessWidget {
  final Widget header;
  final Widget expandedChild;
  final bool isExpanded;
  final Function onTap;

  const ExpandableCard({
    super.key,
    required this.header,
    required this.isExpanded,
    required this.onTap,
    required this.expandedChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: isExpanded ? 200 : null, // 확장 시 세로 길이
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              title: header,
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onTap: () => onTap(),
            ),
            if (isExpanded) expandedChild,
          ],
        ),
      ),
    );
  }
}

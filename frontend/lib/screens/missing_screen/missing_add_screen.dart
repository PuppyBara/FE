import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/my_flutter_app_icons.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/services/form_data_service.dart';
import 'package:frontend/widgets/input_form.dart';
import 'package:frontend/widgets/make_text_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/models/member_missing_dog/missing_dog_model.dart';

class MissingAddScreen extends StatefulWidget {
  const MissingAddScreen({super.key});

  @override
  State<MissingAddScreen> createState() => _MissingAddScreenState();
}

class _MissingAddScreenState extends State<MissingAddScreen> {
  final Color customGrey = const Color.fromRGBO(217, 217, 217, 1);

  final TextEditingController kindController = TextEditingController();
  final TextEditingController furColor = TextEditingController();
  final TextEditingController characteristic = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  late String selectedSex;
  late bool isNeutered;

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      print("업로드 시도");
      if (pickedFile != null) {
        print("성공");
        setState(() {
          _image = pickedFile;
        });
      }
    } catch (e) {
      print('Image picker error: $e');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: customOrange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            dialogBackgroundColor:
                Colors.white, // background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _submitMissingDogInfo() async {
    if (_image == null) {
      print('이미지를 선택해주세요.');
      return;
    }

    final dogInfo = MissingDogInfo(
      image: _image!.path,
      name: name.text,
      age: int.parse(age.text),
      breed: kindController.text,
      sex: selectedSex, // 선택된 성별로 변경
      color: furColor.text,
      isNeutering: isNeutered, // 선택된 중성화 여부로 변경
      feature: characteristic.text,
    );

    final etcInfo = EtcInfo(
      location: location.text,
      dateTime: DateTime.parse(dateController.text),
    );

    try {
      final formDataService = FormDataService();
      await formDataService.postMissingDog(dogInfo, etcInfo);
      print('실종견 정보가 성공적으로 제출되었습니다.');
    } catch (e) {
      print('실종견 정보 제출에 실패했습니다: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "실종공고 등록",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Divider(
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 14,
                  ),
                  Text(
                    "비문분석을 위해 꼭 정면사진을 등록해주세요.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7, // 컨테이너의 너비 설정
                  height: 150, // 컨테이너의 높이 설정
                  decoration: BoxDecoration(
                    color: customGrey, // 회색 배경 색상
                    borderRadius: BorderRadius.circular(12), // 모서리 둥글게 처리
                  ),
                  child: _image == null
                      ? IconButton(
                          icon:
                              const Icon(Icons.add_circle_sharp), // '+' 아이콘 추가
                          iconSize: 96, // 아이콘 크기 설정
                          color: Colors.white, // 아이콘 색상 설정
                          onPressed: () {
                            _pickImage();
                          },
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(12), // 이미지의 모서리 둥글게 처리
                          child: Image.file(
                            File(_image!.path), // 이미지 파일
                            fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록 설정
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    MyFlutterApp.logo,
                    size: 19,
                    color: customOrange,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "동물정보",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "이름",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 48,
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 1.0), // 일반 상태의 테두리
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 2.0), // 포커스 상태의 테두리
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "나이",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 48,
                        child: TextField(
                          controller: age,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 1.0), // 일반 상태의 테두리
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 2.0), // 포커스 상태의 테두리
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "품종",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 130,
                        height: 48,
                        child: TextField(
                          controller: kindController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 1.0), // 일반 상태의 테두리
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 2.0), // 포커스 상태의 테두리
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "성별",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 63,
                              height: 49,
                              decoration: BoxDecoration(
                                  color: selectedSex == 'FEMALE'
                                      ? customOrange
                                      : customGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedSex = 'FEMALE';
                                    });
                                  },
                                  icon: const Icon(
                                    MyFlutterApp.vector,
                                    color: Colors.white,
                                    size: 34,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 63,
                              height: 49,
                              decoration: BoxDecoration(
                                  color: selectedSex == 'MALE'
                                      ? customOrange
                                      : customGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedSex = 'MALE';
                                    });
                                  },
                                  icon: const Icon(
                                    MyFlutterApp.vector__1_,
                                    color: Colors.white,
                                    size: 34,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "털색",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 130,
                        height: 48,
                        child: TextField(
                          controller: furColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 1.0), // 일반 상태의 테두리
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 2.0), // 포커스 상태의 테두리
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "중성화 여부",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 63,
                              height: 49,
                              decoration: BoxDecoration(
                                  color: isNeutered == true
                                      ? customOrange
                                      : customGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isNeutered = true;
                                  });
                                },
                                icon: const Icon(Icons.circle_outlined),
                                color: Colors.white,
                                iconSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 63,
                              height: 49,
                              decoration: BoxDecoration(
                                color: isNeutered == false
                                    ? customOrange
                                    : customGrey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isNeutered = false;
                                  });
                                },
                                icon: const Icon(Icons.close),
                                color: Colors.white,
                                iconSize: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "특징",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 48,
                        child: TextField(
                          controller: characteristic,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 1.0), // 일반 상태의 테두리
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 2.0), // 포커스 상태의 테두리
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Icon(
                    MyFlutterApp.logo,
                    size: 19,
                    color: customOrange,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "실종정보",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "실종 장소",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 48,
                        child: TextField(
                          controller: location,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 1.0), // 일반 상태의 테두리
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: customGrey, width: 2.0), // 포커스 상태의 테두리
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "실종 날짜",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 48,
                          child: AbsorbPointer(
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.calendar_month_outlined),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: customGrey,
                                      width: 1.0), // 일반 상태의 테두리
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: customGrey,
                                      width: 2.0), // 포커스 상태의 테두리
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              MakeTextButton(
                text: "저장하기",
                color: customOrange,
                buttonWidth: MediaQuery.of(context).size.width * 0.7,
                buttonHeight: 39,
                onPressed: () {
                  _submitMissingDogInfo();
                },
                radius: 5,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

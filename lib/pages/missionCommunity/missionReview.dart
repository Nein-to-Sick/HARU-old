import 'dart:io';
import 'package:cap_stone_project/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MissionReview extends StatefulWidget {
  const MissionReview({Key? key, required this.mission}) : super(key: key);

  final List<String> mission;

  @override
  State<MissionReview> createState() => _MissionReviewState();
}

class _MissionReviewState extends State<MissionReview> {
  bool isHearted = false;
  TextEditingController review = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    review.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    review.removeListener(_updateState);
    review.dispose();
    super.dispose();
  }

  Future _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(foregroundColor: const Color(0xff868686)),
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios),
              Text(
                "돌아가기",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.HARUPrimary[50]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17.0, horizontal: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "미션 : ",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.HARUGreyscale[900]),
                        ),
                        Text(
                          widget.mission[1],
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.HARUGreyscale[900],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.HARUPrimary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 2),
                            child: Text(
                              widget.mission[0],
                              style: TextStyle(
                                color: AppColors.HARUGreyscale[0],
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            spacing: 8,
                            children: List.generate(widget.mission.length - 2,
                                (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.HARUSecondary,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10.0, 2, 10, 2),
                                  child: Text(
                                    widget.mission[index + 2],
                                    style: TextStyle(
                                      color: AppColors.HARUGreyscale[0],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "23",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHearted = !isHearted;
                                  });
                                },
                                child: !isHearted
                                    ? const Icon(
                                        Icons.favorite_border_outlined,
                                        color: AppColors.HARUPrimary,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: AppColors.HARUPrimary,
                                      )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.HARUSecondary[50]),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, left: 28.0, right: 28.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: TextField(
                        controller: review,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: "후기 남기기",
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.HARUGreyscale[300]),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  if (_image != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: _getImage,
                          icon: const Icon(
                            Icons.image,
                            color: Color(0xffCCCCCC),
                            size: 30,
                          ),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: review.text.isNotEmpty ? reviewStore : null,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xff64B5F6)),
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  "저장",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void reviewStore() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("저장되었습니다!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),
                              Text("같은 미션을 성공한 파트너들의", style: TextStyle(fontSize: 18, color: AppColors.HARUGreyscale[400]),),
                              Text("후기도 확인할 수 있어요~", style: TextStyle(fontSize: 18, color: AppColors.HARUGreyscale[400]),),
                              const SizedBox(height: 10,),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {

                              },
                              style:
                              ElevatedButton.styleFrom(backgroundColor: AppColors.HARUPrimary),
                              child: const Text(
                                "후기 보러 가기",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              style:
                              ElevatedButton.styleFrom(backgroundColor: Color(0xff64B5F6)),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Text(
                                  "완료",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )));
        });
  }
}

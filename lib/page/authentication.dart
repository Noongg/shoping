import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app1/controller/controller.dart';
import 'package:test_flutter_app1/page/home_screen_one.dart';

class Authentication extends GetView<Controller> {
  Authentication({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: Color.fromARGB(255, 255, 164, 81),
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                            'assets/images/basket1.png',
                            fit: BoxFit.contain,
                          ),
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: MediaQuery.of(context).size.height * 0.37),
                      Image.asset('assets/images/Ellipse 1.png')
                    ],
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.16,
                    right: MediaQuery.of(context).size.width * 0.11,
                    child: Image.asset('assets/images/fruit1.png')),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  const Text(
                    "What is your firstname?",
                    style: TextStyle(
                        fontFamily: 'Brandon_bld',
                        fontSize: 22,
                        color: Color(0xff27214D)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Tony',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Color(0xffF3F1F1)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      fillColor: const Color(0xffF3F1F1),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 65)),
                  GetBuilder<Controller>(
                      init: Controller(),
                      builder: (data) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 56,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 255, 164, 81),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  if (textEditingController.text.isEmpty) {
                                    Get.snackbar(
                                        'Thông báo', 'Bạn chưa điền tên');
                                  } else {
                                    data.getName(textEditingController.text);
                                    Get.offAll(HomePageOne());
                                  }
                                },
                                child: const Text('Start Ordering',
                                    style: TextStyle(
                                        fontFamily: 'Brandon_light',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))),
                          ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

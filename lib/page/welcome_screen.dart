import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'authentication.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 255, 164, 81),
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
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(top: 40)),
                const Text(
                  "Get The Freshest Fruit Salad Combo",
                  style: TextStyle(
                      fontFamily: 'Brandon_bld',
                      fontSize: 22,
                      color: Color(0xff27214D)),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Text(
                  'We deliver the best and freshest fruit salad in\n'
                  'town. Order for a combo today!!!',
                  style: TextStyle(
                      fontFamily: 'Brandon_light',
                      color: Color(0xff27214D),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 164, 81),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Get.to(Authentication());
                      },
                      child: const Text('Let\'s Continue',
                          style: TextStyle(
                              fontFamily: 'Brandon_light',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

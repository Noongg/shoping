import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Container(
            color: Color(0xffFFA451),
            padding: EdgeInsets.only(top: 30,left: 20),
            height: MediaQuery.of(context).size.height*0.18,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Center(child: Text('Delivery Status',style: TextStyle(
                    fontFamily: 'Brandon_light',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),),),
                Positioned(left: 0,top: 40,child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 32,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: InkWell(
                    child: Row(
                      children: [
                        Image.asset('assets/images/back.png'),
                        Text('Go back',style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Brandon_light',
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ),
                ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40,right: 20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFAEB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/order.png',width: 48,height: 48,)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        Text("Order Taken",
                            style: const TextStyle(
                              fontFamily: 'Brandon_bld',
                              fontSize: 16,
                              color: Color(0xff27214D),)),
                      ],
                    ),
                    Image.asset('assets/images/v.png'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: Image.asset('assets/images/Line10.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xffF1EFF6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/order1.png',width: 48,height: 48,)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        Text("Order Taken",
                            style: const TextStyle(
                              fontFamily: 'Brandon_bld',
                              fontSize: 16,
                              color: Color(0xff27214D),)),
                      ],
                    ),
                    Image.asset('assets/images/v.png'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: Image.asset('assets/images/Line10.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xffFEF0F0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/ship.png',width: 48,height: 48,)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order Is Being Delivered",
                                style: const TextStyle(
                                  fontFamily: 'Brandon_bld',
                                  fontSize: 16,
                                  color: Color(0xff27214D),)),
                            Text("Your delivery agent is coming",
                                style: const TextStyle(
                                  fontFamily: 'Brandon_light',
                                  fontSize: 14,
                                  color: Color(0xff27214D),)),
                          ],
                        )
                      ],
                    ),
                    Image.asset('assets/images/phone.png'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: Image.asset('assets/images/Line13.png'),
                ),
                Image.asset('assets/images/map.png'),
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: Image.asset('assets/images/Line10.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xffF0FEF8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/v1.png',width: 48,height: 48,)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        Text("Order Received",
                            style: const TextStyle(
                              fontFamily: 'Brandon_bld',
                              fontSize: 16,
                              color: Color(0xff27214D),)),
                      ],
                    ),
                    Image.asset('assets/images/....png'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

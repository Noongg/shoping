import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:test_flutter_app1/controller/controller.dart';
import 'package:test_flutter_app1/controller/controller_basket.dart';
import 'package:test_flutter_app1/page/order_list.dart';

class AddToBasket extends StatelessWidget {
  AddToBasket({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFA451),
      body: SingleChildScrollView(
        child: GetBuilder<Controller>(
          init: Controller(),
          builder: (data) => data.isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 90,
                              backgroundImage:
                                  NetworkImage(data.listData[index].imageUrl),
                            ),
                          ),
                          Positioned(
                              left: 20,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                height: 32,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/back.png'),
                                      Text(
                                        'Go back',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Brandon_light',
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(top: 30, right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.listData[index].title,
                                    style: const TextStyle(
                                        fontFamily: 'Brandon_light',
                                        fontSize: 32,
                                        color: Color(0xff27214D),
                                        fontWeight: FontWeight.bold)),
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          child: Image.asset('assets/images/remove.png'),
                                            onTap: (){
                                            data.Decrement();
                                            },
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 20)),
                                        Text('${data.quantity}'),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 20)),
                                        InkWell(
                                          child: Image.asset('assets/images/add_2.png'),
                                          onTap: (){
                                            data.Increment();
                                          },
                                        ),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/vnd_2.png'),
                                        Padding(
                                            padding: EdgeInsets.only(right: 6)),
                                        Text('${data.listData[index].price}',
                                            style: const TextStyle(
                                                fontFamily: 'Brandon_light',
                                                fontSize: 24,
                                                color: Color(0xff27214D),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffF3F3F3), width: 1)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 30, right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('One Pack Contains:',
                                    style: TextStyle(
                                        fontFamily: 'Brandon_light',
                                        fontSize: 20,
                                        color: Color(0xff27214D),
                                        fontWeight: FontWeight.bold)),
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text(
                                  data.listData[index].ingredient,
                                  style: TextStyle(
                                      fontFamily: 'Brandon_light',
                                      fontSize: 16,
                                      color: Color(0xff27214D),
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffF3F3F3), width: 1)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: Text(data.listData[index].description,
                                style: const TextStyle(
                                    fontFamily: 'Brandon_light',
                                    fontSize: 14,
                                    color: Color(0xff27214D),
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 30, right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/tim_2.png'),
                                GetBuilder<BasketController>(
                                    init: BasketController(),
                                    builder: (basket) => SizedBox(
                                          width: MediaQuery.of(context).size.width *0.58,
                                          height: 56,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 255, 164, 81),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                              onPressed: () {
                                                basket.addItem(
                                                    int.parse(data.listData[index].id),
                                                    data.listData[index].price,
                                                    data.listData[index].title,
                                                    data.quantity,
                                                    data.listData[index].imageUrl,
                                                    data.listData[index].id,
                                                    data.listData[index].color);
                                                Get.to(OrderList());
                                                data.updateQuantity;
                                              },
                                              child: const Text('Add to basket',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'Brandon_light',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w600))),
                                        ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

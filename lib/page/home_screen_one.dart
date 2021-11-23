import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app1/controller/controller.dart';
import 'package:test_flutter_app1/controller/controller_basket.dart';
import 'package:test_flutter_app1/page/add_to_basket.dart';
import 'package:test_flutter_app1/page/order_list.dart';

class HomePageOne extends GetView<Controller> {
  const HomePageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<BasketController>(
                init: BasketController(),
                  builder: (cart)=>Stack(
                    children: [
                      Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.07,
                        right: 12,
                        left: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Group4.png')),
                        InkWell(
                          onTap: () {
                            Get.to(OrderList());
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/Vector.png'),
                              const Padding(padding: EdgeInsets.only(bottom: 5)),
                              const Text(
                                'My basket',
                                style: TextStyle(
                                    fontFamily: 'Brandon_light',
                                    color: Color(0xff27214D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                      Positioned(
                          top: 50,
                          right: 18,
                          child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                              child: Text(
                                '${cart.cart}',
                                style: TextStyle(color: Colors.white),
                              )))
                ],
              )),
              Container(
                margin: EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<Controller>(
                          init: Controller(),
                          builder: (data) => Text('Hello ${data.first_name},',
                              style: const TextStyle(
                                fontFamily: 'Brandon_light',
                                color: Color(0xff27214D),
                                fontSize: 22,
                              )),
                        ),
                        const Text(' What fruit salad',
                            style: TextStyle(
                                fontFamily: 'Brandon_light',
                                color: Color(0xff27214D),
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Text('combo do you want today?',
                        style: TextStyle(
                            fontFamily: 'Brandon_light',
                            color: Color(0xff27214D),
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixStyle: TextStyle(fontSize: 30),
                              hintText: 'Search for fruit salad combos',
                              filled: true,
                              prefixIcon: Image.asset('assets/images/Group1.png'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: Color(0xffF3F1F1)),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              contentPadding: const EdgeInsets.all(20),
                              fillColor: const Color(0xffF3F4F9),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/Group6.png'),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 10))
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    const Text(
                      'Recommended Combo',
                      style: TextStyle(
                          fontFamily: 'Brandon_bld',
                          fontSize: 24,
                          color: Color(0xff27214D)),
                    ),
                  ],
                ),
              ),
              GetBuilder<Controller>(
                  init: Controller(),
                  builder: (data) => data.isLoading?Center(child: CircularProgressIndicator(),):Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 25, left: 20),
                                  padding:
                                  EdgeInsets.only(top: 15, right: 20, left: 20),
                                  height: 182,
                                  width: 152,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          '${data.listData[data.listRandom[0]].imageUrl}',
                                        ),
                                        radius: 45,
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Text(
                                        '${data.listData[data.listRandom[0]].title}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Brandon_light',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),maxLines: 1,
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/images/vnd.png'),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(left: 5)),
                                              Text(
                                                '${data.listData[data.listRandom[0]].price}',
                                                style: TextStyle(
                                                    fontFamily: 'Brandon_light',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffF08626)),
                                              ),
                                            ],
                                          ),
                                          Image.asset('assets/images/add.png')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 35,
                                    left: 140,
                                    child: Image.asset('assets/images/tim.png'))
                              ],
                            ),
                            onTap: (){
                              Get.to(AddToBasket(index: data.listRandom[0],));
                            },
                          ),
                          InkWell(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 25, right: 20),
                                  padding:
                                  EdgeInsets.only(top: 15, right: 20, left: 20),
                                  height: 182,
                                  width: 152,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          '${data.listData[data.listRandom[1]].imageUrl}',
                                        ),
                                        radius: 45,
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Text(
                                        '${data.listData[data.listRandom[1]].title}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Brandon_light',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),maxLines: 1,
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 5)),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/images/vnd.png'),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(left: 5)),
                                              Text(
                                                '${data.listData[data.listRandom[1]].price}',
                                                style: TextStyle(
                                                    fontFamily: 'Brandon_light',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffF08626)),
                                              ),
                                            ],
                                          ),
                                          Image.asset('assets/images/add.png')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 35,
                                    left: 120,
                                    child: Image.asset('assets/images/tim.png'))
                              ],
                            ),
                            onTap: (){
                              Get.to(AddToBasket(index: data.listRandom[1],));
                            },
                          ),

                        ],
                      )),
              Padding(padding: EdgeInsets.only(top: 50)),
              const TabBar(
                isScrollable: true,
                indicatorColor: Color(0xffFFA451),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Color(0xff938DB5),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16
                ),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xffFFA451), width: 2.0),
                  insets: EdgeInsets.fromLTRB(18.0, 40.0, 40.0, 0.0),
                ),

                labelStyle: TextStyle(
                    fontSize: 22,fontWeight: FontWeight.bold
                ),
                labelColor: Color(0xff27214D),
                tabs: [
                  Tab(
                    text:'Hottest',
                  ),
                  Tab(
                    text:'Popular',
                  ),
                  Tab(
                    text:'New combo',
                  ),
                  Tab(
                    text:'Top',
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: const TabBarView(
                  children: [
                    TabBarViewItem(),
                    TabBarViewItem(),
                    TabBarViewItem(),
                    TabBarViewItem(),
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
class TabBarViewItem extends StatelessWidget {
  const TabBarViewItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<Controller>(
          init: Controller(),
          builder: (data)=>data.isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (data.listData).length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Get.to(()=>AddToBasket(index: index,));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only( left: 15),
                        padding:
                        EdgeInsets.only(top: 10, right: 20, left: 20),
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Color(int.parse(data.listData[index].color))),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                '${data.listData[index].imageUrl}',
                              ),
                              radius: 35,
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              '${data.listData[index].title}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Brandon_light',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),maxLines: 1,
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/vnd.png'),
                                    Padding(
                                        padding:
                                        EdgeInsets.only(left: 5)),
                                    Text(
                                      '${data.listData[index].price}',
                                      style: TextStyle(
                                          fontFamily: 'Brandon_light',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffF08626)),
                                    ),
                                  ],
                                ),
                                Image.asset('assets/images/add.png')
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 8,
                          left: 130,
                          child: Image.asset('assets/images/tim.png'))
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}


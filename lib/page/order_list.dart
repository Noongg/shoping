import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app1/controller/controller_basket.dart';
class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFA451),
      body: GetBuilder<BasketController>(
        init: BasketController(),
        builder: (basket)=>Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30,left: 20),
              height: MediaQuery.of(context).size.height*0.18,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Center(child: Text('My Basket',style: TextStyle(
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
              height: MediaQuery.of(context).size.height*0.72,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  padding: EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  itemCount: basket.itemCount,
                  itemBuilder: (context,index)=>Container(
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 10),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(basket.items.values.toList()[index].color)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(basket.items.values.toList()[index].imageUrl),
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 10)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${basket.items.values.toList()[index].title}",
                                      style: const TextStyle(
                                        fontFamily: 'Brandon_bld',
                                        fontSize: 16,
                                        color: Color(0xff27214D),)),
                                  Text("${basket.items.values.toList()[index].quantity}pack",
                                      style: const TextStyle(
                                        fontFamily: 'Brandon_light',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xff27214D),)),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/vnd_3.png'),
                              Text("${basket.items.values.toList()[index].price}"),
                            ],
                          )
                        ],
                      ),
                      onLongPress: (){
                        Get.snackbar('title', 'hahahah');
                      },
                    ),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total',style: TextStyle(
                        fontFamily: 'Brandon_bld',
                        fontSize: 18,
                        color: Color(0xff27214D),
                      )),
                      Row(
                        children: [
                          Image.asset('assets/images/vnd_2.png'),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text('${basket.totalItem}',style: TextStyle(
                            fontFamily: 'Brandon_bld',
                            fontSize: 24,
                            color: Color(0xff27214D),
                          )),
                        ],
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width*0.53,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 164, 81),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {

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
      ),
    );
  }
}

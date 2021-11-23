import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app1/controller/controller_basket.dart';
import 'package:test_flutter_app1/page/add_to_basket.dart';
import 'package:test_flutter_app1/page/order_complete.dart';
class OrderList extends StatelessWidget {
  OrderList({Key? key}) : super(key: key);

  TextEditingController _controller1=TextEditingController();
  TextEditingController _controller2=TextEditingController();
  TextEditingController _controller3=TextEditingController();
  TextEditingController _controller4=TextEditingController();
  TextEditingController _controller5=TextEditingController();
  TextEditingController _controller6=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: GetBuilder<BasketController>(
          init: BasketController(),
          builder: (basket)=>Column(
            children: [
              Container(
                color: Color(0xffFFA451),
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
                    itemBuilder: (context,index)=>Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              Get.to(AddToBasket(index: basket.items.values.toList()[index].index));

                            },
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            icon: Icons.info,
                            label: 'Info',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              basket.removeitem(int.parse(basket.items.values.toList()[index].id));
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 10),
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
                            if(basket.itemCount==0){
                              Get.snackbar("Thông báo", "Bạn chưa thêm sản phẩm");
                            }else{
                              Get.bottomSheet(
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: MediaQuery.of(context).viewInsets.bottom),
                                        height: MediaQuery.of(context).size.height*0.48,
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('Delivery address', style: TextStyle(
                                                fontFamily:
                                                'Brandon_light',
                                                color: Color(0xff27214D),
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.w600)),
                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                            TextField(
                                              controller: _controller1,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                hintText: '10th avenue, Lekki, Lagos State',
                                                labelStyle: TextStyle(
                                                  fontFamily:
                                                  'Brandon_light',
                                                  color: Color(0xff27214D),
                                                  fontSize: 20,),
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
                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                            const Text('Number we can call', style: TextStyle(
                                                fontFamily:
                                                'Brandon_light',
                                                color: Color(0xff27214D),
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.w600)),
                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                            TextField(
                                              controller: _controller2,
                                              keyboardType: TextInputType.number,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                hintText: '09090605708',
                                                labelStyle: TextStyle(
                                                  fontFamily:
                                                  'Brandon_light',
                                                  color: Color(0xff27214D),
                                                  fontSize: 20,),
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
                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      minimumSize: Size(135, 56),
                                                      side: BorderSide(width: 1,color: Color(0xffFFA451))
                                                  ),
                                                  onPressed: (){
                                                    if(_controller1.text.isEmpty || _controller2.text.isEmpty){
                                                      Get.defaultDialog(
                                                          title: 'Thông báo',
                                                          content: Column(
                                                            children: [
                                                              Text('Bạn chưa điền thông tin')
                                                            ],
                                                          )
                                                      );
                                                    }else{
                                                      _controller1.clear();
                                                      _controller2.clear();
                                                      basket.clear();
                                                      Get.back();
                                                      Get.to(OrderComplete());
                                                    }
                                                  },
                                                  child: const Text('Pay on delivery', style: TextStyle(
                                                    fontFamily:
                                                    'Brandon_bld',
                                                    color: Color(0xffFFA451),
                                                    fontSize: 16,
                                                  )),),
                                                OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      minimumSize: Size(115, 56),
                                                      side: BorderSide(width: 1,color: Color(0xffFFA451))
                                                  ),
                                                  onPressed: (){
                                                    if(_controller1.text.isEmpty || _controller2.text.isEmpty){
                                                      Get.defaultDialog(
                                                          title: 'Thông báo',
                                                          content: Column(
                                                            children: [
                                                              Text('Bạn chưa điền thông tin')
                                                            ],
                                                          )
                                                      );
                                                    }else{
                                                      Get.bottomSheet(
                                                        SingleChildScrollView(
                                                          child: Stack(
                                                            alignment: AlignmentDirectional.center,
                                                            clipBehavior: Clip.none,
                                                            children: [
                                                              Container(
                                                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                                  height: MediaQuery.of(context).size.height*0.65,
                                                                  child:Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        padding: EdgeInsets.only(top: 40,left: 20,right: 20),
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text('Card Holders Name', style: TextStyle(
                                                                                fontFamily:
                                                                                'Brandon_light',
                                                                                color: Color(0xff27214D),
                                                                                fontSize: 20,
                                                                                fontWeight:
                                                                                FontWeight.w600)),
                                                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                                                            TextField(
                                                                              controller: _controller3,
                                                                              maxLines: 1,
                                                                              decoration: InputDecoration(
                                                                                hintText: 'Adolphus Chris',
                                                                                labelStyle: TextStyle(
                                                                                  fontFamily:
                                                                                  'Brandon_light',
                                                                                  color: Color(0xff27214D),
                                                                                  fontSize: 20,),
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
                                                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                                                            const Text('Card Number', style: TextStyle(
                                                                                fontFamily:
                                                                                'Brandon_light',
                                                                                color: Color(0xff27214D),
                                                                                fontSize: 20,
                                                                                fontWeight:
                                                                                FontWeight.w600)),
                                                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                                                            TextField(
                                                                              controller: _controller4,
                                                                              keyboardType: TextInputType.number,
                                                                              maxLines: 1,
                                                                              decoration: InputDecoration(
                                                                                hintText: '1234 5678 9012 1314',
                                                                                labelStyle: TextStyle(
                                                                                  fontFamily:
                                                                                  'Brandon_light',
                                                                                  color: Color(0xff27214D),
                                                                                  fontSize: 20,),
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
                                                                            const Padding(padding: EdgeInsets.only(top: 20)),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    const Text('Date', style: TextStyle(
                                                                                        fontFamily:
                                                                                        'Brandon_light',
                                                                                        color: Color(0xff27214D),
                                                                                        fontSize: 20,
                                                                                        fontWeight:
                                                                                        FontWeight.w600)),
                                                                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                                                                    SizedBox(
                                                                                      width: 134,
                                                                                      child: TextField(
                                                                                        controller: _controller5,
                                                                                        keyboardType: TextInputType.number,
                                                                                        maxLines: 1,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: '10/30',
                                                                                          labelStyle: TextStyle(
                                                                                            fontFamily:
                                                                                            'Brandon_light',
                                                                                            color: Color(0xff27214D),
                                                                                            fontSize: 20,),
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
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    const Text('CCV', style: TextStyle(
                                                                                        fontFamily:
                                                                                        'Brandon_light',
                                                                                        color: Color(0xff27214D),
                                                                                        fontSize: 20,
                                                                                        fontWeight:
                                                                                        FontWeight.w600)),
                                                                                    const Padding(padding: EdgeInsets.only(top: 20)),
                                                                                    SizedBox(
                                                                                      width: 134,
                                                                                      child: TextField(
                                                                                        controller: _controller6,
                                                                                        keyboardType: TextInputType.number,
                                                                                        maxLines: 1,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: '123',
                                                                                          labelStyle: TextStyle(
                                                                                            fontFamily:
                                                                                            'Brandon_light',
                                                                                            color: Color(0xff27214D),
                                                                                            fontSize: 20,),
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
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(child: Align(
                                                                        alignment: Alignment.bottomCenter,
                                                                        child: Container(
                                                                          width: MediaQuery.of(context).size.width,
                                                                          height: 96,
                                                                          child: Center(
                                                                            child: SizedBox(
                                                                              width: 138,
                                                                              height: 56,
                                                                              child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                      primary: Colors.white,
                                                                                      shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(10))),
                                                                                  onPressed: () {
                                                                                    if(_controller3.text.isEmpty ||_controller4.text.isEmpty ||
                                                                                        _controller5.text.isEmpty ||_controller6.text.isEmpty){
                                                                                      Get.defaultDialog(
                                                                                          title: 'Thông báo',
                                                                                          content: Column(
                                                                                            children: [
                                                                                              Text('Bạn chưa điền thông tin')
                                                                                            ],
                                                                                          )
                                                                                      );

                                                                                    }else{
                                                                                      _controller1.clear();
                                                                                      _controller2.clear();
                                                                                      _controller3.clear();
                                                                                      _controller4.clear();
                                                                                      _controller5.clear();
                                                                                      _controller6.clear();
                                                                                      basket.clear();
                                                                                      Get.back();
                                                                                      Get.back();
                                                                                      Get.to(OrderComplete());
                                                                                    }
                                                                                  },
                                                                                  child: const Text('Complete Order',
                                                                                      style: TextStyle(
                                                                                          fontFamily: 'Brandon_light',
                                                                                          color: Color(0xffFFA451),
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w600))),
                                                                            ),
                                                                          ),
                                                                          decoration: BoxDecoration(
                                                                              color: Color(0xffFFA451),
                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                                                                          ),
                                                                        ),
                                                                      ))
                                                                    ],
                                                                  )
                                                              ),
                                                              Positioned(
                                                                child: Image.asset('assets/images/Cancel.png'),
                                                                top: -60,
                                                              ),
                                                            ],

                                                          ),
                                                        ),
                                                        isScrollControlled: true,
                                                        backgroundColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: const Text('Pay with card', style: TextStyle(
                                                    fontFamily:
                                                    'Brandon_bld',
                                                    color: Color(0xffFFA451),
                                                    fontSize: 16,
                                                  )),)

                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                    Positioned(
                                      child: Image.asset('assets/images/Cancel.png'),
                                      top: -60,
                                    ),
                                  ],

                                ),
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
                                ),
                              );
                            }
                          },
                          child: const Text('Checkout',
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
      ),
    );
  }
}

import 'dart:math';

import 'package:get/get.dart';
import 'package:test_flutter_app1/models/product.dart';
import 'package:test_flutter_app1/request/request_api.dart';


class Controller extends GetxController{
  List<Product> listData=<Product>[];
  String first_name='Tony';
  List<int> listRandom=[];
  bool isLoading = false;
  int quantity=1;
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      getData();
  }
  @override
  void getData() async{
    isLoading = true;
    update();
    var result= await RequestApi.getProduct();
      if(result!=null){
      listData=result;
      update();
      random();
    }else{
      print('lỗi');
    }
    isLoading = false;
    update();
  }
  void random() async{
    Random _random=Random();
    var index=await _random.nextInt(listData.length);
    listRandom.add(index);
    var index1=await _random.nextInt(listData.length);
    listRandom.add(index1);
  }
  void getName(String name){
    first_name=name;
    update();
  }

  void Increment(){
    quantity++;
    update();
  }
  void Decrement(){
    if(quantity==0){
      Get.back();
      update();
    }else{
      quantity--;
      update();
    }
  }
  void updateQuantity(){
    quantity=1;
    update();
  }
}
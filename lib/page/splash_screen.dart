import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app1/page/welcome_screen.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }
  _navigatortohome() async{
    await Future.delayed(Duration(milliseconds: 2000),(){
      Get.off(WelComeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash_screen.png'),
      ),
    );
  }
}
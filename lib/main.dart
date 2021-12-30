// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/constant/images.dart';
import 'package:getx_demo/common/constant/strings.dart';
import 'package:getx_demo/common/widget/common_image_assets.dart';
import 'package:getx_demo/screen/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringResources.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductOverView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    printInfo();
    return Scaffold(
      body: Center(
        child: CommonImageAsset(
          imageName: ImageResources.getX,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
      ),
    );
  }
}

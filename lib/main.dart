import 'package:flutter/material.dart';
import 'package:flutter_user_example/controller/account_controller.dart';
import 'package:flutter_user_example/page/dash_board_page.dart';
import 'package:flutter_user_example/page/home.dart';
import 'package:flutter_user_example/page/sign_in_page.dart';
import 'package:flutter_user_example/page/sign_up_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  //Getx init
  Get.put<AccountController>(AccountController());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'account example',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      defaultTransition: Transition.rightToLeft,
      routingCallback: (routing) {
        Get.log("current: ${routing!.current}");
        Get.log("is back : ${routing.isBack}");
        Get.log("previous : ${routing.previous}");
        Get.log("bottom sheet : ${routing.isBottomSheet}");
        Get.log("dialog : ${routing.isDialog}");

      },
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/sign-in', page: () => const SignInPage()),
        GetPage(name: '/sign-up', page: () => const SignUpPage()),
        GetPage(name: '/dash-board', page: () => const DashBoardPage()),
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color(0xFFF5F5F8),
          shadowColor: Color(0xFFFFFFFF),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity, //각각의 제품마다 시각적 밀도 제공??
        unselectedWidgetColor: Color.fromRGBO(113, 113, 120, 0.4),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey.shade900),
      ),

    );
  }
}


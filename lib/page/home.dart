import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _drawKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawKey,
      drawerScrimColor: const Color.fromRGBO(0, 0, 0, 0.6),
      //드래그 제스처로 Scaffold.endDrawer를 열 수 있는지 여부를 결정합니다.
      endDrawerEnableOpenDragGesture: false,
      endDrawer: MenuPage(),
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(color: Color(0xFFF5F5F8)),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 14, right: 16, top: 20, bottom: 14),
                    child: SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () async {
                                  _drawKey.currentState?.openDrawer();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                    child: Stack(
                      children: [
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Get.offAllNamed('/sign-in');
                                    },
                                    child: Text('로그인')
                                ),
                                SizedBox(width: 30,),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.offAllNamed('/sign-up');
                                    },
                                    child: Text('회원가입')
                                ),

                                ElevatedButton(
                                    onPressed: () {
                                      Get.offAllNamed('/dash-board');
                                    },
                                    child: Text('Dashboard')
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
        ),
      ),
    );
  }
}

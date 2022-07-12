import 'package:flutter/material.dart';
import 'package:flutterprojectsetup/ui/common/routes.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/png/ic_close.png',
                    width: 15,
                    height: 15,
                  )),
              const Spacer(),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Login to \nMobile Banking',
                      style:  TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ColoredBox(
                          color: Colors.white,
                          child:  SizedBox(width: 1, height: 30),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/png/hk_flag.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(109, 109, 109, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style:  TextStyle(color: Colors.white),
                      decoration:  InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 3),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(109, 109, 109, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                         Expanded(
                          child: TextField(
                            obscureText: true,
                            style:  TextStyle(color: Colors.white),
                            decoration:  InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                         Text(
                          'FORGOT?',
                          style:  TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteName.dashboard);
                          },
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(double.infinity, 56)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(0, 166, 77, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: const BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0)))),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset('assets/png/ic_finger.png')
                    ],
                  )),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'New to Mobile Banking?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child:  Text(
                  'Register Here',
                  style:  TextStyle(
                      color: Color.fromRGBO(0, 166, 77, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

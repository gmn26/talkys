import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:talkys/component/welcome_form.dart';
import 'package:get/get.dart';
import 'package:talkys/service/preferences_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PreferencesService preferencesService = Get.find<PreferencesService>();

  @override
  void initState() {
    super.initState();
    _checkUserName();
  }

  _checkUserName() async {
    String? userName = preferencesService.getUserName();
    if (userName != null && userName.isNotEmpty) {
      // Gunakan addPostFrameCallback untuk menunggu hingga frame selesai dibangun
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Get.offAllNamed(
            '/home',
          ); // Pindah ke halaman /home setelah build selesai
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/img/background.jpg', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0)),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Selamat Datang di",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        "Talkys",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Siapa nama kamu?",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        WelcomeFormComponent(),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Text("Akses Orang Tua"),
                        onTap: () {
                          Get.toNamed("/parent/home");
                        },
                      ),
                      Text(
                        "Copyright @gmn26",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

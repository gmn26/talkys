import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Talkys",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32.0),
                FractionallySizedBox(
                  widthFactor: 1 / 3,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed("/welcome");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Mulai"),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1 / 3,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed("/app-guide");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Petunjuk"),
                  ),
                ),FractionallySizedBox(
                  widthFactor: 1 / 3,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed("/speaking-training");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Latihan"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

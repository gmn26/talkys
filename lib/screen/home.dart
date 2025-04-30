import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:talkys/component/home_greeting.dart';
import 'package:talkys/component/popup_modal.dart';
import 'package:talkys/controller/feature_menu.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FeatureMenuController menuController = Get.put(FeatureMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/img/background.jpg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeGreetingComponent(),
                  GestureDetector(
                    onTap: () {
                      _showCustomDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.arrow_upward, color: Colors.white, size: 32.0),
                                SizedBox(height: 8),
                                Text(
                                  "Kamu mau apa?",
                                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PopupModalComponent();
      },
    );
  }
}
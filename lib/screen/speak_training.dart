import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkys/component/training_feat/expandable_bottom_sheet.dart';
import 'package:talkys/controller/feature_menu.dart';

class SpeakTrainingPage extends StatelessWidget {
  SpeakTrainingPage({super.key});

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
                  Text(
                    "Latihan Berbicara",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Silahkan pilih menu latihan kamu!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20.0,
                        children: [
                          TextButton(
                            onPressed: () {
                              menuController.changeMenu("kebutuhan");
                                _showBottomSheet(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Kebutuhan"),
                          ),
                          TextButton(
                            onPressed: () {
                              menuController.changeMenu("suasana_hati");
                              _showBottomSheet(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Suasana Hati"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed("/main-menu");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Kembali Ke Menu Utama"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) =>
          TrainingExpandableBottomSheetComponent(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talkys/controller/feature_menu.dart';
import 'package:get/get.dart';

class FeatMenuComponent extends StatelessWidget {
  FeatMenuComponent({super.key});

  final FeatureMenuController menuController = Get.put(FeatureMenuController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 40.0,
        children: [
          Text(
            "Apa yang ingin kamu utarakan?",
            style: TextStyle(fontSize: 28.0),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  menuController.changeMenu("suasana_hati");
                },
                child: Text("SUASANA HATI"),
              ),
              OutlinedButton(
                onPressed: () {
                  menuController.changeMenu("kebutuhan");
                },
                child: Text("KEBUTUHAN"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

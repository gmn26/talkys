import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:talkys/component/expandable_bottom_sheet.dart';
import 'package:talkys/controller/feature_menu.dart';
import 'package:get/get.dart';

class PopupModalComponent extends StatelessWidget {
  PopupModalComponent({super.key});

  final FeatureMenuController menuController = Get.put(FeatureMenuController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    menuController.changeMenu("kebutuhan");
                    _showBottomSheet(context, "kebutuhan");
                  },
                  child: Text(
                    "Kebutuhan",
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    menuController.changeMenu("suasana_hati");
                    _showBottomSheet(context, "suasana_hati");
                  },
                  child: Text(
                    "Suasana Hati",
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, selectedMenu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ExpandableBottomSheetComponent(selectedMenu: selectedMenu),
    );
  }
}

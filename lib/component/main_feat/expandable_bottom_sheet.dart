import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkys/component/main_feat/feat_menu_kebutuhan.dart';
import 'package:talkys/component/main_feat/feat_menu_suasana_hati.dart';
import 'package:talkys/controller/feature_menu.dart';

class MainExpandableBottomSheetComponent extends StatelessWidget {
  final String selectedMenu;
  final FeatureMenuController menuController = Get.put(FeatureMenuController());

  MainExpandableBottomSheetComponent({super.key, required this.selectedMenu});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: screenHeight * 0.75,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Obx(() {
        final selectedMenu = menuController.activeMenu.value;

        if (selectedMenu == "kebutuhan") {
          return FeatMenuKebutuhanComponent();
        } else {
          return FeatMenuSuasanaHatiComponent();
        }
      }),
    );
  }
}

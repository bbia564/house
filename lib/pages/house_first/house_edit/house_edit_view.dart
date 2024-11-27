import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'house_edit_logic.dart';

class HouseEditView extends GetView<PageLogic> {
  const HouseEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.schroeder.value
              ? const CircularProgressIndicator(color: Colors.deepPurpleAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.arnfvmx();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}

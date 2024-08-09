import 'dart:math';
import 'package:firebase_job_portal_poc/controllers/custom_appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomAppBarController customAppBarController =
        Get.put(CustomAppBarController());

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.98),
      leading: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Image.asset(
                  'assets/images/menu.png',
                  width: 30,
                  height: 30,
                ),
              ),
              onPressed: () {},
            ),
          );
        },
      ),
      title: Obx(
        () => customAppBarController.isSearching.value
            ? TextField(
                controller: customAppBarController.searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search for a company',
                  border: InputBorder.none,
                ),
                onChanged: customAppBarController.onSearchQueryChanged,
              )
            : const Text(''),
      ),
      actions: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: customAppBarController.isSearching.value
                  ? Image.asset('assets/images/cancel.png', width: 22)
                  : Image.asset('assets/images/search.png', width: 18),
              onPressed: customAppBarController.toggleSearch,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

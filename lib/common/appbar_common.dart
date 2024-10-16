import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';

class AppbarCommon extends StatelessWidget {
  const AppbarCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          context.go('/home_page'); 
        },
        icon: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsResources.greyAppBar,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 20, // Set the icon size here
          ),
        ),
        iconSize: 20, // Ensures the IconButton size matches the icon size
        padding: EdgeInsets.zero, // Remove default padding from IconButton
        constraints: BoxConstraints(), // Remove the default constraints
      ),
    );
  }
}

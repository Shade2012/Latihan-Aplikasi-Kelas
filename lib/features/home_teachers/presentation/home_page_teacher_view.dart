import 'package:flutter/material.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';

import '../../../core/themes/images.dart';
import '../../../core/themes/textstyle.dart';
class HomePageTeacherView extends StatelessWidget {
  const HomePageTeacherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            ColorsResources.primaryButton,
            Colors.white
          ],
            stops: [0.30,0.90]
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(Images.imageExample,fit: BoxFit.cover,height: 80,),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Good Morning 👋", style: txtRegularBlack),
                            SizedBox(height: screenHeight * 0.003,),
                            Text("Abid Fadullah Maajid", style: txtRegularBlack),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.notifications_outlined)
                  ],
                ),
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

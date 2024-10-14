import 'package:flutter/material.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/shimmer_common.dart';
class HomePageTeacherShimmer extends StatelessWidget {
  const HomePageTeacherShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShimmerCommon(height: 60,radius: 100,width: 60,),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShimmerCommon(width: 120,radius: 5,),
                      SizedBox(height: 10,),
                      ShimmerCommon(width: 120,radius: 5,)
                    ],
                  ),
                ],
              ),
              Icon(Icons.notifications_outlined)
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.11,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ShimmerCommon(width:60,radius: 80,);
              },itemCount: 6,separatorBuilder: (context, index) {
              return SizedBox(width: 10,);
            },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:  ShimmerCommon(width: 120,radius: 5,),
          ),
      ]
    ));
  }
}


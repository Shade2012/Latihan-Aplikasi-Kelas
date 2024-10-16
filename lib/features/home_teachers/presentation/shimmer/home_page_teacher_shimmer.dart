import 'package:flutter/material.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/shimmer_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/shimmer/dropdown_shimmer.dart';
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

          SizedBox(height: 10,),
          DropdownShimmer(),
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


import 'package:flutter/material.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/shimmer_common.dart';
class DropdownShimmer extends StatelessWidget {
  const DropdownShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return const SizedBox(
      child: ShimmerCommon(width: double.infinity,radius: 10,height: 50,),
       );
  }
}


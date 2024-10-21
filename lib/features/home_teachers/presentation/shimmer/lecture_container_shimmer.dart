import 'package:flutter/material.dart';

import '../../../../common/shimmer_common.dart';
class LectureContainerShimmer extends StatelessWidget {
  const LectureContainerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  ListView.separated(
      shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        primary: false,
        itemBuilder: (context, index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ShimmerCommon(width: 70,radius: 5,height: 20,),
        SizedBox(width: 10,),
        Expanded(child: ShimmerCommon(width: double.infinity,radius: 5,height: 100,))
      ],);
    }, separatorBuilder: (context, index) {
      return SizedBox(height: 10,);
    }, itemCount: 5);
  }
}

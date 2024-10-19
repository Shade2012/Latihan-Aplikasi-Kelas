import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCommon extends StatelessWidget {
  final double? height, width, radius;
  const ShimmerCommon({super.key, this.height, this.width, this.radius = 1});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final int? length;
  const ShimmerLoading({super.key, this.length});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[300]!,
      child: GridView.builder(
        itemCount: length ?? 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
        ),
        padding: const EdgeInsets.only(bottom: 10),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(width: 0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.only(
              top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
          margin: EdgeInsets.only(right: 15.w),
          width: 149.w,
        ),
      ),
    );
  }
}

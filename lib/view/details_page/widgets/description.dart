import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';


class Description extends StatelessWidget {
  final String description;

  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description',
            style: context.textTheme.titleMedium!.copyWith(
              color: Colors.grey,
            )),
        SizedBox(
          height: 10.h,
        ),
        ReadMoreText(
          description,
          style: context.textTheme.titleSmall,
          trimLines: 2,
          trimMode: TrimMode.Line,
          moreStyle: context.textTheme.titleSmall!.copyWith(
            fontSize: context.isDesktop ? 18.sp : 12.0.sp,
            color: Colors.orange,
          ),
          lessStyle: context.textTheme.titleSmall!.copyWith(
            fontSize: context.isDesktop ? 18.sp : 12.0.sp,
            color: Colors.orange,
          ),
        )
      ],
    );
  }
}

import 'package:assesment_app/config/end_points/end_points.dart';
import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:assesment_app/config/services/dio_helper.dart';
import 'package:assesment_app/view/details_page/widgets/imagesPageView.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Model/models/product_model.dart';
import '../../core/animations/fadeDownUp.dart';
import '../../core/animations/horiontalFadeTransition.dart';
import '../../core/style/app_colors.dart';
import '../../core/utils/default_cached_image.dart';
import 'widgets/description.dart';

class DetailsScreen extends StatefulWidget {
  final String id, description;
  const DetailsScreen({
    super.key,
    required this.id,
    required this.description,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final PageController pageController;
  late final ProductDetailsModel model;

  late bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    loading = true;
    DioHelper.getData(method: '${ApiEndPoints.productEndPoint}/${widget.id}')
        .then((value) {
      model = ProductDetailsModel.fromJson(value.data['data']);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  Stack(children: [
                    ImagesPageView(
                      height: 300.h,
                      itemCount: model.variations[0].images!.length,
                      controller: pageController,
                      itemBuilder: (context, index) => Hero(
                        tag: model.id,
                        child: DefaultCachedImage(
                          height: 509.h,
                          width: double.infinity,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          ),
                          imgUrl: model.variations[0].images![index].imagePath,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 45.h,
                      left: 28.w,
                      right: 28.w,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: HorizontalFadeTransition(
                              delayed: true,
                              child: Container(
                                width: 37.w,
                                height: 37.h,
                                padding: EdgeInsets.symmetric(vertical: 7.8.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.defaultColor,
                                ),
                                child: const FittedBox(
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          HorizontalFadeTransition(
                            fromRight: true,
                            delayed: true,
                            child: Container(
                              width: 37.w,
                              height: 37.h,
                              padding: EdgeInsets.symmetric(vertical: 7.8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.defaultColor,
                              ),
                              child: const FittedBox(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18.0.w, vertical: 20.h),
                    child: FadeDownUp(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    maxLines: 2,
                                    model.name,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 19,
                                  child: CircleAvatar(
                                    radius: 18.r,
                                    backgroundImage: CachedNetworkImageProvider(
                                        model.brandImage),
                                  ),
                                ),
                              ],
                            ),
                            Description(
                              description: widget.description,
                            ),
                            SizedBox(
                              height: 68.h,
                            ),
                            model.variations[0].properties != null &&
                                    model.variations[0].properties!.isNotEmpty
                                ? model.variations[0].properties![0].property
                                            .toLowerCase()
                                            .trim() ==
                                        'size'
                                    ? Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'sizes',
                                              style:
                                                  context.textTheme.titleMedium,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.all(15.h),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Text(
                                                model.variations[0]
                                                    .properties![0].value,
                                                style: context
                                                    .textTheme.titleSmall,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : model.variations[0].properties != null &&
                                            model.variations[0].properties!
                                                .isNotEmpty
                                        ? model.variations[0].properties![0]
                                                    .property
                                                    .toLowerCase()
                                                    .trim() ==
                                                'color'
                                            ? Column(
                                                children: [
                                                  Text(
                                                    'Colors',
                                                    style: context
                                                        .textTheme.titleMedium,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(15.h),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: HexColor(
                                                        model
                                                            .variations[0]
                                                            .properties![0]
                                                            .value,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox()
                                        : const SizedBox()
                                : const SizedBox()
                          ]),
                    ),
                  ),
                ]),
              ),
      ),
    );
  }
}

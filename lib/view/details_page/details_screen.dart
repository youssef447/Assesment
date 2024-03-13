import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:assesment_app/view/details_page/widgets/properties.dart';
import 'package:assesment_app/view_model/prdouct_cubit.dart';
import 'package:assesment_app/view_model/product_states.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/animations/fadeDownUp.dart';
import '../../core/animations/horiontalFadeTransition.dart';
import '../../core/style/app_colors.dart';
import '../../core/utils/default_cached_image.dart';
import 'widgets/description.dart';
import 'widgets/images_page_view.dart';

class DetailsScreen extends StatefulWidget {
  final String id, description;
  final ProductCubit cubit;
  const DetailsScreen({
    super.key,
    required this.id,
    required this.description,
    required this.cubit,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final PageController pageController;

  late bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();

    widget.cubit.getProductDetails(
      productId: widget.id,
    );
    widget.cubit.currentVariant = 0;
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
    return BlocConsumer<ProductCubit, ProductStates>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state is ProductDetailsErrorState
                ? Center(
                    child: Text(
                      'error getting product details: ${state.errMessage}',
                      style: context.textTheme.titleMedium,
                    ),
                  )
                : state is ProductDetailsLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ImagesPageView(
                                  height: 300.h,
                                  itemCount: widget
                                      .cubit
                                      .detailsModel
                                      .variations[widget.cubit.currentVariant]
                                      .images!
                                      .length,
                                  controller: pageController,
                                  itemBuilder: (context, index) => Hero(
                                    tag: widget.cubit.detailsModel.id,
                                    child: DefaultCachedImage(
                                      height: 509.h,
                                      width: double.infinity,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.r),
                                        topRight: Radius.circular(25.r),
                                      ),
                                      imgUrl: widget
                                          .cubit
                                          .detailsModel
                                          .variations[
                                              widget.cubit.currentVariant]
                                          .images![index]
                                          .imagePath,
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.8.h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.8.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
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
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.0.w, vertical: 10.h),
                              child: FadeDownUp(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(
                                            maxLines: 2,
                                            widget.cubit.detailsModel.name,
                                            style:
                                                context.textTheme.titleMedium,
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 19,
                                          child: CircleAvatar(
                                            radius: 18.r,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                              widget.cubit.detailsModel
                                                  .brandImage,
                                            ),
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
                                    Text(
                                      'Quantity : ${widget.cubit.detailsModel.variations[widget.cubit.currentVariant].quantity}',
                                      style: context.textTheme.titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    ...widget.cubit.detailsModel.properties
                                            .isNotEmpty
                                        ? widget.cubit.detailsModel.properties
                                            .map(
                                              (e) => Properties(
                                                properties: e,
                                                cubit: widget.cubit,
                                              ),
                                            )
                                            .toList()
                                        : [const SizedBox()],
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Price',
                                          style: context.textTheme.titleMedium,
                                        ),
                                        Text(
                                          '${widget.cubit.detailsModel.variations[widget.cubit.currentVariant].price} EGP'
                                              .toString(),
                                          style: context.textTheme.titleMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        );
      },
      listener: (BuildContext context, ProductStates state) {},
    );
  }
}

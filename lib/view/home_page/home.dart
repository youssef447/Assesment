import 'dart:ui';

import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:assesment_app/core/style/app_colors.dart';
import 'package:assesment_app/core/utils/shimmer_list_view.dart';
import 'package:assesment_app/view_model/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/models/product_model.dart';
import '../../config/routes/routes.dart';
import '../../core/utils/default_cached_image.dart';
import '../../view_model/prdouct_cubit.dart';
import 'widgets/gradiant_container.dart';
part 'product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => ProductCubit()..getProducts(),
        child: BlocConsumer<ProductCubit, ProductStates>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Slash',
                    style: context.textTheme.titleLarge!
                        .copyWith(letterSpacing: 2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: state is ProductSuccessState
                        ? state.model.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15.h,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 10.w,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: state.model.length,
                                itemBuilder: (context, index) {
                                  return ProductCard(model: state.model[index]);
                                },
                              )
                            : Center(
                                child: Text(
                                  'No Data',
                                  style: context.textTheme.titleLarge,
                                ),
                              )
                        : state is ProductErrorState
                            ? Center(
                                child: Text(
                                  'error ${state.errMessage}',
                                  style: context.textTheme.titleMedium,
                                ),
                              )
                            : const ShimmerLoading(),
                  )
                ],
              ),
            );
          },
          listener: (BuildContext context, ProductStates state) {},
        ),
      )),
    );
  }
}

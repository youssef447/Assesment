import 'package:assesment_app/Model/models/product_details_model.dart';
import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:assesment_app/view_model/prdouct_cubit.dart';
import 'package:assesment_app/view_model/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class Properties extends StatelessWidget {
  final ProductProperties properties;
  final ProductCubit cubit;
  const Properties({super.key, required this.properties, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              properties.property,
              style: context.textTheme.titleMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 50.h,
              child: properties.value.every((element) {
                return element['value'] == properties.value[0]['value'];
              })
                  ? properties.property.toLowerCase() == 'color'
                      ? Container(
                          padding: EdgeInsets.all(
                            15.h,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.5.w,
                              color: Colors.red,
                            ),
                            color: HexColor(
                              properties.value[0]['value'],
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(
                            15.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2.3,
                              color: Colors.red,
                            ),
                          ),
                          child: Text(
                            properties.value[0]['value'],
                            style: context.textTheme.titleSmall,
                          ),
                        )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      itemCount: properties.value.length,
                      itemBuilder: (context, valueIndex) {
                        return GestureDetector(
                          onTap: () {
                            cubit.changeVariantIndex(
                              valueIndex,
                            );
                          },
                          child: properties.property.toLowerCase() == 'color'
                              ? Container(
                                  padding: EdgeInsets.all(
                                    15.h,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: cubit.currentVariantId ==  properties.value[valueIndex]['id']
                                          ? 2.5.w
                                          : 1.5.w,
                                      color: cubit.currentVariantId ==  properties.value[valueIndex]['id']
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    color: HexColor(
                                      properties.value[valueIndex]['value'],
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.all(
                                    15.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: cubit.currentVariant == valueIndex
                                          ? 2.3
                                          : 1.3.w,
                                      color: cubit.currentVariant == valueIndex
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                  child: Text(
                                    properties.value[valueIndex]['value'],
                                    style: context.textTheme.titleSmall,
                                  ),
                                ),
                        );
                      },
                    ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

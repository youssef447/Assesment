part of 'home.dart';

class ProductCard extends StatelessWidget {
  final ProductModel model;
  const ProductCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goTo(
            route: AppRoutes.detailsScreen,
            args: [model.id.toString(), model.brand.brandDescription]);
      },
      child: GradiantContainer(
        padding:
            EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
        margin: EdgeInsets.only(right: 15.w),
        width: 149.w,
        radius: 23.r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Hero(
                  tag: model.id,
                  child: DefaultCachedImage(
                    borderRadius: BorderRadius.circular(15.r),
                    imgUrl: model.variations[0].images![0].imagePath,
                    width: double.infinity,
                    height: 150.h,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      width: 50.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.08),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18.sp,
                          ),
                          Text(
                            model.rating != null
                                ? model.rating!.toStringAsFixed(1)
                                : 'not rated',
                            style: context.textTheme.titleSmall,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  model.name,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ),
            Expanded(
              child: Text(
                model.brand.brandName,
                style:
                    context.textTheme.titleSmall!.copyWith(color: Colors.grey),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'EGP ${model.variations[0].price.toString()}',
                    style: context.textTheme.titleSmall,
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: AppColors.defaultGreyColor,
                  ),
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.defaultGreyColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

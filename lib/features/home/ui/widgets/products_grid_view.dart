import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/routing/routes.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/home/logic/cubit/home_products_state.dart';
import 'package:hungry/features/home/ui/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductsCubit, HomeProductsState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w, // من اليمين والشمال
            vertical: 8.h, // من فوق وتحت
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h, // ✅ المسافة العمودية
            crossAxisSpacing: 20.w, // ✅ المسافة الأفقية
            mainAxisExtent: 225.h, // ✅ ارتفاع كل item
          ),
          itemCount: isLoading
              ? 6
              : state.when(
                  initial: () => 0,
                  loading: () => 6,
                  success: (data) => data.length,
                  error: (error) => 0,
                ),

          itemBuilder: (context, index) {
            return Skeletonizer(
              enabled: isLoading,
              child: GestureDetector(
                onTap: () => context.pushNamed(
                  Routes.productDetailsScreen,
                  arguments: context
                      .read<HomeProductsCubit>()
                      .filteredProducts[index]
                      ,
                ),
                child: ProductItem(
                  product: state.maybeWhen(
                    success: (data) => data[index],
                    orElse: () => null,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

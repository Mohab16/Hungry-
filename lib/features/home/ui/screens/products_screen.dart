import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/features/home/ui/widgets/filter_list_view.dart';
import 'package:hungry/features/home/ui/widgets/products_grid_view.dart';
import 'package:hungry/features/home/ui/widgets/top_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProductsCubit>().emitHomeProductsState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(children: [TopAppBar(), verticalSpacing(40)]),
          ),
    
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FilterListView(),
          ),
          verticalSpacing(20),
    
          Expanded(child: ProductsGridView()),
        ],
      ),
    );
  }
}
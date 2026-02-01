import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/di/dependency_injection.dart';
import 'package:hungry/features/cart/ui/screens/cart_screen.dart';
import 'package:hungry/features/home/logic/cubit/home_products_cubit.dart';
import 'package:hungry/core/widgets/bottom_bar.dart';
import 'package:hungry/features/home/ui/screens/products_screen.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_orders_cubit.dart';
import 'package:hungry/features/my_orders/ui/screens/my_orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProductsCubit>().emitHomeProductsState();
  }

  int currentIndex = 0;

  final screens = [
    ProductsScreen(),
    CartScreen(),
    BlocProvider(create: (context) => getIt<MyOrdersCubit>(), child: MyOrdersScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
      backgroundColor: Colors.white,
      body: screens[currentIndex],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/core/storage/local_storage.dart';
import 'package:hungry/features/home/data/repos/home_products_repo.dart';
import 'package:hungry/features/home/logic/cubit/home_products_state.dart';

class HomeProductsCubit extends Cubit<HomeProductsState> {
  final HomeProductsRepo _homeProductsRepo;
  String? token = "";
  String? userName = "";
  String? userImage = "";
  List allProducts=[];
  List filteredProducts=[];
  String selectedCategory="All";
  final Map<String, List<int>> categoryMap = {
    'All':[],
  'Burgers': [1,2,3,4,5,6,7,8,9,10],
  'Sandwiches': [11,12,13],
  'Wraps': [14,15,16,17],
  'Sides': [18,19,20,21],
  'Salads': [22,23,24],
  'Combos': [25,26,27,28],
  'Drinks': [29,30,31,32],
  'Desserts': [33,34],
};
  HomeProductsCubit(this._homeProductsRepo)
    : super(HomeProductsState.initial());
  TextEditingController searchController = TextEditingController();
  void emitHomeProductsState() async {
    token = await LocalStorage.getToken();
    userName = await LocalStorage.getUserName();
    userImage = await LocalStorage.getUserImage();


    emit(HomeProductsState.loading());
    final response = await _homeProductsRepo.fetchProducts();
    response.when(
      success: (data) {
        allProducts=data.data!;
        filteredProducts=data.data!;
        emit(HomeProductsState.success(products: filteredProducts));
      },
      failure: (error) {
        emit(HomeProductsState.error(error: error.apiErrorModel.message));
      },
    );
  }

  void filterProducts(String? category, String? searchQuery){
    if(category!=null){
      selectedCategory=category;
    }
    List tempList=List.from(allProducts);
    if(selectedCategory!='All'){
      final ids=categoryMap[selectedCategory]??[];
      tempList=tempList.where((product){
     return ids.contains(product.id);
      }).toList();
    }
    if(searchQuery!=null){
      final query=searchQuery.toLowerCase();
      tempList=tempList.where((product) {
   return product.name.toLowerCase().contains(query);
      }).toList();
    }
    filteredProducts=tempList;
    emit(HomeProductsState.success(products: filteredProducts));
  }


  // void searchProducts(String query){
  //   if(query.isEmpty){
  //     emit(HomeProductsState.success(products: allProducts));
  //     return;
  //   }
  //   final filteredList=allProducts.where((product){
  //   return product.name.toLowerCase().contains(query.toLowerCase());
  //   }).toList();
  //   emit(HomeProductsState.success(products: filteredList));
  // }
}

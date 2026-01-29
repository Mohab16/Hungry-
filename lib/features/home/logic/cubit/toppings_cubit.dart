import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/home/data/repos/toppings_repo.dart';
import 'package:hungry/features/home/logic/cubit/toppings_state.dart';

class ToppingsCubit extends Cubit<ToppingsState> {
  final ToppingsRepo toppingsRepo;
  ToppingsCubit(this.toppingsRepo) : super(ToppingsState.initial());
  List toppingList=[];
  void emitToppings() async {
    emit(ToppingsState.loading());

    final response=await toppingsRepo.fetchToppings();
    response.when(
      success:(data) {
         toppingList=data.data??[];
        emit(ToppingsState.success(toppingList));
      },
       failure:(error) {
         emit(ToppingsState.error(error: error.apiErrorModel.message));
         print(error);
       },
       );
  }
}

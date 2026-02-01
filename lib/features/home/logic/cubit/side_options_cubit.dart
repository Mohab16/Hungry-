

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/home/data/repos/side_options_repo.dart';
import 'package:hungry/features/home/logic/cubit/side_options_state.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  final SideOptionsRepo sideOptionsRepo;
  SideOptionsCubit(this.sideOptionsRepo) : super(SideOptionsState.initial());
  List sideOptionsList=[];

  void emitSideOptions() async {
    emit(SideOptionsState.loading());
    final response=await sideOptionsRepo.fetchSideOptions();
    response.when(
      success:(data) {
         sideOptionsList=data.data??[];
        emit(SideOptionsState.success(sideOptionsList));
      },
     failure:(error) {
       emit(SideOptionsState.error(error: error.apiErrorModel.message));
                print(error);

     },
     );
  }
}

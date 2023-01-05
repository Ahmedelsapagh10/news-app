import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newapp/cubit/ststes2.dart';
import 'package:newsapp/newapp/network/remote/local/cachHelper.dart';

class AppCubit extends Cubit<NewsStates2> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool mode = false;
  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      mode = fromShared;
      emit(ModeState());
    } else {
      mode = !mode;
      CacheHelper.putData('mode', mode).then((value) {
        emit(ModeState());
      });
    }
  }
}

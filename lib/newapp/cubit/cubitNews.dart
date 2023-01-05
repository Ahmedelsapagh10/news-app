import 'package:newsapp/newapp/network/remote/dio.dart';

import 'StatesNews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  //هي عباره عن فانكشن من نوع   newCubit
  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> technology = [];
  void getTechnology() {
    emit(TechnologyLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': 'fcd7559081ae4fd1b5667a71215dc5f1',
    }).then((value) {
      //  print(value.data.toString());
      technology = value.data["articles"];
      emit(TechnologySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TechnologyErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(ScienceLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'fcd7559081ae4fd1b5667a71215dc5f1',
    }).then((value) {
      //  print(value.data.toString());
      science = value.data["articles"];
      emit(ScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ScienceErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'fcd7559081ae4fd1b5667a71215dc5f1',
    }).then((value) {
      sports = value.data["articles"];
      emit(SportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SportsErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(bussinessLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'fcd7559081ae4fd1b5667a71215dc5f1',
    }).then((value) {
      //  print(value.data.toString());
      business = value.data["articles"];
      emit(bussinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(bussinessErrorState(error.toString()));
    });
  }
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(SearchLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      'q': '$value',
      'apiKey': 'fcd7559081ae4fd1b5667a71215dc5f1',
    }).then((value) {
      //  print(value.data.toString());
      search = value.data["articles"];
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }
}

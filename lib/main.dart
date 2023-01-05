import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/newapp/components/shared/myobserver.dart';
import 'package:newsapp/newapp/cubit/cubit2.dart';
import 'package:newsapp/newapp/cubit/cubitNews.dart';
import 'package:newsapp/newapp/cubit/ststes2.dart';
import 'package:newsapp/newapp/homeNews.dart';
import 'package:newsapp/newapp/network/remote/dio.dart';
import 'package:newsapp/newapp/network/remote/local/cachHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initialDio();
  await CacheHelper.init();
  bool IsDark = CacheHelper.getData('IsDark');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(IsDark));
}

class MyApp extends StatelessWidget {
  final bool IsDark;
  MyApp(this.IsDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..changeAppMode(
              fromShared: IsDark,
            ),
        ),
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getScience()
            ..getSports()
            ..getTechnology(),
        )
      ],
      child: BlocConsumer<AppCubit, NewsStates2>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              tabBarTheme: TabBarTheme(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelPadding: EdgeInsets.all(0),
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                // foregroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                shadowColor: Colors.grey,
                centerTitle: true,
                elevation: 8.0,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              )),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              tabBarTheme: TabBarTheme(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelPadding: EdgeInsets.all(0),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                //foregroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                shadowColor: Colors.grey,
                centerTitle: true,
                elevation: 0.0,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
              // HexColor('333739'),
            ),
            themeMode:
                AppCubit.get(context).mode ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              child: homeScreen(),
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}

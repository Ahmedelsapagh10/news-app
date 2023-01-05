import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newapp/cubit/StatesNews.dart';
import 'package:newsapp/newapp/cubit/cubit2.dart';
import 'package:newsapp/newapp/cubit/cubitNews.dart';
import 'package:newsapp/newapp/models/Sports.dart';
import 'package:newsapp/newapp/models/business.dart';
import 'package:newsapp/newapp/models/science.dart';
import 'package:newsapp/newapp/models/searchScreen.dart';
import 'package:newsapp/newapp/models/technology.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit();

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'N اخبار',
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => searchScreen()));
                    }),
                IconButton(
                    icon: AppCubit.get(context).mode
                        ? Icon(Icons.lightbulb_outline)
                        : Icon(Icons.nightlight_round),
                    onPressed: () {
                      AppCubit.get(context).changeAppMode();
                    })
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.sports_football),
                    text: ('Sports'),
                  ),
                  Tab(
                    icon: Icon(Icons.computer_outlined),
                    text: ('Technology'),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.business_center_outlined,
                    ),
                    text: ('Business'),
                  ),
                  Tab(
                    icon: Icon(Icons.science),
                    text: ('Science'),
                  ),
                ],
              ),
            ),
            //  drawer: Drawer(),
            body: TabBarView(children: [
              sportsScreen(),
              technologyScreen(),
              businessScreen(),
              scienceScreen(),
            ]),
          ),
        );
      },
    );
  }
}

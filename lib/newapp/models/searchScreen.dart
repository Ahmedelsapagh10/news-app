import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newapp/components/shared/component.dart';
import 'package:newsapp/newapp/cubit/StatesNews.dart';
import 'package:newsapp/newapp/cubit/cubitNews.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var items = NewsCubit.get(context).search;
          return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: Text('N اخبار'),
              ),
              body: Container(
                  child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: defaultTextField(
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Invalid Search..!';
                            }
                            return null;
                          },
                          textType: TextInputType.text,
                          label: 'search',
                          prefixIcon: Icons.search_sharp,
                          controller: searchController,
                          onChange: (String value) {
                            NewsCubit.get(context).getSearch(value);
                          })),
                  Expanded(child: Center(child: ArticalBuilder(items, context)))
                ],
              )));
        });
  }
}

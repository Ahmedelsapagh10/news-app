import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newapp/components/shared/component.dart';
import 'package:newsapp/newapp/cubit/StatesNews.dart';
import 'package:newsapp/newapp/cubit/cubitNews.dart';

class scienceScreen extends StatefulWidget {
  @override
  _scienceScreenState createState() => _scienceScreenState();
}

class _scienceScreenState extends State<scienceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var items = NewsCubit.get(context).science;
        return ArticalBuilder(items, context);
      },
    );
  }
}

import 'package:api_app/Layouts/cubit/cubit.dart';
import 'package:api_app/Layouts/cubit/states.dart';
import 'package:api_app/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var list=NewsCubit.get(context).sports;
        return articleBuilder(list,context);
      },



      );

  }
}

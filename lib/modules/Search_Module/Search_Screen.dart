import 'package:api_app/Layouts/cubit/cubit.dart';
import 'package:api_app/Layouts/cubit/states.dart';
import 'package:api_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var SearchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
      listener: (context,stste){

      },
      builder: (context,state){
        var list=NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(

          ),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    Controller: SearchController,
                    type: TextInputType.text,
                    validate: (String value){
                      if(value.isEmpty)
                      {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    prefix:Icons.search ,
                    onChange: (value){
                     NewsCubit.get(context).getSearch(value);
                    }

                    ),
                ),
              Expanded(child: articleBuilder(list, context,isSearch: true))
            ],

            ),
          );

      },
    );
  }
}

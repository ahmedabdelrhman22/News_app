import 'package:api_app/Network/Dio.dart';
import 'package:api_app/components/components.dart';
import 'package:api_app/modules/Search_Module/Search_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewStates>(
        listener: (context,state)=>{},
        builder:  (context,state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: ()
                    {
                      Navigate(context,SearchScreen());
                      },
                    icon: Icon(
                        Icons.search
                        )
                    ),

                IconButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).changeAppMode();

                    },
                    icon: Icon(
                        Icons.brightness_4_outlined
                        )
                    ),
              ],
              ),

            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavigationBar(index);

              },

              ),
            body: cubit.Screens[cubit.currentIndex],

            );
        } ,
      );
  }
}

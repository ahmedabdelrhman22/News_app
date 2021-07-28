import 'package:api_app/Layouts/cubit/states.dart';
import 'package:api_app/Network/Cash_Helper.dart';
import 'package:api_app/Network/Dio.dart';
import 'package:api_app/modules/Business/Business_Screen.dart';
import 'package:api_app/modules/Science/Science_Screen.dart';
import 'package:api_app/modules/Settings_Screen/Setting_Screen.dart';
import 'package:api_app/modules/Sports/Sports_Screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewStates>
{
  NewsCubit() : super(InitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
  BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',

      ),
  BottomNavigationBarItem(
    icon: Icon(Icons.sports),
    label: 'Sports',

    ),
  BottomNavigationBarItem(
    icon: Icon(Icons.science),
    label: 'Science',

    ),
//  BottomNavigationBarItem(
//    icon: Icon(Icons.settings),
//    label: 'Settings',
//
//    ),


  ];
  List<Widget>Screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
//    SettingsScreen(),

  ];
  void changeBottomNavigationBar(int index)
  {
    currentIndex=index;

    if(index==1) {
      getSports(
      );
    }
    else if(index==2)
      {
        getScience();
      }
      emit(NewsBootomNavState());
  }
  List<dynamic> business=[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg','category':'business','apikey':'80b9b66050b741428482d340fca4604c'}).then((value)  {
//    print(value.data['articles'][0]['title'])
    business=value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));

    });

  }


  List<dynamic> sports=[];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length ==0 ) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apikey': '80b9b66050b741428482d340fca4604c'
          }
          ).then(
              (value) {
//    print(value.data['articles'][0]['title'])
            sports = value.data['articles'];
            print(
                sports[0]['title']
                );
            emit(
                NewsGetSportsSuccessState(
                )
                );
          }
              ).catchError(
              (onError) {
            print(
                onError.toString(
                )
                );
            emit(
                NewsGetSportsErrorState(
                    onError.toString(
                    )
                    )
                );
          }
              );
    } else
      {
        emit(
            NewsGetSportsSuccessState(
            )
            );
      }

  }

  List<dynamic> science=[];

  void getScience() {
    emit(
        NewsGetScienceLoadingState(
        )
        );
    if (science.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apikey': '80b9b66050b741428482d340fca4604c'
//            '65f7f556ec76449fa7dc7c0069f040ca'
          }
          ).then(
              (value) {
//    print(value.data['articles'][0]['title'])
            science = value.data['articles'];
            print(
                science[0]['title']
                );
            emit(
                NewsGetScienceSuccessState(
                )
                );
          }
              ).catchError(
              (onError) {
            print(
                onError.toString(
                )
                );
            emit(
                NewsGetScienceErrorState(
                    onError.toString(
                    )
                    )
                );
          }
              );
    }
    else
      {
        emit(
            NewsGetScienceSuccessState(
            )
            );

      }
  }
  List<dynamic> search=[];

  void getSearch(String value) {
    emit(
        NewsGetSearchLoadingState(
        )
        );
    search=[];


      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q': '$value',
            'apikey': '80b9b66050b741428482d340fca4604c'
//            '65f7f556ec76449fa7dc7c0069f040ca'
          }
          ).then(
              (value) {
//    print(value.data['articles'][0]['title'])
            search = value.data['articles'];
            print(
                search[0]['title']
                );
            emit(
                NewsGetSearchSuccessState(
                )
                );
          }
              ).catchError(
              (onError) {
            print(
                onError.toString(
                )
                );
            emit(
                NewsGetSearchErrorState(
                    onError.toString(
                    )
                    )
                );
          }
              );

  }
  bool isDark=false;
  ThemeMode appMode=ThemeMode.dark;
  void changeAppMode( {bool fromShared})
  {
    if(fromShared!=null)
      {
        isDark=fromShared;
        emit(ChangeAppModeState());
      }
      else {
      isDark = !isDark;
      CashHelper.putBoolean(
          key: 'isDark', value: isDark
          ).then(
              (value) =>
              emit(
                  ChangeAppModeState(
                  )
                  )
              );
    }
  }


}
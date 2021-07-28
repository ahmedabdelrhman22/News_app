import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import 'Layouts/News_Layout.dart';
import 'Layouts/cubit/cubit.dart';
import 'Layouts/cubit/states.dart';
import 'Network/Cash_Helper.dart';
import 'Network/Dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool isDark= CashHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (context)=>NewsCubit()..changeAppMode(fromShared:isDark)),
      ],
        child: BlocConsumer<NewsCubit,NewStates>(
          listener: (context,state){
            },
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',

              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepOrange,

                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0 ,
                  backgroundColor: Colors.white,
                  backwardsCompatibility: false,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                    ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    ),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

                    ),

                  ),

                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,

                  ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                  ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    ),
                  ),


                ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor:  HexColor('333739'),
                primarySwatch: Colors.deepOrange,

                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0 ,

                  backgroundColor: HexColor('333739'),
                  backwardsCompatibility: false,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:  HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                    ),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

                    ),

                  ),

                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20.0,
                  backgroundColor: HexColor('333739'),
                  unselectedItemColor: Colors.grey,
                  ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    ),
                  ),
                ),
              themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,

              home: NewsLayout(),
              );



          },
        ),

    );
  }
}




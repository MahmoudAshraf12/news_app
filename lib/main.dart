import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {

  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..GetBusiness()..GetSports()..GetSports(),
      child: BlocConsumer(
        listener: (context, state) {},
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
              ),
              scaffoldBackgroundColor: HexColor('333739'),
            ),
            themeMode: ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

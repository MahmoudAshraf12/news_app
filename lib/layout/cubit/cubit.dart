import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

import '../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  int CurrentIndex = 0;
  List<BottomNavigationBarItem> bottomItems=
  [
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
  ];
  void ChangeBottomNavBar(int index)
  {
    CurrentIndex= index;
    emit(NewsBottomNavState());
  }
  List<dynamic> business=[];

  void GetBusiness()
  {
    emit(NewsLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines' ,
      query: {
        'country' : 'eg',
        'category' : 'business',
        'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessFailState(error.toString()));
    });
  }
  List<dynamic> sports =[];

  void GetSports()
  {
    if(sports.length==0){
      DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsFailState(error.toString()));
      });
    }
    else
    {
      emit(NewsGetSportsSuccessState());

    }

  }
  List<dynamic> science =[];
  void GetScience()
  {
    if(science.length==0){
      DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceFailState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }
  }
  List<dynamic> search =[];
  void GetSearch( String value)
  {
    DioHelper.getData(
      url:'v2/everything' ,
      query: {
        'q' : '$value',
        'apiKey' : '0845913380df45f39fb2ff0d8a7aa9c7',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearcheFailState(error.toString()));
    });
  }
}

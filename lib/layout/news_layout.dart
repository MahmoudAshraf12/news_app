import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/component/component.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton
                  (
                    onPressed: ()
                    {
                      navigationTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search),
                ),
              ],
            ),
            body: cubit.Screens[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.CurrentIndex,
              onTap: (int index)
              {
                cubit.ChangeBottomNavBar(index);
              },
              items:cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}

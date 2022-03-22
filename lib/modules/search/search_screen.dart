import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/component/component.dart';

class SearchScreen extends StatelessWidget {
  var searchControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state){},
        builder: (context , state) {
          var list = NewsCubit.get(context).search;
          return
            Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:TextFormField(
                      controller:searchControler ,
                      keyboardType: TextInputType.text,
                      onChanged: (value)
                      {
                        NewsCubit.get(context).GetSearch(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.search ,
                        ),
                      ),
                    ),

                    ),
                  Expanded(child: articleBuilder(list , context, isSearch : true)),
                ],
              ),
            );
        });
  }
}
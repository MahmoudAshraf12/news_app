// import 'package:flutter/material.dart';
//
// class SportsScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(
//           'Sports Screen',
//          style: TextStyle(
//          fontWeight: FontWeight.bold,
//          fontSize: 35.0,
//         ),
//         ),
//       ),
//     );
//   }
// }
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/component/component.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {


        var list = NewsCubit.get(context).sports;



        return articleBuilder (list, context );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../model/todo_model.dart';
import '../widgets/todo_tile.dart';


class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoStates>(builder: (context, state) {
      var cubit = TodoCubit.get(context);
      List<TodoModel>? todosList = [];
      for (var item in cubit.todosList!) {
        if (item.isDone) {
          todosList.add(item);
        }
      }
      return todosList.isEmpty
          ? const Center(
              child: Text('Done is empty'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return CardBuilder(todoModel: todosList[index]);
              },
              itemCount: todosList.length,
              shrinkWrap: true,
            );
    });
  }
}

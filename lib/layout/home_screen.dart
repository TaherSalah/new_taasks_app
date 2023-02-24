import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../model/todo_model.dart';
import '../shard/widgets/def_navBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.screenTitles[cubit.currentIndex]),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: defualtBottomNavigationBar(
                tabs: [
                  const GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  const GButton(
                    icon: Icons.done,
                    text: 'Done',
                  ),
                  const GButton(
                    icon: Icons.add,
                    text: 'Add',
                  ),
                  const GButton(
                    icon: Icons.archive_outlined,
                    text: 'Archived',
                  ),
                  const GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                onTabChange: (value) {
                  cubit.setBottomIndex(value);
                },
                currentIndex: cubit.currentIndex,
                context: context),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(child: Text('Add Short Task !')),
                    icon: Image.asset('assets/images/addNewNotes.png',color: Colors.white,width: 50,height: 50,),
                    // To display the title it is optional
                    content: BlocBuilder<TodoCubit, TodoStates>(
                        builder: (context, state) {
                      return Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: cubit.titleController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Title',
                                hintText: 'Enter Title',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'hey bro dont leave it empty';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            TextFormField(

                              controller: cubit.descriptionController,
                              // minLines: 10,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),

                                labelText: 'Description',
                                hintText: 'Enter your Description',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'hey bro';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.amber.withOpacity(0.8),
                                    maximumSize: Size.infinite),
                                onPressed: () {
                                  cubit.setDate(context);
                                },
                                icon: const Icon(Icons.date_range),
                                label: Text(
                                  // Formatted Date
                                  DateFormat.yMMMEd()

                                      // displaying formatted date
                                      .format(cubit.initalDate),
                                )),
                          ],
                        ),
                      );
                    }),
                    actions: [
                     Row(
                       children: [
                         ElevatedButton.icon(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.amber.withOpacity(0.8),
                             ),
                             onPressed: () {
                               Navigator.pop(context);
                               cubit.clearController();

                             },
                             icon: const Icon(Icons.cancel),
                             label: const Text('Cancle')),
                         const SizedBox(
                           height: 20,
                         ),
                         Spacer(),
                         ElevatedButton.icon(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.amber.withOpacity(0.8),
                             ),
                             onPressed: () {
                               if (formKey.currentState!.validate()) {
                                 cubit.addTodo(TodoModel(
                                   title: cubit.titleController.text,
                                   description: cubit.descriptionController.text,
                                   date: cubit.initalDate,
                                   isDone: false,
                                   isArchived: false,
                                 ));
                                 ScaffoldMessenger.of(context)
                                     .showSnackBar(SnackBar(
                                   content:
                                   Text('${cubit.titleController.text} added'),
                                   backgroundColor: Colors.green,
                                 ));
                                 Navigator.pop(context);

                                 cubit.clearController();
                               }
                             },
                             icon: const Icon(Icons.add),
                             label: const Text('Add')),
                       ],
                     )
                    ],
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}

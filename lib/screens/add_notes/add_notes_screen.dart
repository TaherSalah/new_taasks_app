import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_task/model/todo_model.dart';
import 'package:new_task/screens/home/all_tasks_screen.dart';
import 'package:new_task/shard/widgets/button.dart';
import 'package:new_task/shard/widgets/navigators.dart';

import '../../layout/home_screen.dart';
import '../../shard/cubit/cubit.dart';
import '../../shard/cubit/states.dart';
import '../../shard/widgets/custom_form_faild.dart';
import '../../shard/widgets/validation.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({Key? key}) : super(key: key);

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(child: AddNotesForm()),
    );
  }
}

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        if (state is NotesSuccessState) {
          // showToast(state: ToastStates.success, text: 'Add Notes success');
        }
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text('Add New Notes',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 2,
                    width: 50,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    color: Colors.red,
                  ),
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(
                vertical: 8,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomFormField(
                  controller: cubit.titleController,
                  hint: 'Note Title',
                  onSaved: (value) {
                    title = value;
                    setState(() {});
                  },
                  onChanged: (value) {},
                  validator: Validator.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomFormField(
                  controller: cubit.descriptionController,
                  hint: 'Title Description',
                  maxLines: 15,
                  onSaved: (value) {
                    subTitle = value;
                    setState(() {});
                  },
                  onChanged: (value) {},
                  validator: Validator.name,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(maximumSize: Size.infinite),
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
              Padding(
                padding: EdgeInsets.all(15.0),
                child: defaultButton(
                  context: context,
                  name: 'Add Notes',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.addTodo(TodoModel(
                        title: cubit.titleController.text.toString(),
                        description:
                            cubit.descriptionController.text.toString(),
                        date: cubit.initalDate,
                        isDone: false,
                        isArchived: false,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${cubit.titleController.text} added'),
                        backgroundColor: Colors.green,
                      ));
                      cubit.clearController();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

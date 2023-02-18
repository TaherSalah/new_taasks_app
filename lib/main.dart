import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:new_task/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'cubit/cubit.dart';
import 'model/todo_model.dart';

const String todoBoxName = "todos";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<TodoModel>(todoBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()..getBox()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.black12
        ),
        home: HomeScreen(),
      ),
    );
  }
}

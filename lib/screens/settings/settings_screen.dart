import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:new_task/shard/cubit/cubit.dart';
import 'package:new_task/shard/cubit/states.dart';
import 'package:new_task/shard/widgets/navigators.dart';

import '../../shard/widgets/my_divider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                // User card

                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    child: const Text(
                      'إعدادت عامة',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                myDivider(),
                SizedBox(
                  height: 8,
                ),

                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.pencil_outline,
                //   iconStyle: IconStyle(),
                //   title: 'المظهر',
                //   subtitle: "تغيير المظهر الخاص بالبرنامج",
                // ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'الوضع الليلي',
                  subtitle: "الافتراضي",
                  trailing: Switch.adaptive(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                        // ignore: avoid_print
                        print(value);
                      });
                    },
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'من نحن ؟  ',
                  subtitle: "تعرف عنا اكتر",
                ),

                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.question_circle,
                //   iconStyle: IconStyle(),
                //   title: 'مساعدة',
                //   subtitle: "لتقديم مساعدة اكثر حول البرنامج",
                // ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.question_circle,
                  iconStyle: IconStyle(),
                  title: 'مساعدة',
                  subtitle: "لتقديم مساعدة اكثر حول البرنامج",
                ),
                SizedBox(
                  height: 15,
                ),
                myDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    child: const Text(
                      'إعدادت الحساب',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // You can add a settings title
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "تسجيل الخروج",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  iconStyle: IconStyle(
                      iconsColor: Colors.red, backgroundColor: Colors.white),
                  title: "حذف الحساب",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

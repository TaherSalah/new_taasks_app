import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:new_task/cubit/cubit.dart';
import 'package:new_task/cubit/states.dart';

import '../../widgets/my_divider.dart';


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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    const Text(
                      'طاهر صلاح',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'tahersalah@gmail.com',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        // navigate(context, EditScreen());
                        print('ontap');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        width: 210,
                        decoration: BoxDecoration(
                            color: Colors.lime,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 5.0),
                                  blurRadius: 5)
                            ]),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'تعديل الملف الشخصي',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(Icons.arrow_back_ios_new_outlined,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
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
                SizedBox(height: 8,),

                myDivider(),
                SizedBox(height: 8,),

                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title: 'المظهر',
                  subtitle: "تغيير المظهر الخاص بالبرنامج",
                ),
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

                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.question_circle,
                  iconStyle: IconStyle(),
                  title: 'مساعدة',
                  subtitle: "لتقديم مساعدة اكثر حول البرنامج",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.question_circle,
                  iconStyle: IconStyle(),
                  title: 'مساعدة',
                  subtitle: "لتقديم مساعدة اكثر حول البرنامج",
                ),
                SizedBox(height: 15,),
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
                SizedBox(height: 8,),
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

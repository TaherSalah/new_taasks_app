import 'package:flutter/material.dart';
import 'package:new_task/shard/widgets/my_divider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Text('version : 1.0.0',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 13, color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.copyright_sharp, size: 20),
              Text(
                'All Rights Reseved by Dev Taher Salah \u{1f60e}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 12),
            child: myDivider(),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Text(
                  'عن البرنامج',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Text(
                  textAlign:TextAlign.center,
                    selectionColor: Colors.amber,
                    'برنامج Note Tasks هو رفيقك الاول في تسجيل مهامك اليومية ومتابعتها بشكل مستمر فمن خلاله تستطيع تسجيل كل ماتريد من ملاحظات يومية بكل سهولة ويسر دون خوف من ضياع هذة الملاحظات في اي وقت بشكل او باخر اترك لك تجربة ممتعه لهذا البرنامج واذا كان لديك اي اقتراحات لتطوير هذا البرنامج قم بمراسلتي من خلال روابط السوشيال ميديا الموجودة اسفل هذة الصفحة.')
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../shard/widgets/my_divider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          'Help Me',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.amber,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: myDivider()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'اولا لإضافة مهمة جديدة',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                ),
              ),
              Expanded(child: myDivider()),
            ],
          ),

        ],
      ),
    );
    ;
  }
}

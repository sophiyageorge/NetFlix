import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/colors/colors.dart';

class MainTitle extends StatelessWidget {
  MainTitle({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
    );
  }
}

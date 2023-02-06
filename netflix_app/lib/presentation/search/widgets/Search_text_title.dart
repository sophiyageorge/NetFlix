import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
    );
  }
}

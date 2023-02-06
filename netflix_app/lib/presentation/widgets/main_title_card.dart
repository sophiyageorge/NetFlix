import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';

import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  String title = "";
  MainTitleCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => MainCard(),
            ),
          ),
        ),
      ],
    );
  }
}

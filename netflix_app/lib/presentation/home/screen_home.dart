import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/home/custom_button_widget.dart';
import 'package:netflix_app/presentation/home/number_card.dart';

import '../../core/constants.dart';
import '../widgets/main_card.dart';
import '../widgets/main_title.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomButtonWidget(),
          MainTitleCard(title: "Released in the past year"),
          kheight,
          MainTitleCard(title: "Trending Now"),
          kheight,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitle(title: "Top 10 TV Shows in India today"),
              kheight,
              LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => NumberCard(index: index),
                  ),
                ),
              ),
            ],
          ),
          kheight,
          MainTitleCard(title: "Tense Dramas"),
          kheight,
          MainTitleCard(title: "South Indian Cinema"),
          kheight,
        ],
      ),
    );
  }
}

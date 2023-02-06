import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kMainImage),
            ),
          ),
        ),
        Positioned(
          left: 50,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _customButtonWidget(
                text: "My List",
                icon: Icons.add,
              ),
              kwidth50,
              _PlayButton(),
              kwidth50,
              _customButtonWidget(
                text: "info",
                icon: Icons.info,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _customButtonWidget extends StatelessWidget {
  const _customButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 28,
      child: TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kwhite.withOpacity(0.4)),
        ),
        icon: const Icon(
          Icons.play_arrow,
          size: 10,
          color: kBlackColor,
        ),
        label: Padding(
          padding: const EdgeInsets.all(0.5),
          child: Text(
            "Play",
            style: TextStyle(
              fontSize: 7,
              color: kBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}

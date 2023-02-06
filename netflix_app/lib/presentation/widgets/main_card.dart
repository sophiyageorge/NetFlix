import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});
  final ImageUrl =
      "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius,
        image: DecorationImage(
          image: NetworkImage(ImageUrl),
        ),
      ),
    );
  }
}

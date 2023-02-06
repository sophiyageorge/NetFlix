import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/screen_download.dart';
import 'package:netflix_app/presentation/fast_and_laugh/screen_fast_and_laugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_app/presentation/new_and_hot/Screen_new_and_hot.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class Screen_MainPage extends StatelessWidget {
  Screen_MainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastAndLaugh(),
    ScreenSearch(),
    ScreenDownload(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}

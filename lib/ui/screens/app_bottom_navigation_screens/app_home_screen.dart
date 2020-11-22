import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:sportsbet/ui/view_model/bottom_navigation_view_model.dart';

const String _labelHome = 'ホーム';
const String _labelLiveSchedule = 'スケジュール';
const String _labelTimeline = 'タイムライン';
const String _labelNotification = 'お知らせ';
const String _labelProfile = 'プロフィール';


final _navigatedScreens = [
  NavigatedScreen(_labelHome),
  NavigatedScreen(_labelLiveSchedule),
  NavigatedScreen(_labelTimeline),
  NavigatedScreen(_labelNotification),
  NavigatedScreen(_labelProfile),
];

class AppBottomNavigationScreens extends StatelessWidget {

  final BottomNavigationViewModel bottomNavigationViewModel = BottomNavigationViewModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationViewModel>.value(
            value: bottomNavigationViewModel),
      ],
      builder: (context, widget) {
        return AppMainScreen();
      },
    );
  }
}

class AppMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    BottomNavigationViewModel bottomNavigationViewModel = Provider.of<BottomNavigationViewModel>(context);

    return Scaffold(
      body: _navigatedScreens.elementAt(bottomNavigationViewModel.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: _labelHome),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.calendar), label: _labelLiveSchedule),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.listAlt), label: _labelTimeline),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bell), label: _labelNotification),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: _labelProfile),
        ],
        currentIndex: bottomNavigationViewModel.currentIndex,
        fixedColor: appBackgroundColor,
        onTap: bottomNavigationViewModel.changeCurrentIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class NavigatedScreen extends StatelessWidget {
  final String screenTitle;

  NavigatedScreen(this.screenTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackgroundColor,
      child: Center(
        child: Text(
          screenTitle,
          style: TextStyle(
            color: whiteColor,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
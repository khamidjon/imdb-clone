import 'package:flutter/material.dart';
import 'package:imdb_localization/strings.g.dart';

class IMDBBottomNavigationBar extends StatefulWidget {
  const IMDBBottomNavigationBar({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  State<IMDBBottomNavigationBar> createState() =>
      IMDBBottomNavigationBarState();
}

class IMDBBottomNavigationBarState extends State<IMDBBottomNavigationBar> {
  var _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPageIndex,
      onTap: (index) {
        widget.pageController.jumpToPage(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.t.main.tabs.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: context.t.main.tabs.search,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.slow_motion_video),
          label: context.t.main.tabs.video,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_pin),
          label: context.t.main.tabs.profile,
        ),
      ],
    );
  }
}

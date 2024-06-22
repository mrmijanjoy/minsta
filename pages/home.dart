import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  } 
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;
  final List<Widget> _pages = const [
    FeedPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minsta",
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icon.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0, 
              right: 8.0
            ),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icon.logout),
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPage],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index) {
        setState(() {
          _currentPage = _index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Feed',
          icon: Icon(
            Icons.feed,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.account_box,
          ),
        ),
      ],
    );
  }
}

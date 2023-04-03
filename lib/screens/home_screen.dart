import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Object>> _widgets = const [
    {'screen': Text('Home'), 'title': 'Home'},
    {'screen': Text('Favourite'), 'title': 'Favourite'},
    {'screen': Text('Search'), 'title': 'Search'},
    {'screen': Text('Setting'), 'title': 'Setting'}
  ];
  int _selectedIndex = 0;

  void _chengeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String label, IconData icon, Color color) {
    return BottomNavigationBarItem(
      backgroundColor: color,
      icon: Icon(icon),
      label: label,
      activeIcon: Container(
        width: 120,
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black.withOpacity(0.5),
            ),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Bottom Navigation Bar -> ${_widgets[_selectedIndex]['title']}'),
      ),
      body: Center(
        child: _widgets[_selectedIndex]['screen'] as Widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _chengeScreen,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem(
            'Home',
            Icons.home,
            Colors.black.withOpacity(0.8),
          ),
          buildBottomNavigationBarItem(
            'Favorite',
            Icons.favorite,
            Colors.green.withOpacity(0.8),
          ),
          buildBottomNavigationBarItem(
            'Search',
            Icons.search,
            Colors.red.withOpacity(0.8),
          ),
          buildBottomNavigationBarItem(
            'Settings',
            Icons.settings,
            Colors.blue.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uni_flutter/src/pages/post_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const PostPage()));
        return;
      }
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: "Company"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notification"),
        BottomNavigationBarItem(icon: Icon(Icons.man), label: "Profile"),
      ],
      onTap: _onItemTap,
    );
  }
}

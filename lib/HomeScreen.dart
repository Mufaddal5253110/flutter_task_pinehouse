import 'package:flutter/material.dart';
import 'package:flutter_task_pinehouse/Screens/AddUserScreen.dart';
import 'package:flutter_task_pinehouse/Screens/AllUsersScreen.dart';
import 'package:flutter_task_pinehouse/Utils/Global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: Global.height(context) * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (_selectedIndex != 0) {
                    _selectedIndex = 0;
                    _pageController.animateToPage(_selectedIndex,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
                    setState(() {});
                  }
                },
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        "Add User",
                        style: TextStyle(
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_selectedIndex != 1) {
                    _selectedIndex = 1;
                    _pageController.animateToPage(_selectedIndex,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn);
                    setState(() {});
                  }
                },
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        "All Users",
                        style: TextStyle(
                          color:
                              _selectedIndex == 1 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: Global.height(context),
        width: Global.width(context),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const <Widget>[
            AddUserScreen(),
            AllUsersScreen(),
          ],
        ),
      ),
    );
  }
}

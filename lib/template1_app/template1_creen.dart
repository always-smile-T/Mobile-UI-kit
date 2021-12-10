import 'package:flutter/material.dart';
import 'package:template1/template1_app/app_theme.dart';
import 'package:template1/template1_app/main_function/Message/list_messages_screen.dart';



class Template1Screen extends StatefulWidget {
  @override
  _Template1ScreenState createState() =>  _Template1ScreenState();
}

class _Template1ScreenState extends State<Template1Screen> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: const  <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home, color: AppTheme.grey1,), label: "Home", backgroundColor: AppTheme.greenPrimary),
          BottomNavigationBarItem(icon: Icon(Icons.mail, color: AppTheme.grey1), label: "Market", backgroundColor: AppTheme.greenPrimary),
          BottomNavigationBarItem(icon: Icon(Icons.mail, color: AppTheme.grey1), label: "Messages", backgroundColor: AppTheme.greenPrimary),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: AppTheme.grey1), label:"Profile", backgroundColor: AppTheme.greenPrimary),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(child: Text("This function is being developing")),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(child: Text("This function is being developing")),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ListMessScreen(),
    );
  }
}
class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const  Center(child: Text("This function is being developing")),
    );
  }
}
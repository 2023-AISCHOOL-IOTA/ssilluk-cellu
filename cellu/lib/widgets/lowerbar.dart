import 'package:flutter/material.dart';

import '../screens/biometrics_screen.dart';
import '../screens/mypage_screen.dart';
// 다른 페이지들에 대한 import도 추가해야 합니다.

class Bottomnavi extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottomnavi> {
  int _selectedIndex = 0;
  // 각 탭에 해당하는 페이지 위젯들을 리스트로 관리합니다.
  final List<Widget> _pages = [
    BioScreen(),
    MypageScreen(),
    MypageScreen(),
    MypageScreen(),
    // 여기에 다른 페이지 위젯들을 추가합니다.
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 현재 선택된 탭에 해당하는 페이지를 표시합니다.
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/Menu 1.png", scale: 3,),
            activeIcon: Image.asset("assets/icons/Menu 1_1.png", scale: 3,),
            label: '메인페이지',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/Menu 7.png", scale: 3,),
            activeIcon: Image.asset("assets/icons/Menu 7_1.png", scale: 3,),
            label: '생체 정보',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/Menu 6.png", scale: 3,),
            activeIcon: Image.asset("assets/icons/Menu 6_1.png", scale: 3,),
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/Menu 4.png", scale: 3,),
            activeIcon: Image.asset("assets/icons/Menu 4_1.png", scale: 3,),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

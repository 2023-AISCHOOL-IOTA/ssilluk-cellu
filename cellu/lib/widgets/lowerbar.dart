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
      bottomNavigationBar: ClipRRect(  // 네비게이션 바의 라운드 효과를 주기 위해 ClipRRect를 사용합니다.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 아이콘 크기를 고정합니다.
          backgroundColor: Colors.black, // 배경색을 검정으로 설정합니다.
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.zero, // 패딩을 0으로 설정합니다.
                child: Image.asset("assets/icons/Menu 1_1.png", width: 22, height: 22), // 아이콘 크기를 조정합니다.
              ),
              label: '메인페이지',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.zero,
                child: Image.asset("assets/icons/Menu 2.png", width: 22, height: 22), // 아이콘 크기를 조정합니다.
              ),
              label: '생체 정보',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.zero,
                child: Image.asset("assets/icons/Menu 3.png", width: 22, height: 22), // 아이콘 크기를 조정합니다.
              ),
              label: '메뉴',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.zero,
                child: Image.asset("assets/icons/Menu 4.png", width: 22, height: 22), // 아이콘 크기를 조정합니다.
              ),
              label: '마이페이지',
            ),
            // 여기에 다른 아이템들을 추가합니다.
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white54, // 비활성화된 아이템 색상을 설정합니다.
          selectedItemColor: Colors.white, // 활성화된 아이템 색상을 설정합니다.
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

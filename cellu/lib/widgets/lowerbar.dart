import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:cellu/main.dart';
import 'package:cellu/screens/Home_screen.dart';
import 'package:cellu/screens/MenuPage.dart';
import 'package:cellu/screens/biometrics_screen.dart';
import 'package:cellu/screens/mypage_screen.dart';

class Bottomnavi extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottomnavi> {
  int _selectedIndex = 0;
  final LocalAuthentication auth = LocalAuthentication();
  final List<Widget> _pages = [
    MainScreen(),
    BioScreen(),
    MenuPage(),
    MypageScreen(),
  ];

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: '지문을 사용하여 인증해 주세요.',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? '인증 성공!' : '인증 실패';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('인증 결과'),
        content: Text(message),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 현재 선택된 탭에 해당하는 페이지를 표시합니다.
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black, // 배경색을 검정으로 설정합니다.
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // 아이콘 크기를 고정합니다.
            backgroundColor: Colors.black,
            // 배경색을 검정으로 설정합니다.
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 1_1.png"),
                ),
                activeIcon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 1.png"),
                ),
                label: '메인페이지',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 2.png"),
                ),
                activeIcon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 2_1.png"),
                ),
                label: '생체 정보',
              ),
              // 지문 인식 기능을 호출하는 버튼을 추가하실 수 있습니다.
              BottomNavigationBarItem(
                icon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 3.png"),
                ),
                activeIcon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 3_1.png"),
                ),
                label: '메뉴',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 4.png"),
                ),
                activeIcon: Container(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/icons/Menu 4_1.png"),
                ),
                label: '마이페이지',
              ),
              // 여기에 다른 아이콘들을 추가합니다.
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white54,
            // 비활성화된 아이템 색상을 설정합니다.
            selectedItemColor: Colors.white,
            // 활성화된 아이템 색상을 설정합니다.
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

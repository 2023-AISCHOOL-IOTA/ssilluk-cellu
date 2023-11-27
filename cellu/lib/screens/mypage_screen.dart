//TODO: 마이페이지 (기기연결,정보수정,비밀번호변경,회원탈퇴,로그아웃)
import 'package:cellu/screens/updateProfile.dart';
import 'package:flutter/material.dart';

import 'Home_screen.dart';
import 'MeasurementPreparation_screen.dart';
import 'MenuPage.dart';
import 'biometrics_screen.dart';
import 'login_screen.dart';

class MypageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white, // 바탕색을 화이트로 설정합니다.
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // AppBar 배경색을 화이트로 설정합니다.
          elevation: 0, // AppBar 그림자를 제거합니다.
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            // 아이콘 색상을 검정색으로 설정합니다.
            onPressed: () {
              // 뒤로가기 버튼을 눌렀을 때 BioScreen으로 이동합니다.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BioScreen()),
              );
            },
          ),
        ),
        body: ListView(children: [
          Mypage(),
        ]),
      ),
    );
  }
}

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 896,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 34,
                top: 273,
                child: Container(
                  width: 324,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 17,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 13,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfileScreen()), // 정보 수정 화면으로 이동
                            );
                          },
                          child: SizedBox(
                            width: 324,
                            height: 38.49,
                            child: Text(
                              '내 정보 수정',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 400,
                child: Container(
                  width: 324,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 17,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 13,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfileScreen()), // 정보 수정 화면으로 이동
                            );
                          },
                          child: SizedBox(
                            width: 324,
                            height: 38.49,
                            child: Text(
                              '비밀번호 변경',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 528,
                child: Container(
                  width: 324,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 17,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 13,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen()), // 정보 수정 화면으로 이동
                            );
                          },
                          child: SizedBox(
                            width: 324,
                            height: 38.49,
                            child: Text(
                              '회원탈퇴',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 655,
                child: Container(
                  width: 324,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 17,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 13,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen()), // 정보 수정 화면으로 이동
                            );
                          },
                          child: SizedBox(
                            width: 324,
                            height: 38.49,
                            child: Text(
                              '로그아웃',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 146,
                child: Container(
                  width: 324,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 17,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 13,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MeasurementPreparation()), // 정보 수정 화면으로 이동
                            );
                          },
                          child: SizedBox(
                            width: 324,
                            height: 38.49,
                            child: Text(
                              '기기 연결하기',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 11,
                top: 65,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 7.75, vertical: 4.25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO: 마이페이지 (기기연결,정보수정,비밀번호변경,회원탈퇴,로그아웃)
import 'package:flutter/material.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/screens/Home_screen.dart';
import 'package:cellu/screens/MeasurementInProgress__screen.dart';
import 'package:cellu/screens/MeasurementPreparation_screen.dart';
import 'package:cellu/screens/updateProfile.dart';
import 'package:cellu/screens/MenuPage.dart';
import 'package:cellu/screens/biometrics_screen.dart';
import 'package:cellu/screens/login_screen.dart';

class MypageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
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
    );
  }
}

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              // "기기 연결하기" 옵션을 맨 위로 이동
              _buildOptionItem(
                context,
                text: '기기 연결하기',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MeasurementInProgress())),
              ),
              _buildOptionItem(
                context,
                top: 127,
                text: '내 정보 수정',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen())),
              ),
              _buildOptionItem(
                context,
                top: 254,
                text: '비밀번호 변경',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen())),
              ),
              _buildOptionItem(
                context,
                top: 381,
                text: '회원탈퇴',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              ),
              _buildOptionItem(
                context,
                top: 508,
                text: '로그아웃',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              ),
              // ... 기타 위젯들 ...
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionItem(BuildContext context,
      {required String text, required Function onTap, double top = 0}) {
    return Positioned(
      left: 34,
      top: top,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: 324,
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 0.5, color: Color(0xFF868686)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 64,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

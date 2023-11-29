import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_text_field.dart';
import '../../styles.dart';
import 'mypage_screen.dart';

enum Gender { male, female }

enum DiabetesType { type1, type2, none }
// enum DiabetesType { type1, type2, gestational, none } 가로 간격 때문에 기타 삭제 위해 임시 처리

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Gender? gender = Gender.male;
  DiabetesType? diabetesType = DiabetesType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // 뒤로가기 버튼을 눌렀을 때 BioScreen으로 이동합니다.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MypageScreen()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SvgPicture.asset('assets/logo-small.svg', height: 60),
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!, width: 1),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '내 정보 수정',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 라벨 행
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '생년월일',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '성별',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // 입력 필드 및 라디오 버튼 행
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              label: '',
                              hint: 'YY.MM.DD',
                              obscureText: false,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 2),
                                borderRadius: BorderRadius.circular(
                                    20), // CustomTextField의 테두리 반경과 일치
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Radio(
                                      value: Gender.male,
                                      groupValue: gender,
                                      onChanged: (Gender? value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const Text('남'),
                                  Expanded(
                                    child: Radio(
                                      value: Gender.female,
                                      groupValue: gender,
                                      onChanged: (Gender? value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const Text('여'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '키 (cm)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '몸무게 (kg)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // 키와 몸무게 입력 필드 행
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              label: '',
                              hint: 'cm',
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 10), // 필드 간격 조정
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              label: '',
                              hint: 'kg',
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        '당뇨 유형',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
// 당뇨 유형 라디오 버튼
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[300]!, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: DiabetesType.values.map((type) {
                            String text = '';
                            switch (type) {
                              case DiabetesType.type1:
                                text = '제1형';
                                break;
                              case DiabetesType.type2:
                                text = '제2형';
                                break;
                              case DiabetesType.none:
                                text = '없음';
                                break;
                            }
                            return Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<DiabetesType>(
                                    value: type,
                                    groupValue: diabetesType,
                                    onChanged: (DiabetesType? value) {
                                      setState(() {
                                        diabetesType = value;
                                      });
                                    },
                                  ),
                                  Text(text),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: 20),
// 보호자 추가 라벨
                      Text(
                        '보호자 추가 | 선택 사항 |',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
// 보호자 추가 입력 필드
                      CustomTextField(
                        label: '',
                        hint: '특수문자 제외 번호만 입력하세요',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('저장되었습니다'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('확인'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('저장하기'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

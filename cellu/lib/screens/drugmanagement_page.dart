import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart'; // 패키지 추가
import 'package:cellu/styles.dart';
import 'package:cellu/screens/Home_screen.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/widgets/lowerbar.dart';

class DrugManagement extends StatelessWidget {
  const DrugManagement({Key? key});

  @override
  Widget build(BuildContext context) {
    return DrugInputPage();
  }
}

class DrugInputPage extends StatefulWidget {
  const DrugInputPage({Key? key});

  @override
  _DrugInputPageState createState() => _DrugInputPageState();
}

class _DrugInputPageState extends State<DrugInputPage> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  DateTime selectedTime = DateTime.now(); // 선택된 시간을 저장할 변수

  // 식사 전/후 여부를 저장할 변수
  bool isBeforeMeal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Bottomnavi()),
            );
          },
        ),
        title: Text('약물 작성'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: GestureDetector(
                      onTap: () {
                        // 시간 선택 다이얼로그 열기
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              selectedTime), // 선택된 시간 초기값 설정
                        ).then((pickedTime) {
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime = DateTime(
                                selectedTime.year,
                                selectedTime.month,
                                selectedTime.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                            });
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}', // 선택된 시간을 예쁘게 표시
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 150,
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(18),
                      isSelected: [isBeforeMeal, !isBeforeMeal],
                      onPressed: (int index) {
                        setState(() {
                          isBeforeMeal = index == 0;
                        });
                      },
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('식전'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('식후'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  hintText: '약물 유형을 작성해주세요.',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: '약물 이름을 작성해주세요.',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: doseController,
                decoration: InputDecoration(
                  hintText: '약물 용량을 작성해주세요.',
                ),
              ),
              SizedBox(height: 32),
              SaveButton(
                typeController: typeController,
                nameController: nameController,
                doseController: doseController,
                timeController: selectedTime,
                // 시간을 DateTime 형태로 전달
                isBeforeMeal: isBeforeMeal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final TextEditingController typeController;
  final TextEditingController nameController;
  final TextEditingController doseController;
  final DateTime timeController;
  final bool isBeforeMeal;

  SaveButton({
    required this.typeController,
    required this.nameController,
    required this.doseController,
    required this.timeController,
    required this.isBeforeMeal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          sendDrugDataToServer(
            typeController.text,
            nameController.text,
            doseController.text,
            timeController,
            isBeforeMeal,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dosePrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          '저장하기',
          style: TextStyle(fontSize: 20, color: AppColors.white),
        ),
      ),
    );
  }

  void sendDrugDataToServer(
    String type,
    String name,
    String dose,
    DateTime time,
    bool isBeforeMeal,
  ) async {
    final token = UserTokenManager.getToken();

    if (token != null) {
      final data = {
        'medicine_type': type,
        'dose_medicine': name,
        'dose_amount': dose,
        'dose_time': '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
        'meal_yn': isBeforeMeal ? 'N' : 'Y',
      };

      final url = Uri.parse('${dotenv.env['BACKEND_URL']}/dose');

      try {
        final response = await http.post(
          url,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        );

        if (response.statusCode == 201) {
          print('약물 정보가 성공적으로 전송되었습니다.');
        } else {
          print('약물 정보 전송에 실패했습니다. 에러 코드: ${response.statusCode}');
        }
      } catch (error) {
        print('약물 저장 오류: $error');
      }
    } else {
      print('토큰 없음');
    }
  }
}

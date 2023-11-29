import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:cellu/styles.dart';
import 'package:cellu/screens/home_screen.dart';
import 'package:cellu/utils/user_token_manager.dart';
import 'package:cellu/widgets/lowerbar.dart';
import 'package:cellu/models/dose_schedule_model.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

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
  DateTime selectedDateTime = DateTime.now(); // 선택된 날짜와 시간을 저장할 변수
  bool isBeforeMeal = true;

  final FocusNode _typeFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _doseFocus = FocusNode();

  void _saveDrugData() {
    _sendDrugDataToServer(
      typeController.text,
      nameController.text,
      doseController.text,
      selectedDateTime,
      isBeforeMeal,
      context,
    );
  }

  void _sendDrugDataToServer(
    String type,
    String name,
    String dose,
    DateTime dateTime,
    bool isBeforeMeal,
    BuildContext context,
  ) async {
    final token = UserTokenManager.getToken();
    if (token != null) {
      final utcDateTime = dateTime.toUtc();
      final formattedDateTime =
          DateFormat('yyyy-MM-dd HH:mm').format(utcDateTime);

      final data = {
        'medicine_type': type,
        'dose_medicine': name,
        'dose_amount': dose,
        'dose_time': formattedDateTime,
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
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('약물 정보가 성공적으로 전송되었습니다.')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('약물 정보 전송에 실패했습니다.')));
        }
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('약물 저장 오류: $error')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('인증 토큰이 없습니다.')));
    }
  }

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
                  SizedBox(width: 30),
                  Container(
                    width: 150,
                    child: GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDateTime,
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(selectedDateTime),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              selectedDateTime = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.lightGreyOpacity20),
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.lightGreyOpacity20,
                        ),
                        child: Text(
                          DateFormat('yyyy-MM-dd HH:mm')
                              .format(selectedDateTime),
                          style: AppStyles.doseItemSubtitleStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
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
                focusNode: _typeFocus,
                controller: typeController,
                decoration: InputDecoration(
                  hintText: '약물 유형을 작성해주세요.',
                ),
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_nameFocus),
              ),
              SizedBox(height: 16),
              TextField(
                focusNode: _nameFocus,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: '약물 이름을 작성해주세요.',
                ),
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_doseFocus),
              ),
              SizedBox(height: 16),
              TextField(
                focusNode: _doseFocus,
                controller: doseController,
                decoration: InputDecoration(
                  hintText: '약물 용량을 작성해주세요.',
                ),
                onSubmitted: (_) => _saveDrugData(),
              ),
              SizedBox(height: 32),
              SaveButton(
                onSave: _saveDrugData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final VoidCallback onSave;

  SaveButton({required this.onSave});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onSave,
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
}

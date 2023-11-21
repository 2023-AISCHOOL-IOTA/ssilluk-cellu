//TODO: 약물관리페이지

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home_screen.dart';



class DrugManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drug Input',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[300],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
      home: DrugInputPage(),
    );
  }
}

class DrugInputPage extends StatefulWidget {
  @override
  _DrugInputPageState createState() => _DrugInputPageState();
}

class _DrugInputPageState extends State<DrugInputPage> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  final numberInputFormatter = FilteringTextInputFormatter.digitsOnly;
  bool isBeforeMeal = true; // 식전 여부를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // 뒤로 가기 버튼을 눌렀을 때 BioScreen으로 이동합니다.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        title: Text('약물 작성'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
              children: <Widget>[
                Container(
                  width: 150, // 시간 입력 필드의 너비
                  child: TimeInputField(hourController, minuteController, numberInputFormatter),
                ),
                SizedBox(width: 20), // 간격
                Container(
                  width: 150, // 식전/식후 선택 버튼의 너비
                  child: ToggleButtons(
                    children: <Widget>[
                      Text('식전'),
                      Text('식후'),
                    ],
                    isSelected: [isBeforeMeal, !isBeforeMeal],
                    onPressed: (int index) {
                      setState(() {
                        isBeforeMeal = index == 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 70), // 간격
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
            SaveButton(typeController, nameController, doseController, hourController, minuteController, isBeforeMeal),
          ],
        ),
      ),
    );
  }
}

class TimeInputField extends StatelessWidget {
  final TextEditingController hourController;
  final TextEditingController minuteController;
  final TextInputFormatter numberInputFormatter;

  TimeInputField(this.hourController, this.minuteController, this.numberInputFormatter);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 40,
          child: TextField(
            controller: hourController,
            decoration: InputDecoration(
              hintText: '시',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [numberInputFormatter, LengthLimitingTextInputFormatter(2)],
          ),
        ),
        Text(':'),
        Container(
          width: 40,
          child: TextField(
            controller: minuteController,
            decoration: InputDecoration(
              hintText: '분',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [numberInputFormatter, LengthLimitingTextInputFormatter(2)],
          ),
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  final TextEditingController typeController;
  final TextEditingController nameController;
  final TextEditingController doseController;
  final TextEditingController hourController;
  final TextEditingController minuteController;
  final bool isBeforeMeal;

  SaveButton(this.typeController, this.nameController, this.doseController, this.hourController, this.minuteController, this.isBeforeMeal);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // 버튼을 화면 가로 크기에 맞춤
      height: 60, // 버튼의 높이를 60으로 설정
      child: ElevatedButton(
        onPressed: () {
          // 저장 로직 구현
          print('약물 유형: ${typeController.text}');
          print('약물 이름: ${nameController.text}');
          print('약물 용량: ${doseController.text}');
          print('시간: ${hourController.text}:${minuteController.text}');
          print('식전/식후: ${isBeforeMeal ? "T" : "F"}');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 20), // 세로 패딩을 20으로 설정
        ),
        child: Text(
          '저장하기',
          style: TextStyle(fontSize: 20), // 버튼 텍스트 크기를 설정
        ),
      ),
    );
  }
}

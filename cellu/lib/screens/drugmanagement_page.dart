
import 'package:flutter/material.dart';

import 'biometrics_screen.dart';




void main() {
  runApp(DrugManagement());
}

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

class DrugInputPage extends StatelessWidget {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로 가기를 눌렀을 때 메인 페이지로 이동합니다.

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BioScreen()),
            );
          },
        ),
        title: Text('약물 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            SaveButton(typeController, nameController, doseController),
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final TextEditingController typeController;
  final TextEditingController nameController;
  final TextEditingController doseController;

  SaveButton(this.typeController, this.nameController, this.doseController);

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
          style: TextStyle(fontSize: 18), // 버튼 텍스트 크기를 설정
        ),
      ),
    );
  }
}

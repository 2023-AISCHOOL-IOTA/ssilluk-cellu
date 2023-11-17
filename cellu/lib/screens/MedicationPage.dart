import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MedicationPage(),
    );
  }
}

class MedicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AppBar의 높이를 가져옵니다.
    final appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 여기에 뒤로 가기 기능을 구현하세요.
          },
          color: Colors.black, // 아이콘 색상을 검은색으로 변경
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '약물 관리',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true, // 타이틀 가운데 정렬
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: appBarHeight), // AppBar 높이만큼 공간을 추가합니다.
              MyButton(title: '약물 작성하기'),
              SizedBox(height: 30), // 버튼 사이 간격을 더 넓혔습니다.
              MyButton(title: '약물 복용법'),
              SizedBox(height: 30), // 버튼 사이 간격을 더 넓혔습니다.
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;

  const MyButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50), // 버튼의 가로 길이와 간격을 조정합니다.
      width: double.infinity, // 전체 너비를 사용합니다.
      height: 60, // 버튼의 높이를 늘렸습니다.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
          elevation: 0,
        ),
        onPressed: () {
          // 여기에 버튼 클릭 시 수행할 기능을 구현하세요.
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16, // 기존의 글자 크기를 유지합니다.
          ),
        ),
      ),
    );
  }
}
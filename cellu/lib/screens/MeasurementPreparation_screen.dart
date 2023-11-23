// 측정기기연결하는 페이지입니다.
import 'package:flutter/material.dart';

class MeasurementPreparation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery를 사용하여 화면 크기를 가져옵니다.
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildConnectionText(screenSize),
            SizedBox(height: 10),
            _buildInstructionsText(),
            SizedBox(height: 30),
            _buildFingerprintIcon(screenSize),
            SizedBox(height: 30),
            _buildPercentageText(),
            SizedBox(height: 5),
            _buildStatusText(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
      title: Text(''),
      elevation: 0,
    );
  }

  Text _buildConnectionText(Size screenSize) {
    return Text(
      '기기 연결해주세요',
      style: TextStyle(
        fontSize: screenSize.width * 0.05, // 화면 너비에 따라 글자 크기를 조정합니다.
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildInstructionsText() {
    return Text(
      '휴대전화와 기기를 연결해주세요.\n( 여기에 간단한 연결 방법 들어갈 예정입니다. )',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    );
  }

  Icon _buildFingerprintIcon(Size screenSize) {
    return Icon(
      Icons.fingerprint,
      size: screenSize.width * 0.3, // 화면 너비에 따라 아이콘 크기를 조정합니다.
    );
  }

  Text _buildPercentageText() {
    return Text(
      '0%',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildStatusText() {
    return Text(
      '측정 준비 중',
      style: TextStyle(fontSize: 16),
    );
  }
}

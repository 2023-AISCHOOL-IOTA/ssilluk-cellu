// 해당 페이지는 측정 페이지에서 오류가 생겼을 때 사용하는 페이지 입니다.
// 혹시 오류부분 넣지 않으면 이부분이 굳이 필요할지는 몰라서
// 일단 그대로 두겠습니다!
import 'package:flutter/material.dart';

class MeasurementErrorPage extends StatelessWidget {
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
            _buildFingerprintIcon(screenSize), // 지문 아이콘 함수 호출
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
      '다시 측정해주세요',
      style: TextStyle(
        fontSize: screenSize.width * 0.05, // 화면 너비에 따라 글자 크기를 조정합니다.
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildInstructionsText() {
    return Text(
      '제대로 측정되지 않았습니다',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    );
  }

  Icon _buildFingerprintIcon(Size screenSize) {
    return Icon(
      Icons.fingerprint,
      size: screenSize.width * 0.3, // 화면 너비에 따라 아이콘 크기를 조정합니다.
      color: Colors.red, // 아이콘 색상을 빨간색으로 설정합니다.
    );
  }

  Text _buildPercentageText() {
    return Text(
      'ERROR',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildStatusText() {
    return Text(
      '측정 오류 발생',
      style: TextStyle(fontSize: 16),
    );
  }
}

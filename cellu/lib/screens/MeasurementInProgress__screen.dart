import 'package:flutter/material.dart';
import 'dart:async';

class MeasurementInProgress extends StatefulWidget {
  @override
  _MeasurementInProgressState createState() => _MeasurementInProgressState();
}

class _MeasurementInProgressState extends State<MeasurementInProgress>
    with SingleTickerProviderStateMixin {
  int _percentage = 0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  String selectedTimeOfDay = '아침'; // 측정 시기를 저장하는 변수
  String selectedMealTime = '식전'; // 식사 시간을 저장하는 변수

  // 측정 시기 선택을 위한 드롭다운 메뉴 아이템 리스트
  final List<String> timeOfDayOptions = ['아침', '점심', '저녁', '야간'];

  // 식사 시간 선택을 위한 드롭다운 메뉴 아이템 리스트
  final List<String> mealTimeOptions = ['식전', '식후'];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_animationController);

    _startMeasurement();
  }

  void _startMeasurement() {
    const oneSec = Duration(seconds: 1);
    int maxSeconds = 65; // 65초 동안 작동하도록 설정

    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_percentage < 100) {
        setState(() {
          // 65초 동안 100%에 도달하도록 _percentage 증가 비율 조정
          _percentage = ((timer.tick / maxSeconds) * 100).clamp(0, 100).toInt();
        });
      } else {
        _timer?.cancel();
        _animationController.stop();
        setState(() {
          // 측정 완료 시 색상을 검정색으로 변경
          _colorAnimation = AlwaysStoppedAnimation<Color?>(Colors.black);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _sendDataToServer() async {
    // 여기에 HTTP POST 요청 로직을 구현합니다.
    // 예를 들어, http.post 함수를 사용할 수 있습니다.
    // var response = await http.post(
    //   Uri.parse('https://your-backend-api.com/data'),
    //   body: {
    //     'timeOfDay': selectedTimeOfDay,
    //     'mealTime': selectedMealTime,
    //   },
    // );
    // 결과 처리 로직...
  }

  // 드롭다운 메뉴와 저장 버튼을 포함하는 위젯을 만듭니다.
  Widget _buildDropdownWithSaveButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 두 드롭다운을 빌드하는 메서드는 여기서 호출하지 않습니다.
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            _sendDataToServer();
          },
          child: Text('저장'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            // 버튼 배경색을 파란색으로 설정
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            // 패딩 설정
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
            _buildAnimatedFingerprintIcon(screenSize),
            SizedBox(height: 30),
            _buildPercentageText(),
            SizedBox(height: 5),
            _buildStatusText(),
            SizedBox(
              height: 30,
            ),
            if (_percentage == 100) ...[
              _buildTimeOfDayDropdown(),
              _buildMealTimeDropdown(),
              SizedBox(height: 20),
              _buildDropdownWithSaveButton(), // 여기서 드롭다운과 저장 버튼을 모두 빌드합니다.
            ],
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
      _percentage < 100 ? '기기 위에 손을 올려주세요' : '측정이 완료되었습니다',
      style: TextStyle(
        fontSize: screenSize.width * 0.05,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildInstructionsText() {
    return Text(
      _percentage < 100 ? '움직이시면 측정값이 올바르지 않을 수 있습니다.' : '측정 완료',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildAnimatedFingerprintIcon(Size screenSize) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Icon(
          Icons.fingerprint,
          size: screenSize.width * 0.3,
          color: _colorAnimation.value,
        );
      },
    );
  }

  Text _buildPercentageText() {
    return Text(
      '$_percentage%',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildStatusText() {
    return Text(
      _percentage < 100 ? '측정중...' : '측정 시기를 선택해주세요',
      style: TextStyle(fontSize: 16),
    );
  }

  // NOTE : 측정 시기 선택 드롭다운 메뉴
  Widget _buildTimeOfDayDropdown() {
    return DropdownButton<String>(
      value: selectedTimeOfDay,
      onChanged: (String? newValue) {
        setState(() {
          selectedTimeOfDay = newValue!;
        });
      },
      items: timeOfDayOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 20)), // 폰트 크기 조정
        );
      }).toList(),
      itemHeight: 60, // 드롭다운 항목의 높이 설정
    );
  }

  // NP식사 시간 선택 드롭다운 메뉴
  Widget _buildMealTimeDropdown() {
    return DropdownButton<String>(
      value: selectedMealTime,
      onChanged: (String? newValue) {
        setState(() {
          selectedMealTime = newValue!;
        });
      },
      items: mealTimeOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 20)), // 폰트 크기 조정
        );
      }).toList(),
      itemHeight: 60, // 드롭다운 항목의 높이 설정
    );
  }
}

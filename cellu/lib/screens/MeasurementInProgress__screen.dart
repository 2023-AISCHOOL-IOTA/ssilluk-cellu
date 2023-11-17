import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: MeasurementInProgress(),
    );
  }
}

class MeasurementInProgress extends StatefulWidget {
  @override
  _MeasurementInProgressState  createState() => _MeasurementInProgressState();
}

class _MeasurementInProgressState  extends State<MeasurementInProgress> with SingleTickerProviderStateMixin {
  int _percentage = 0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

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
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_percentage < 100) {
        setState(() {
          _percentage++;
        });
      } else {
        _timer?.cancel();
        _animationController.stop();
        setState(() {
          // 측정 완료 시 색상을 보라색으로 변경
          _colorAnimation = AlwaysStoppedAnimation<Color?>(Colors.purple);
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
      '기기 위에 손을 올려주세요',
      style: TextStyle(
        fontSize: screenSize.width * 0.05,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildInstructionsText() {
    return Text(
      '움직이시면 측정값이 올바르지 않을 수 있습니다.',
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
      _percentage < 100 ? '측정중...' : '측정 완료',
      style: TextStyle(fontSize: 16),
    );
  }
}

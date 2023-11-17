
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_text_field.dart';
import '../styles.dart';


class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _changePassword() {
    // 비밀번호 변경 로직 구현
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // 배경색 설정
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),

        title: SvgPicture.asset('assets/logo-small.svg', height: 60),
        // 로고 이미지
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 적용
              ),
              elevation: 7.0, // 카드 그림자
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 기본적으로 왼쪽 정렬 유지
                    children: <Widget>[
                      Center( // '비밀번호 변경' 텍스트를 Center 위젯으로 감싸서 가운데 정렬
                        child: Text(
                          '비밀번호 변경',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // 텍스트 내용 가운데 정렬
                        ),
                      ),
                      SizedBox(height: 20),
                      ..._buildTextFormField(_emailController, '이메일', 'Email', false, Icons.email),
                      ..._buildTextFormField(_currentPasswordController, '현재 비밀번호', 'Password', true, Icons.lock_outline),
                      ..._buildTextFormField(_newPasswordController, '새로운 비밀번호', 'Confirm Password', true, Icons.lock_outline),
                      ..._buildTextFormField(_confirmNewPasswordController, '새로운 비밀번호 확인', 'Confirm Password', true, Icons.lock_outline),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _changePassword,
                        child: Text('변경하기'),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor, // 버튼 색상
                          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), // 버튼 둥근 모서리
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Text('비밀번호를 다시 확인 바랍니다', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 텍스트 필드를 구성하는 메소드를 만듭니다.
  List<Widget> _buildTextFormField(TextEditingController controller, String label, String hint, bool obscure, IconData icon) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 23.0),
        child: Text(label, style: TextStyle(fontSize: 16)),
      ),
      TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(icon),
            onPressed: () {
              // 아이콘 버튼 기능 추가
            },
          ),
        ),
      ),
    ];
  }
}
// // import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../widgets/custom_text_field.dart';
// import '../styles.dart';
//
//
// class PasswordChangeScreen extends StatefulWidget {
//   @override
//   _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
// }
//
// class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _currentPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmNewPasswordController = TextEditingController();
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   void _changePassword() {
//     // 비밀번호 변경 로직 구현
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: SvgPicture.asset('assets/logo-small.svg'), // 로고 이미지 경로 확인 필요
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 elevation: 10,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           labelText: '이메일',
//                           hintText: 'Email',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           suffixIcon: Icon(Icons.email),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _currentPasswordController,
//                         decoration: InputDecoration(
//                           labelText: '현재 비밀번호',
//                           hintText: 'Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           suffixIcon: Icon(Icons.lock_outline),
//                         ),
//                         obscureText: true,
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _newPasswordController,
//                         decoration: InputDecoration(
//                           labelText: '새로운 비밀번호',
//                           hintText: 'Confirm Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           suffixIcon: Icon(Icons.lock_outline),
//                         ),
//                         obscureText: true,
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _confirmNewPasswordController,
//                         decoration: InputDecoration(
//                           labelText: '새로운 비밀번호 확인',
//                           hintText: 'Confirm Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           suffixIcon: Icon(Icons.lock_outline),
//                         ),
//                         obscureText: true,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: _changePassword,
//                 child: Text('변경하기'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue,
//                   padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
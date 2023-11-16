
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_text_field.dart';
import '../styles.dart';

enum Gender { male, female }
enum DiabetesType { type1, type2, gestational, none }

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Gender? gender = Gender.male;
  DiabetesType? diabetesType = DiabetesType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset('assets/logo-small.svg', height: 60), // 로고 이미지
            SizedBox(height: 40),
            Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: '생년월일',
                          hint: 'YY.MM.DD',
                          obscureText: false,
                          prefixIcon: Icons.calendar_today,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      SizedBox(height: 10),

                      Expanded(
                        child: Column(
                          children: [
                            RadioListTile<Gender>(
                              title: const Text('남'),
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                            RadioListTile<Gender>(
                              title: const Text('여'),
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: '키 (cm)',
                          hint: '',
                          obscureText: false,
                          prefixIcon: Icons.straighten,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          label: '몸무게 (kg)',
                          hint: '',
                          obscureText: false,
                          prefixIcon: Icons.monitor_weight,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      RadioListTile<DiabetesType>(
                        title: const Text('제1형'),
                        value: DiabetesType.type1,
                        groupValue: diabetesType,
                        onChanged: (DiabetesType? value) {
                          setState(() {
                            diabetesType = value;
                          });
                        },
                      ),
                      RadioListTile<DiabetesType>(
                        title: const Text('제2형'),
                        value: DiabetesType.type2,
                        groupValue: diabetesType,
                        onChanged: (DiabetesType? value) {
                          setState(() {
                            diabetesType = value;
                          });
                        },
                      ),
                      RadioListTile<DiabetesType>(
                        title: const Text('기타'),
                        value: DiabetesType.gestational,
                        groupValue: diabetesType,
                        onChanged: (DiabetesType? value) {
                          setState(() {
                            diabetesType = value;
                          });
                        },
                      ),
                      RadioListTile<DiabetesType>(
                        title: const Text('없음'),
                        value: DiabetesType.none,
                        groupValue: diabetesType,
                        onChanged: (DiabetesType? value) {
                          setState(() {
                            diabetesType = value;
                          });
                        },
                      ),
                    ],
                  ),
                  CustomTextField(
                    label: '보호자 추가 (선택 사항)',
                    hint: '특수문자 제외 번호만 입력하세요',
                    obscureText: false,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    ),
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('저장되었습니다'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('확인'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('저장하기'),
                  ),
                ],
              ),
            ),
            )],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../widgets/custom_text_field.dart';
// import '../styles.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   String gender = '남';
//   String diabetesType = '없음';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         // ... AppBar 설정 ...
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(AppDimensions.pagePaddingHorizontal),
//             child: Column(
//               children: <Widget>[
//                 SvgPicture.asset('assets/logo.svg', height: 100), // 로고 이미지 추가
//                 SizedBox(height: 40), // 로고와 입력 필드 사이 간격
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200], // 또는 이미지에 맞는 색상으로 설정
//                     borderRadius: BorderRadius.circular(10), // 컨테이너의 모서리를 둥글게
//                   ),
//                   child: Column(
//                     children: [
//                       CustomTextField(
//                         label: '생년월일',
//                         hint: 'YY.MM.DD',
//                         obscureText: false,
//                         prefixIcon: Icons.calendar_today,
//                         keyboardType: TextInputType.datetime,
//                       ),
//                       SizedBox(height: 20),
//                       DropdownButtonFormField(
//                         value: gender,
//                         items: ['남', '여']
//                             .map((label) => DropdownMenuItem(
//                                   child: Text(label),
//                                   value: label,
//                                 ))
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() => gender = value ?? '남');
//                         },
//                         decoration: InputDecoration(
//                           labelText: '성별',
//                           prefixIcon: Icon(Icons.person),
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       CustomTextField(
//                         label: '키 (cm)',
//                         hint: '',
//                         obscureText: false,
//                         prefixIcon: Icons.height,
//                         keyboardType: TextInputType.number,
//                       ),
//                       SizedBox(height: 20),
//                       CustomTextField(
//                         label: '몸무게 (kg)',
//                         hint: '',
//                         obscureText: false,
//                         prefixIcon: Icons.line_weight,
//                         keyboardType: TextInputType.number,
//                       ),
//                       SizedBox(height: 20),
//                       DropdownButtonFormField(
//                         value: diabetesType,
//                         items: ['제1형', '제2형', '기타', '없음']
//                             .map((label) => DropdownMenuItem(
//                                   child: Text(label),
//                                   value: label,
//                                 ))
//                             .toList(),
//                         onChanged: (value) {
//                           setState(() => diabetesType = value ?? '없음');
//                         },
//                         decoration: InputDecoration(
//                           labelText: '당뇨 유형',
//                           prefixIcon: Icon(Icons.healing),
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       CustomTextField(
//                         label: '보호자 추가 (선택 사항)',
//                         hint: '특수문자 제외 번호만 입력하세요',
//                         obscureText: false,
//                         prefixIcon: Icons.phone,
//                         keyboardType: TextInputType.number,
//                       ),
//                       SizedBox(height: 40),
//                       // 성별, 키, 몸무게, 당뇨 유형, 보호자 추가 필드 추가
//                       // ...
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: AppColors.primaryColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 80, vertical: 15),
//                         ),
//                         onPressed: () {
// //
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 content: Text('저장되었습니다'),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     child: Text('확인'),
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                         child: Text('저장하기'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

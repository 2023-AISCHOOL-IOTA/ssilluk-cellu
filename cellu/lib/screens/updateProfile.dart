import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_text_field.dart';
import '../styles.dart';

enum Gender { male, female }

enum DiabetesType { type1, type2,none }
// enum DiabetesType { type1, type2, gestational, none } 가로 간격 때문에 기타 삭제 위해 임시 처리

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
        child: Column(children: <Widget>[
          SvgPicture.asset('assets/logo-small.svg', height: 60),
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!, width: 1),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '내 정보 수정',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 라벨 행
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '생년월일',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '성별',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // 입력 필드 및 라디오 버튼 행
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              label: '',
                              hint: 'YY.MM.DD',
                              obscureText: false,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!, width: 1),
                                borderRadius: BorderRadius.circular(12), // CustomTextField의 테두리 반경과 일치
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Radio(
                                      value: Gender.male,
                                      groupValue: gender,
                                      onChanged: (Gender? value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const Text('남'),
                                  Expanded(
                                    child: Radio(
                                      value: Gender.female,
                                      groupValue: gender,
                                      onChanged: (Gender? value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const Text('여'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '키 (cm)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),

                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '몸무게 (kg)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // 키와 몸무게 입력 필드 행
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              label: '',
                              hint: 'cm',
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 10), // 필드 간격 조정
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              label: '',
                              hint: 'kg',
                              obscureText: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        '당뇨 유형',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
// 당뇨 유형 라디오 버튼
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: DiabetesType.values.map((type) {
                            String text = '';
                            switch (type) {
                              case DiabetesType.type1:
                                text = '제1형';
                                break;
                              case DiabetesType.type2:
                                text = '제2형';
                                break;
                              case DiabetesType.none:
                                text = '없음';
                                break;
                            }
                            return Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<DiabetesType>(
                                    value: type,
                                    groupValue: diabetesType,
                                    onChanged: (DiabetesType? value) {
                                      setState(() {
                                        diabetesType = value;
                                      });
                                    },
                                  ),
                                  Text(text),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: 20),
// 보호자 추가 라벨
                      Text(
                        '보호자 추가 | 선택 사항 |',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
// 보호자 추가 입력 필드
                      CustomTextField(
                        label: '',
                        hint: '특수문자 제외 번호만 입력하세요',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../widgets/custom_text_field.dart';
// import '../styles.dart';
//
// enum Gender { male, female }
// enum DiabetesType { type1, type2, gestational, none }
//
// class EditProfileScreen extends StatefulWidget {
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   Gender? gender = Gender.male;
//   DiabetesType? diabetesType = DiabetesType.none;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SvgPicture.asset('assets/logo-small.svg', height: 60), // 로고 이미지
//             SizedBox(height: 40),
//             Card(
//               margin: EdgeInsets.all(20),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomTextField(
//                           label: '생년월일',
//                           hint: 'YY.MM.DD',
//                           obscureText: false,
//                           prefixIcon: Icons.calendar_today,
//                           keyboardType: TextInputType.datetime,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//
//                       Expanded(
//                         child: Column(
//                           children: [
//                             RadioListTile<Gender>(
//                               title: const Text('남'),
//                               value: Gender.male,
//                               groupValue: gender,
//                               onChanged: (Gender? value) {
//                                 setState(() {
//                                   gender = value;
//                                 });
//                               },
//                             ),
//                             RadioListTile<Gender>(
//                               title: const Text('여'),
//                               value: Gender.female,
//                               groupValue: gender,
//                               onChanged: (Gender? value) {
//                                 setState(() {
//                                   gender = value;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomTextField(
//                           label: '키 (cm)',
//                           hint: '',
//                           obscureText: false,
//                           prefixIcon: Icons.straighten,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: CustomTextField(
//                           label: '몸무게 (kg)',
//                           hint: '',
//                           obscureText: false,
//                           prefixIcon: Icons.monitor_weight,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       RadioListTile<DiabetesType>(
//                         title: const Text('제1형'),
//                         value: DiabetesType.type1,
//                         groupValue: diabetesType,
//                         onChanged: (DiabetesType? value) {
//                           setState(() {
//                             diabetesType = value;
//                           });
//                         },
//                       ),
//                       RadioListTile<DiabetesType>(
//                         title: const Text('제2형'),
//                         value: DiabetesType.type2,
//                         groupValue: diabetesType,
//                         onChanged: (DiabetesType? value) {
//                           setState(() {
//                             diabetesType = value;
//                           });
//                         },
//                       ),
//                       RadioListTile<DiabetesType>(
//                         title: const Text('기타'),
//                         value: DiabetesType.gestational,
//                         groupValue: diabetesType,
//                         onChanged: (DiabetesType? value) {
//                           setState(() {
//                             diabetesType = value;
//                           });
//                         },
//                       ),
//                       RadioListTile<DiabetesType>(
//                         title: const Text('없음'),
//                         value: DiabetesType.none,
//                         groupValue: diabetesType,
//                         onChanged: (DiabetesType? value) {
//                           setState(() {
//                             diabetesType = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                   CustomTextField(
//                     label: '보호자 추가 (선택 사항)',
//                     hint: '특수문자 제외 번호만 입력하세요',
//                     obscureText: false,
//                     prefixIcon: Icons.phone,
//                     keyboardType: TextInputType.number,
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Theme.of(context).primaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                     ),
//                     onPressed: () {
//
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             content: Text('저장되었습니다'),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: Text('확인'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Text('저장하기'),
//                   ),
//                 ],
//               ),
//             ),
//             )],
//         ),
//       ),
//     );
//   }
// }

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

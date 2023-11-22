import 'package:flutter/material.dart';

class BioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 850,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
          child: Stack(
            children: [
              Positioned(
                left: 168,
                top: 72,
                child: Container(
                  width: 58,
                  height: 37,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 1,
                        top: 6,
                        child: Container(
                          width: 57,
                          height: 31,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 18,
                                top: 6,
                                child: SizedBox(
                                  width: 39,
                                  height: 22,
                                  child: Text(
                                    'ellu',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 16,
                          height: 10,
                          child: Stack(children: []),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -8,
                top: 109,
                child: Container(
                  width: 409,
                  height: 95,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 23,
                        top: 0,
                        child: Container(
                          width: 361,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 2,
                                child: Container(
                                  width: 57,
                                  height: 20,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 1,
                                        child: SizedBox(
                                          width: 37,
                                          height: 18,
                                          child: Text(
                                            '10월',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 37,
                                        top: 0,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.50, vertical: 1.67),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 15,
                                                height: 16.67,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://via.placeholder.com/15x17"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 274,
                                top: 0,
                                child: Container(
                                  width: 87,
                                  height: 24,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 23.92,
                                        top: 2,
                                        child: SizedBox(
                                          width: 63.08,
                                          height: 19.50,
                                          child: Text(
                                            '업데이트',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 5),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 16,
                                                height: 14,
                                                child: Stack(children: []),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        top: 30,
                        child: Container(
                          width: 400,
                          height: 31,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 3,
                                top: 1,
                                child: Container(
                                  width: 390,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0x4F666666),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 31,
                                child: Container(
                                  width: 400,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0x4F666666),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 30,
                        child: Container(
                          width: 409,
                          height: 65,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 1,
                                top: 32,
                                child: Container(
                                  width: 407,
                                  height: 33,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 330,
                                          height: 33,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 74,
                                                top: 0,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Color(
                                                                0x001C2852),
                                                            shape: OvalBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 2,
                                                        top: 4,
                                                        child: SizedBox(
                                                          width: 26,
                                                          height: 14,
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '164\n',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FEE7878),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: '100',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 222,
                                                top: 3,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Color(
                                                                0xFF1F213D),
                                                            shape: OvalBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 2,
                                                        top: 4,
                                                        child: SizedBox(
                                                          width: 26,
                                                          height: 14,
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '160\n',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFEE7878),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: '95',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 148,
                                                top: 3,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Color(
                                                                0x001C2852),
                                                            shape: OvalBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 2,
                                                        top: 1,
                                                        child: SizedBox(
                                                          width: 26,
                                                          height: 14,
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '156\n',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FEE7878),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: '90',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 300,
                                                top: 0,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Color(
                                                                0x001C2852),
                                                            shape: OvalBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 8,
                                                        child: SizedBox(
                                                          width: 29,
                                                          height: 14,
                                                          child: Text(
                                                            '0',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xB2846F6F),
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Color(
                                                                0x001C2852),
                                                            shape: OvalBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 3,
                                                        top: 4,
                                                        child: SizedBox(
                                                          width: 26,
                                                          height: 15,
                                                          child: Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '170\n',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FEE7878),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: '95',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontSize: 9,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 377,
                                        top: 0,
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0x001C2852),
                                                    shape: OvalBorder(),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 1,
                                                top: 8,
                                                child: SizedBox(
                                                  width: 29,
                                                  height: 14,
                                                  child: Text(
                                                    '0',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xB2846F6F),
                                                      fontSize: 10,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 409,
                                  height: 29,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34,
                                          height: 29,
                                          child: Text(
                                            '22',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 74,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34,
                                          height: 29,
                                          child: Text(
                                            '23',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 148,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34,
                                          height: 29,
                                          child: Text(
                                            '24',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 222,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34,
                                          height: 29,
                                          child: Text(
                                            '25',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 301,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34,
                                          height: 29,
                                          child: Text(
                                            '26',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 375,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34,
                                          height: 29,
                                          child: Text(
                                            '27',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 265,
                child: Container(
                  width: 353,
                  height: 715,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 561,
                child: Container(
                  width: 325,
                  height: 66,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 325,
                          height: 66,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 325,
                                  height: 66,
                                  decoration: ShapeDecoration(
                                    color: Color(0x66D9D9D9),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.black
                                            .withOpacity(0.2800000011920929),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 243.50,
                                top: 12,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.57),
                                  child: Container(
                                    width: 48,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0x33999999),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 80.50,
                                top: 12,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.57),
                                  child: Container(
                                    width: 48,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0x33999999),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 162,
                                top: 12,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.57),
                                  child: Container(
                                    width: 48,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0x33999999),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 12,
                        child: Container(
                          width: 304,
                          height: 16,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 164,
                                top: 0,
                                child: SizedBox(
                                  width: 67,
                                  height: 16,
                                  child: Text(
                                    '식후 평균 혈당',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 67,
                                  height: 16,
                                  child: Text(
                                    '최고 혈당',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 82,
                                top: 0,
                                child: SizedBox(
                                  width: 67,
                                  height: 16,
                                  child: Text(
                                    '식전 평균 혈당',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 237,
                                top: 0,
                                child: SizedBox(
                                  width: 67,
                                  height: 16,
                                  child: Text(
                                    '최저 혈당',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 28,
                        child: Container(
                          width: 301,
                          height: 26,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 64,
                                  height: 26,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '160',
                                          style: TextStyle(
                                            color: Color(0xFFFF4646),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' mg/dL',
                                          style: TextStyle(
                                            color: Color(0xFF1B1B1B),
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 237,
                                top: 0,
                                child: SizedBox(
                                  width: 64,
                                  height: 26,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '95',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' mg/dL',
                                          style: TextStyle(
                                            color: Color(0xFF1B1B1B),
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 172,
                        top: 28,
                        child: SizedBox(
                          width: 64,
                          height: 26,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '150',
                                  style: TextStyle(
                                    color: Color(0xFFFF4646),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' mg/dL',
                                  style: TextStyle(
                                    color: Color(0xFF1B1B1B),
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 28,
                        child: SizedBox(
                          width: 64,
                          height: 26,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '110',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' mg/dL',
                                  style: TextStyle(
                                    color: Color(0xFF1B1B1B),
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 63.12,
                top: 405.35,
                child: Container(
                  width: 288.23,
                  height: 80.44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFF7486F3),
                        Color(0xEC1A35DD),
                        Color(0xDE1A35DD),
                        Color(0x001A35DD)
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 63.73,
                top: 289,
                child: Container(
                  width: 287.88,
                  height: 232.11,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 287.62,
                        top: 38.64,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287.62,
                        top: 77.22,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287.62,
                        top: 115.79,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287.62,
                        top: 154.36,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287.62,
                        top: 192.93,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287.62,
                        top: 231.50,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287.88,
                        top: 0,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(3.14),
                          child: Container(
                            width: 287.62,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 257,
                child: Container(
                  width: 312.59,
                  height: 277.69,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 34,
                          height: 266,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '260\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 1,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' \n\n\n\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '220\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n\n\n \n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 1,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' \n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '180\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n140\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '100\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n\n \n\n\n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '60\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' \n\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n30',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30.50,
                        top: 268.59,
                        child: SizedBox(
                          width: 282.09,
                          height: 9.11,
                          child: Text(
                            '0시      4시       8시       12시       16시       20시       23시',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 60.85,
                top: 375.52,
                child: Container(
                  width: 254.13,
                  height: 79.54,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 60.13,
                        top: 0,
                        child: Container(
                          width: 194,
                          height: 79.54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 141,
                                top: -0,
                                child: Container(
                                  width: 8.24,
                                  height: 8.13,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF0000),
                                    shape:
                                        OvalBorder(side: BorderSide(width: 2)),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 180.94,
                                top: 32.54,
                                child: Container(
                                  width: 13.06,
                                  height: 12.65,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2.80,
                                        top: 2.71,
                                        child: Container(
                                          width: 6.53,
                                          height: 6.33,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF00FFFF),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 654,
                child: Container(
                  width: 314,
                  height: 299,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 313,
                          height: 298,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 313,
                                  height: 298,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 40.28,
                                        child: Container(
                                          width: 312.09,
                                          height: 257.72,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 312.09,
                                                  height: 257.72,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 312.09,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                width: 0.80,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignCenter,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.10000000149011612),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 64.63,
                                                        child: Container(
                                                          width: 312.09,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                width: 0.80,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignCenter,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.10000000149011612),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 129.26,
                                                        child: Container(
                                                          width: 312.09,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                width: 0.80,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignCenter,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.10000000149011612),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 193.89,
                                                        child: Container(
                                                          width: 312.09,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                width: 0.80,
                                                                strokeAlign:
                                                                    BorderSide
                                                                        .strokeAlignCenter,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.10000000149011612),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 135.57,
                                                top: 12.18,
                                                child: Container(
                                                  width: 40.94,
                                                  height: 236.04,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 40.94,
                                                          height: 106.78,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 40.94,
                                                                  height: 42.15,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    color: Color(
                                                                        0xFFFF6B6B),
                                                                    shape:
                                                                        OvalBorder(),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: -0,
                                                                top: 64.63,
                                                                child:
                                                                    Container(
                                                                  width: 40.94,
                                                                  height: 42.15,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    color: Color(
                                                                        0xFFFFB700),
                                                                    shape:
                                                                        OvalBorder(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: -0,
                                                        top: 68.38,
                                                        child: Container(
                                                          width: 40.94,
                                                          height: 167.66,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 9.10,
                                                                top: -0,
                                                                child:
                                                                    Container(
                                                                  width: 21.84,
                                                                  height: 22.48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          1.82,
                                                                      vertical:
                                                                          1.87),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [],
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: -0,
                                                                top: 60.88,
                                                                child:
                                                                    Container(
                                                                  width: 40.94,
                                                                  height: 42.15,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    color: Color(
                                                                        0xFF565656),
                                                                    shape:
                                                                        OvalBorder(),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: -0,
                                                                top: 125.51,
                                                                child:
                                                                    Container(
                                                                  width: 40.94,
                                                                  height: 42.15,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    color: Color(
                                                                        0xFF8E00FE),
                                                                    shape:
                                                                        OvalBorder(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 10.01,
                                                        top: 5.62,
                                                        child: Container(
                                                          width: 21.84,
                                                          height: 215.44,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: -0,
                                                                top: 192.96,
                                                                child:
                                                                    Container(
                                                                  width: 21.84,
                                                                  height: 22.48,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    top: 3.85,
                                                                    left: 3.64,
                                                                    right: 3.74,
                                                                    bottom:
                                                                        3.75,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [],
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 0.91,
                                                                top: -0,
                                                                child:
                                                                    Container(
                                                                  width: 20.02,
                                                                  height: 20.61,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    top: 2.58,
                                                                    left: 1.67,
                                                                    right: 1.67,
                                                                    bottom:
                                                                        3.43,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 6.37,
                                                        top: 26.23,
                                                        child: Container(
                                                          width: 28.21,
                                                          height: 207,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child: SizedBox(
                                                                  width: 27.30,
                                                                  height: 14.99,
                                                                  child: Text(
                                                                    '아침',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          9,
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height: 0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: -0,
                                                                top: 62.76,
                                                                child: SizedBox(
                                                                  width: 27.30,
                                                                  height: 14.99,
                                                                  child: Text(
                                                                    '점심',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          9,
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height: 0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 0.91,
                                                                top: 129.26,
                                                                child: SizedBox(
                                                                  width: 27.30,
                                                                  height: 14.99,
                                                                  child: Text(
                                                                    '저녁',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          9,
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height: 0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 0.91,
                                                                top: 192.02,
                                                                child: SizedBox(
                                                                  width: 27.30,
                                                                  height: 14.99,
                                                                  child: Text(
                                                                    '밤',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          9,
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      height: 0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 3.64,
                                                                top: 107.72,
                                                                child:
                                                                    Container(
                                                                  width: 21.84,
                                                                  height: 22.48,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          1.82,
                                                                      vertical:
                                                                          1.87),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 1,
                                        top: -0,
                                        child: Container(
                                          width: 312,
                                          height: 40.28,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0.82,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 155.59,
                                                  height: 40.28,
                                                  child: Text(
                                                    '식전',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 156.41,
                                                top: 0,
                                                child: SizedBox(
                                                  width: 155.59,
                                                  height: 40.28,
                                                  child: Text(
                                                    '식후',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.82,
                                top: 39.34,
                                child: Container(
                                  width: 305.72,
                                  height: 194.83,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 130.20,
                                        child: SizedBox(
                                          width: 151.04,
                                          height: 64.63,
                                          child: Text(
                                            '125 mg/dL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 64.63,
                                        child: SizedBox(
                                          width: 151.04,
                                          height: 64.63,
                                          child: Text(
                                            '110 mg/dL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 2.81,
                                        child: SizedBox(
                                          width: 151.04,
                                          height: 64.63,
                                          child: Text(
                                            '95 mg/dL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 154.68,
                                        top: 0,
                                        child: SizedBox(
                                          width: 151.04,
                                          height: 64.63,
                                          child: Text(
                                            '140 mg/dL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 154.68,
                                        top: 67.44,
                                        child: SizedBox(
                                          width: 151.04,
                                          height: 64.63,
                                          child: Text(
                                            '150 mg/dL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 154.68,
                                        top: 130.20,
                                        child: SizedBox(
                                          width: 151.04,
                                          height: 64.63,
                                          child: Text(
                                            '160 mg/dL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 51.83,
                        top: 251.05,
                        child: Container(
                          width: 207.34,
                          height: 33.34,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 33.89,
                                  height: 33.34,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 33.89,
                                          height: 33.34,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(
                                              side: BorderSide(
                                                width: 2,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                                color: Color(0x66606060),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 9.97,
                                        top: 0,
                                        child: SizedBox(
                                          width: 13.96,
                                          height: 30.40,
                                          child: Text(
                                            '+',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0x99606060),
                                              fontSize: 20,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 173.45,
                                top: 0,
                                child: Container(
                                  width: 33.89,
                                  height: 33.34,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 33.89,
                                          height: 33.34,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(
                                              side: BorderSide(
                                                width: 2,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                                color: Color(0x66606060),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 9.97,
                                        top: 0,
                                        child: SizedBox(
                                          width: 13.96,
                                          height: 30.40,
                                          child: Text(
                                            '+',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0x99606060),
                                              fontSize: 20,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 221,
                child: Container(
                  width: 315,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 315,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFF363636),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 8,
                        child: SizedBox(
                          width: 285,
                          height: 20,
                          child: Text(
                            '혈당 수치',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 1024,
                child: Container(
                  width: 315,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 315,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF5E84),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 8,
                        child: SizedBox(
                          width: 285,
                          height: 20,
                          child: Text(
                            '심박도',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 1320,
                child: Container(
                  width: 315,
                  height: 36,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 315,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF675E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 8,
                        child: SizedBox(
                          width: 285,
                          height: 20,
                          child: Text(
                            '스트레스 수치',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 257,
                top: 1097,
                child: Container(
                  width: 84,
                  height: 88,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/84x88"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 250,
                top: 1185,
                child: Container(
                  height: 68,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 98,
                          height: 56,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '84',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFFF55557),
                                    fontSize: 22,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'bpm',
                                  style: TextStyle(
                                    color: Color(0xFFF55557),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 56,
                        child: SizedBox(
                          width: 64,
                          height: 12,
                          child: Text(
                            '평균 심박도',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.4000000059604645),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 1102,
                child: Container(
                  width: 190,
                  height: 146,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 190,
                          height: 142,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                top: 8,
                                child: Container(
                                  width: 168,
                                  height: 127,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 1,
                                        top: 127,
                                        child: Container(
                                          width: 167,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 66,
                                        child: Container(
                                          width: 167,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 1,
                                        top: 0,
                                        child: Container(
                                          width: 167,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 45,
                                        child: Container(
                                          width: 167,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                                color: Colors.black.withOpacity(
                                                    0.10000000149011612),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 1,
                                        top: 109,
                                        child: Container(
                                          width: 167,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                                color: Colors.black.withOpacity(
                                                    0.10000000149011612),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 127,
                                child: SizedBox(
                                  width: 17,
                                  height: 15,
                                  child: Text(
                                    '60',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 63,
                                child: SizedBox(
                                  width: 17,
                                  height: 15,
                                  child: Text(
                                    '75',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 17,
                                  height: 15,
                                  child: Text(
                                    '90',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 37,
                        top: 15,
                        child: Container(
                          width: 132,
                          height: 119,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 19,
                                child: Container(
                                  width: 12,
                                  height: 100,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB5959),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                top: 40,
                                child: Container(
                                  width: 12,
                                  height: 79,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB5959),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 48,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 119,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB5959),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 72,
                                top: 8,
                                child: Container(
                                  width: 12,
                                  height: 111,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB5959),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 96,
                                top: 23,
                                child: Container(
                                  width: 12,
                                  height: 96,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB5959),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 120,
                                top: 40,
                                child: Container(
                                  width: 12,
                                  height: 79,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEB5959),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 33,
                        top: 137,
                        child: Container(
                          width: 135,
                          height: 9,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 13,
                                  height: 9,
                                  child: Text(
                                    '84',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 23,
                                top: 0,
                                child: SizedBox(
                                  width: 13,
                                  height: 9,
                                  child: Text(
                                    '79',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 49,
                                top: 0,
                                child: SizedBox(
                                  width: 13,
                                  height: 9,
                                  child: Text(
                                    '88',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 74,
                                top: 0,
                                child: SizedBox(
                                  width: 13,
                                  height: 9,
                                  child: Text(
                                    '86',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 97,
                                top: 0,
                                child: SizedBox(
                                  width: 13,
                                  height: 9,
                                  child: Text(
                                    '83',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 122,
                                top: 0,
                                child: SizedBox(
                                  width: 13,
                                  height: 9,
                                  child: Text(
                                    '84',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 1383,
                child: Container(
                  width: 345,
                  height: 201,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 345,
                          height: 201,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 26,
                                top: 19,
                                child: Container(
                                  width: 190,
                                  height: 163,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 22,
                                        top: 74,
                                        child: Container(
                                          width: 168,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0x7C0084FF)),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 190,
                                          height: 163,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 190,
                                                  height: 163,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 22,
                                                        top: 28,
                                                        child: Container(
                                                          width: 168,
                                                          height: 131,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 131,
                                                                child:
                                                                    Container(
                                                                  width: 168,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          BorderSide(
                                                                        width:
                                                                            1,
                                                                        strokeAlign:
                                                                            BorderSide.strokeAlignCenter,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 1,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 167,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          BorderSide(
                                                                        width:
                                                                            1,
                                                                        strokeAlign:
                                                                            BorderSide.strokeAlignCenter,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 148,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 1,
                                                        top: 87,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0.5',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 1,
                                                        top: 108,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0.4',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 1,
                                                        top: 130,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0.3',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 65,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0.6',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 42,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0.7',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 21,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '0.8',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: SizedBox(
                                                          width: 17,
                                                          height: 15,
                                                          child: Text(
                                                            '1',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 22,
                                                top: 7,
                                                child: Container(
                                                  width: 168,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Color(0x7CFF0000)),
                                                ),
                                              ),
                                              Positioned(
                                                left: 22,
                                                top: 28,
                                                child: Container(
                                                  width: 168,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      color: Color(0x6DF9FF00)),
                                                ),
                                              ),
                                              Positioned(
                                                left: 22,
                                                top: 95,
                                                child: Container(
                                                  width: 168,
                                                  height: 42,
                                                  decoration: BoxDecoration(
                                                      color: Color(0x6DF9FF00)),
                                                ),
                                              ),
                                              Positioned(
                                                left: 41,
                                                top: 113,
                                                child: Container(
                                                  width: 6,
                                                  height: 5,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF1400FF),
                                                    shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 1)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 61,
                                                top: 83,
                                                child: Container(
                                                  width: 6,
                                                  height: 5,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF1400FF),
                                                    shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 1)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 80,
                                                top: 104,
                                                child: Container(
                                                  width: 6,
                                                  height: 5,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF1400FF),
                                                    shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 1)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 102,
                                                top: 61,
                                                child: Container(
                                                  width: 6,
                                                  height: 5,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF1400FF),
                                                    shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 1)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 137,
                                                top: 78,
                                                child: Container(
                                                  width: 6,
                                                  height: 5,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF1400FF),
                                                    shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 1)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 160,
                                                top: 104,
                                                child: Container(
                                                  width: 6,
                                                  height: 5,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF1400FF),
                                                    shape: OvalBorder(
                                                        side: BorderSide(
                                                            width: 1)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 229,
                        top: 40,
                        child: Container(
                          width: 103,
                          height: 74,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 8,
                                top: 0,
                                child: SizedBox(
                                  width: 82,
                                  height: 54,
                                  child: Text(
                                    '정상',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF7FC0FC),
                                      fontSize: 40,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 62,
                                child: SizedBox(
                                  width: 103,
                                  height: 12,
                                  child: Text(
                                    '평균 스트레스 지수',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.4000000059604645),
                                      fontSize: 13,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 244,
                        top: 140,
                        child: Container(
                          width: 73,
                          height: 28,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 19,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 1,
                                        top: 0,
                                        child: Container(
                                          width: 17,
                                          height: 17,
                                          decoration: ShapeDecoration(
                                            color: Color(0x7CFF0000),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 0.50)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 20,
                                        child: SizedBox(
                                          width: 19,
                                          height: 8,
                                          child: Text(
                                            '높음',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 27,
                                top: 0,
                                child: Container(
                                  width: 19,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 1,
                                        top: 0,
                                        child: Container(
                                          width: 17,
                                          height: 17,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFF9FC8E),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 0.50)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 20,
                                        child: SizedBox(
                                          width: 19,
                                          height: 8,
                                          child: Text(
                                            '초기',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 54,
                                top: 0,
                                child: Container(
                                  width: 19,
                                  height: 28,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 1,
                                        top: 0,
                                        child: Container(
                                          width: 17,
                                          height: 17,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF7FC0FC),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 0.50)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 20,
                                        child: SizedBox(
                                          width: 19,
                                          height: 8,
                                          child: Text(
                                            '정상',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 719,
                child: Container(
                  width: 373,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 373,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 373,
                              height: 117.74,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 24.62,
                                    child: Container(
                                      width: 373,
                                      height: 93.12,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://via.placeholder.com/373x93"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 160.98,
                                    top: 0,
                                    child: Container(
                                      width: 52,
                                      height: 52,
                                      padding: const EdgeInsets.all(14),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF539CF3),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Colors.black.withOpacity(0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 6,
                                                  top: 6,
                                                  child: Container(
                                                    width: 12,
                                                    height: 12,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "https://via.placeholder.com/12x12"),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                              children: []),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 38,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.33, vertical: 1.67),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 13.33,
                                          height: 16.67,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/13x17"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '마이페이지',
                                    style: TextStyle(
                                      color: Color(0xFF676D74),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 38,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(2.08),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 15.83,
                                          height: 15.83,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/16x16"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '메뉴',
                                    style: TextStyle(
                                      color: Color(0xFF676D74),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 38,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(1.67),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 16.67,
                                          height: 16.67,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/17x17"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '생체 정보',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 52.20,
                              height: 36.11,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 18,
                                            top: 0,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            top: 22,
                                            child: SizedBox(
                                              width: 55,
                                              child: Text(
                                                '메인페이지',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF676D74),
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

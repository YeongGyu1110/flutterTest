import 'dart:math';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulPage(),
    );
  }
}

class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({super.key});

  @override
  State<MyStatefulPage> createState() => _MyStatefulPageState();
}

// 1. TickerProviderStateMixin으로 변경
class _MyStatefulPageState extends State<MyStatefulPage>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  int _page2SizeBarIndex = 0;

  int _currentPage2_1Index = 0;
  int _currentPage2_2Index = 0;

  // 2. 각 이미지를 위한 별도의 컨트롤러와 애니메이션 선언
  late final AnimationController _leftController;
  late final Animation<Offset> _leftAnimation;

  late final AnimationController _topController;
  late final Animation<Offset> _topAnimation;

  late final AnimationController _rightController;
  late final Animation<Offset> _rightAnimation;

  late final AnimationController _bottomController;
  late final Animation<Offset> _bottomAnimation;

  @override
  void initState() {
    super.initState();
    // 3. 왼쪽 이미지 애니메이션 초기화
    _leftController = AnimationController(
      duration: const Duration(milliseconds: 2100), // 약간 다른 속도
      vsync: this,
    )..repeat(reverse: true);

    _leftAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 0.022), // 약간 다른 움직임 범위
        ).animate(
          CurvedAnimation(parent: _leftController, curve: Curves.easeInOut),
        );

    // 3. 왼쪽 이미지 애니메이션 초기화
    _topController = AnimationController(
      duration: const Duration(milliseconds: 4200), // 4200 약간 다른 속도
      vsync: this,
    )..repeat(reverse: true);

    _topAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 0.044), // 약간 다른 움직임 범위
        ).animate(
          CurvedAnimation(parent: _leftController, curve: Curves.easeInOut),
        );

    // ========================================================================
    // ========================================================================
    // ========================================================================
    // ========================================================================
    // ========================================================================

    // 3. 오른쪽 이미지 애니메이션 초기화
    _rightController = AnimationController(
      duration: const Duration(milliseconds: 1900), // 약간 다른 속도
      vsync: this,
    )..repeat(reverse: true);

    _rightAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 0.018), // 약간 다른 움직임 범위
        ).animate(
          CurvedAnimation(parent: _rightController, curve: Curves.easeInOut),
        );

    // 3. 오른쪽 이미지 애니메이션 초기화
    _bottomController = AnimationController(
      duration: const Duration(milliseconds: 3800), // 약간 다른 속도
      vsync: this,
    )..repeat(reverse: true);

    _bottomAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 0.054), // 약간 다른 움직임 범위
        ).animate(
          CurvedAnimation(parent: _rightController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    // 4. 두 컨트롤러 모두 해제
    _leftController.dispose();
    _rightController.dispose();
    _topController.dispose();
    _bottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ui = MediaQuery.of(context).size;
    final uiWidth = ui.width;
    final uiHeight = ui.height;

    // Base design dimensions for scaling
    const double designWidth = 1920.0;
    const double designHeight = 1177.0;
    final fontScale = min(uiWidth / designWidth, uiHeight / designHeight);

    // 20년 ==========================================================
    late final List<Widget> _currentPage2_0Widget = [
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 16),
            bottom: uiHeight / (designHeight / 16),
            left: uiWidth / (designWidth / 24),
            right: uiWidth / (designWidth / 16),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.55),
              width: uiWidth / (designWidth / 1.5),
            ),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "사라질 직업",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 50,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: uiHeight / 5,
                    width: uiWidth / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(uiWidth / (designWidth / 8)),
                        topRight: Radius.circular(uiWidth / (designWidth / 8)),
                        bottomLeft: Radius.circular(
                          uiWidth / (designWidth / 8),
                        ),
                        bottomRight: Radius.circular(
                          uiWidth / (designWidth / 40),
                        ),
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/halftone_0.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    "웹 퍼블리셔 & 콘텐츠 디자이너",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 40,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    '"코딩은 `설계`의 영역입니다. AI는 이미 `단순 답안`을 생성 중입니다. UI 구현 역할은 소멸합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "AI는 디자인 시안이나 자연어 지시를 즉시 코드로 변환하며, 반복적인 UI 구현과 반응형 디자인은 자동화됩니다. 정형화된 패턴을 코드로 옮기는 역할은 20년 내 AI가 완전히 대체할 것입니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      fontSize: fontScale * 18,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    '프롬프트 하나로 수십 가지의 마케팅 배너를 1분 만에 제작하는 시대입니다. "찍어내기" 식의 디자인 작업은 더 이상 가치가 없습니다',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "이미지 생성 AI는 스케치를 넘어 최종 결과물을 즉각 제공하여 속도, 비용, 다양성에서 인간의 수작업을 압도하며, 마케팅/콘텐츠 제작에서 해당 직무를 소멸시킬 것입니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      fontSize: fontScale * 18,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentPage2_1Index++;
                    });
                  },
                  child: Container(
                    // height: uiHeight / 28,
                    // width: uiWidth / 18,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 100, 0, 1),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 32),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: fontScale * 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "StackSansText",
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: fontScale * 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_1Index > 0) {
              _currentPage2_1Index = 0;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          decoration: BoxDecoration(
            border: Border.all(
              // color: Color.fromRGBO(255, 255, 255, 0.55),
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("20년 후 사라질 직업",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 32,
              //       fontWeight: FontWeight.w100,
              //       fontFamily: "DoHyeon"
              //   ),
              // )
            ],
          ),
        ),
      ),
    ];

    late final List<Widget> _currentPage2_1Widget = [
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 16),
            bottom: uiHeight / (designHeight / 16),
            left: uiWidth / (designWidth / 24),
            right: uiWidth / (designWidth / 16),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.55),
              width: uiWidth / (designWidth / 1.5),
            ),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "살아남을 직업",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 50,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: uiHeight / 5,
                    width: uiWidth / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(uiWidth / (designWidth / 8)),
                        topRight: Radius.circular(uiWidth / (designWidth / 8)),
                        bottomLeft: Radius.circular(
                          uiWidth / (designWidth / 8),
                        ),
                        bottomRight: Radius.circular(
                          uiWidth / (designWidth / 40),
                        ),
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/halftone_1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    "AI 시스템 설계자 & UX 디자인 전략가",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 40,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    '"AI는 코드를 만들지라도, 인간은 `시스템`을 설계하고 `비즈니스 가치`를 연결합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "AI 코드의 안정성, 보안 등 최종 판단과 법적 책임은 인간 설계자의 몫입니다. 이 직무는 기술을 넘어, 개발 목표를 비즈니스 전략과 연결하는 역할이 핵심이 됩니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      fontSize: fontScale * 18,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    '"AI는 답을 내놓지만, 인간은 `진짜 문제`를 정의하고 `공감`을 설계합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "AI가 데이터 기반 솔루션을 제공해도, 사용자의 감정, 문화 등 정성적인 '진짜 문제'를 파악하고 정의하는 리서치와 공감 능력은 인간의 고유 영역으로 남습니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      fontSize: fontScale * 18,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentPage2_1Index++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 100, 0, 1),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 32),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: fontScale * 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "StackSansText",
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: fontScale * 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_1Index > 1) {
              _currentPage2_1Index = 1;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          decoration: BoxDecoration(
            border: Border.all(
              // color: Color.fromRGBO(255, 255, 255, 0.55),
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("20년 후 사라질 직업",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 32,
              //       fontWeight: FontWeight.w100,
              //       fontFamily: "DoHyeon"
              //   ),
              // )
            ],
          ),
        ),
      ),
    ];

    late final List<Widget> _currentPage2_2Widget = [
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 16),
            bottom: uiHeight / (designHeight / 16),
            left: uiWidth / (designWidth / 24),
            right: uiWidth / (designWidth / 16),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.55),
              width: uiWidth / (designWidth / 1.5),
            ),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "새로운 직업",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 50,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: uiHeight / 5,
                    width: uiWidth / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(uiWidth / (designWidth / 8)),
                        topRight: Radius.circular(uiWidth / (designWidth / 8)),
                        bottomLeft: Radius.circular(
                          uiWidth / (designWidth / 8),
                        ),
                        bottomRight: Radius.circular(
                          uiWidth / (designWidth / 40),
                        ),
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/halftone_2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    "프롬프트 엔지니어 & AI 윤리 및 투명성 검증 전문가",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 40,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    '"미래의 가치는 `답`이 아닌 `질문`에 있습니다. AI를 움직이는 질문을 설계하는 직업이 탄생합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "AI 성능이 고도화될수록, 최적의 결과물을 이끌어내는 프롬프트 설계 능력이 코딩이나 디자인 숙련도보다 중요해집니다. 이들은 여러 AI 도구의 상호작용을 최적화하는 역할을 맡게 됩니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      fontSize: fontScale * 18,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    '"AI의 결과물, 인간의 책임으로 통제됩니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "AI가 생성한 결과물의 편향성, 차별 요소를 진단하는 역할이 필수화됩니다. 이들은 알고리즘 편향성 검증, 저작권 및 법적 책임 문제를 검토하며 윤리 규제 준수를 보장합니다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      fontSize: fontScale * 18,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _page2SizeBarIndex++;
                      _currentPage2_2Index = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 100, 0, 1),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 32),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: fontScale * 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "StackSansText",
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: fontScale * 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_1Index > 2) {
              _currentPage2_1Index = 2;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
        ),
      ),
    ];
    // 20년 ==========================================================

    // LLM으로 인한 긍정 부정적 영향 =====================================
    late final List<Widget> _currentPage2_3Widget = [
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 16),
            bottom: uiHeight / (designHeight / 14),
            left: uiWidth / (designWidth / 24),
            right: uiWidth / (designWidth / 16),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.55),
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "거대한 변화의 시작:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 50,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 300),
                      Text(
                        "LLM(대규모 언어 모델)이 가져올 혁신과 가능성",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 40,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    height: uiHeight / 1000,
                    width: uiWidth / 2.5,
                  ),
                  SizedBox(height: uiHeight / 200),
                  Row(
                    children: [
                      Text(
                        '지식 소외 현상 해소:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                      Text(
                        '모두에게 맞춤형 학습 및 정보 요약 기회를 제공하여 지식 격차를 해소',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '창의적 사고의 촉매제:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                      Text(
                        '인간이 미처 고려하지 못한 관점을 제시하여 아이디어를 보강하는 강력한 사고 보조 도구',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '합성 데이터 기반 혁신:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                      Text(
                        '수집이 어렵거나 민감한 분야에서 `합성 데이터(Synthetic Data)`를 생성하여 학습을 위한 데이터 환경을 조성',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: uiHeight / 5.3,
                    width: uiWidth / 2.6,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(uiWidth / (designWidth / 24)),
                        topRight: Radius.circular(uiWidth / (designWidth / 24)),
                        bottomLeft: Radius.circular(
                          uiWidth / (designWidth / 24),
                        ),
                        bottomRight: Radius.circular(
                          uiWidth / (designWidth / 24),
                        ),
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/halftone_3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    "지적 활동의 확장과 대중화",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 38,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    'LLM은 단순히 정보를 검색하는 도구를 넘어, 인간의 지적 활동을 `확장(Augmentation)`시키고, 복잡한 지식을 `대중화(Popularization)`하는 핵심 기반 기술입니다. 특히, 합성 데이터를 활용한 연구는 미래 AI 발전의 속도를 결정할 중요한 요소입니다.',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      fontSize: fontScale * 26,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentPage2_2Index++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 100, 0, 1),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 32),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: fontScale * 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "StackSansText",
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: fontScale * 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_2Index > 0) {
              _currentPage2_2Index = 0;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
        ),
      ),
    ];

    late final List<Widget> _currentPage2_4Widget = [
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 16),
            bottom: uiHeight / (designHeight / 14),
            left: uiWidth / (designWidth / 24),
            right: uiWidth / (designWidth / 16),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.55),
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "양날의 검, 거대 언어 모델:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 50,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 300),
                      Text(
                        "기술 발전 이면에 숨겨진 사회적/개인적 부작용",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 40,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    height: uiHeight / 1000,
                    width: uiWidth / 2.5,
                  ),
                  SizedBox(height: uiHeight / 200),
                  Row(
                    children: [
                      Text(
                        '모델의 비투명성과 환각 문제:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                      Text(
                        '오류(환각, Hallucination) 발생 시 원인을 추적하고 법적/윤리적 책임을 묻기 어려움',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '의도적 편향 주입:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                      Text(
                        '훈련 데이터에 의도적으로 편향된 정보가 주입되어 특정 이념을 강화하고 대중을 조작하는 무기로 악용될 수 있음',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '새로운 형태의 사이버 보안 위협:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                      Text(
                        'LLM 자체가 지능적인 피싱이나 악성코드 생성에 사용되어 사이버 위협의 수준을 높일 수 있음.',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: uiHeight / 5.3,
                    width: uiWidth / 2.6,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(uiWidth / (designWidth / 24)),
                        topRight: Radius.circular(uiWidth / (designWidth / 24)),
                        bottomLeft: Radius.circular(
                          uiWidth / (designWidth / 24),
                        ),
                        bottomRight: Radius.circular(
                          uiWidth / (designWidth / 24),
                        ),
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/halftone_4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                  Text(
                    "통제 불능과 악의적 사용의 딜레마",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 38,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    'LLM의 급격한 발전은 기술 자체의 위험을 넘어, 사회적 안정성과 개인 정보의 신뢰도에 직접적인 위협을 가합니다. 특히, 모델의 통제 불가능성과 악의적 사용 가능성에 대한 심층적인 논의와 규제가 시급합니다.',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      fontSize: fontScale * 26,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  SizedBox(height: uiHeight / 200),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _page2SizeBarIndex++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 100, 0, 1),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 32),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: fontScale * 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "StackSansText",
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: fontScale * 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_1Index > 1) {
              _currentPage2_1Index = 1;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
        ),
      ),
    ];
    // LLM으로 인한 긍정 부정적 영향 =====================================

    late final List<Widget> _page2Widget = [
      Row(
        children: [
          _currentPage2_0Widget[(_currentPage2_1Index == 0) ? 0 : 1],
          SizedBox(width: uiWidth / 200),
          _currentPage2_1Widget[(_currentPage2_1Index == 1) ? 0 : 1],
          SizedBox(width: uiWidth / 200),
          _currentPage2_2Widget[(_currentPage2_1Index == 2) ? 0 : 1],
        ],
      ),
      Row(
        children: [
          _currentPage2_3Widget[(_currentPage2_2Index == 0) ? 0 : 1],
          SizedBox(width: uiWidth / 200),
          _currentPage2_4Widget[(_currentPage2_2Index == 1) ? 0 : 1],
        ],
      ),
      Row(),
    ];

    late final List<Widget> _widgetList = [
      Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: uiHeight / 4),
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 5. 왼쪽 이미지에 전용 애니메이션 적용
                SlideTransition(
                  position: _leftAnimation,
                  child: Image(
                    image: AssetImage('assets/ascii_left.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                // 5. 오른쪽 이미지에 전용 애니메이션 적용
                SlideTransition(
                  position: _rightAnimation,
                  child: Image(
                    image: AssetImage('assets/ascii_right.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ), // 배경 구성 요소
          Container(
            padding: EdgeInsets.all(uiWidth / (designWidth / 40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image(
                    image: AssetImage('assets/R.ico'),
                    fit: BoxFit.cover,
                    // width: ,
                    height: uiHeight / 20,
                  ),
                ),
                SizedBox(width: uiWidth / 24),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                            fontFamily: "StackSansText",
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: uiWidth / (designWidth / 24),
                          ),
                        ),
                        SizedBox(width: uiWidth / 28),
                        Text(
                          "About",
                          style: TextStyle(
                            fontFamily: "StackSansText",
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: uiWidth / (designWidth / 24),
                          ),
                        ),
                        SizedBox(width: uiWidth / 32),
                        Text(
                          "Features",
                          style: TextStyle(
                            fontFamily: "StackSansText",
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: uiWidth / (designWidth / 24),
                          ),
                        ),
                        SizedBox(width: uiWidth / 36),
                        Text(
                          "Resources",
                          style: TextStyle(
                            fontFamily: "StackSansText",
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: uiWidth / (designWidth / 24),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: uiHeight / 4),
                          // SizedBox(height: uiHeight / 8,),
                          Text(
                            "Where Inspiration Meets",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: uiWidth / (designWidth / 78),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Text(
                            "Algorithm.",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 100, 0, 1),
                              fontSize: uiWidth / (designWidth / 74),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(height: uiHeight / 40),
                          Text(
                            "the creative leap between human and machine.",
                            style: TextStyle(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              fontFamily: "StackSansText",
                              fontWeight: FontWeight.w200,
                              fontSize: uiWidth / (designWidth / 26),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(height: uiHeight / 24),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _currentIndex += 1;
                              });
                            },
                            borderRadius: BorderRadius.circular(
                              uiWidth / (designWidth / 8),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: uiWidth / 8,
                              height: uiHeight / 24,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(
                                  uiWidth / (designWidth / 4),
                                ),
                              ),
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  fontFamily: "StackSansText",
                                  fontWeight: FontWeight.w700,
                                  fontSize: (uiWidth + uiHeight) / 195,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: uiWidth / (designWidth / 2)),
                InkWell(
                  onTap: () {
                    print("${uiWidth}, ${uiHeight}");
                    launchUrl(Uri.parse("https://github.com/yeonggyu1110"));
                  },
                  borderRadius: BorderRadius.circular(
                    uiWidth / (designWidth / 8),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: uiWidth / 14,
                    height: uiHeight / 26,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                        width: uiWidth / (designWidth / 3),
                      ),
                      // color: const Color.fromRGBO(224, 224, 224, 1),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 8),
                      ),
                    ),
                    child: Text(
                      "Github",
                      style: TextStyle(
                        fontFamily: "StackSansText",
                        fontWeight: FontWeight.w400,
                        fontSize: (uiWidth + uiHeight) / 195,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              Container(color: Colors.black),
              Positioned(
                left: 0,
                top: 0,
                child: SlideTransition(
                  position: _topAnimation,
                  child: Image(image: AssetImage("assets/ascii_2_top.png")),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SlideTransition(
                  position: _bottomAnimation,
                  child: Image(image: AssetImage("assets/ascii_2_bottom.png")),
                ),
              ),
            ],
          ), // 배경 구성 요소
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  uiWidth / (designWidth / 32.0),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: uiWidth / (designWidth / 10.0),
                    sigmaY: uiWidth / (designWidth / 10.0),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.only(
                      top: uiHeight / (designHeight / 6),
                      bottom: uiHeight / (designHeight / 6),
                      left: uiWidth / (designWidth / 6),
                    ),
                    width: uiWidth / 1.5,
                    height: uiHeight / 1.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.1),
                          Color.fromRGBO(255, 255, 255, 0.02),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                        uiWidth / (designWidth / 32.0),
                      ),
                      border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                        width: uiWidth / (designWidth / 1.5),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: uiHeight / (designHeight / 8),
                            bottom: uiHeight / (designHeight / 16),
                            left: uiWidth / (designWidth / 4),
                            right: uiWidth / (designWidth / 4),
                          ),
                          clipBehavior: Clip.antiAlias,
                          width: uiWidth / 30,
                          height: uiHeight / 1,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            // borderRadius: BorderRadius.only(
                            //   topLeft: Radius.circular(24),
                            //   bottomLeft: Radius.circular(24),
                            //   topRight: Radius.circular(8),
                            //   bottomRight: Radius.circular(8),
                            // ),
                            borderRadius: BorderRadius.circular(
                              uiWidth / (designWidth / 26),
                            ),
                            border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.7),
                              width: uiWidth / (designWidth / 2),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _page2SizeBarIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      width: uiWidth / 40,
                                      height:
                                          uiHeight /
                                          ((_page2SizeBarIndex == 0)
                                              ? 12
                                              : 23.5),
                                      decoration: BoxDecoration(
                                        shape: (_page2SizeBarIndex == 0)
                                            ? BoxShape.rectangle
                                            : BoxShape.circle,
                                        color: (_page2SizeBarIndex == 0)
                                            // ? Color.fromRGBO(255, 255, 255, 0.9)
                                            ? Color.fromRGBO(255, 100, 0, 1)
                                            : Color.fromRGBO(255, 255, 255, 0),
                                        borderRadius: (_page2SizeBarIndex == 0)
                                            ? BorderRadius.circular(
                                                uiWidth / (designWidth / 32),
                                              )
                                            : null,
                                      ),
                                      child: Icon(
                                        Icons.schedule,
                                        size: uiWidth / (designWidth / 24),
                                        color: (_page2SizeBarIndex == 0)
                                            ? Colors.black
                                            : Color.fromRGBO(
                                                255,
                                                255,
                                                255,
                                                0.8,
                                              ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: uiHeight / 120,),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _page2SizeBarIndex = 1;
                                      });
                                    },
                                    child: Container(
                                      width: uiWidth / 40,
                                      height:
                                          uiHeight /
                                          ((_page2SizeBarIndex == 1) ? 12 : 24),
                                      decoration: BoxDecoration(
                                        shape: (_page2SizeBarIndex == 1)
                                            ? BoxShape.rectangle
                                            : BoxShape.circle,
                                        color: (_page2SizeBarIndex == 1)
                                            // ? Color.fromRGBO(255, 255, 255, 0.9)
                                            ? Color.fromRGBO(255, 100, 0, 1)
                                            : Color.fromRGBO(255, 255, 255, 0),
                                        borderRadius: (_page2SizeBarIndex == 1)
                                            ? BorderRadius.circular(
                                                uiWidth / (designWidth / 32),
                                              )
                                            : null,
                                      ),
                                      child: Icon(
                                        Icons.select_all,
                                        size: uiWidth / (designWidth / 24),
                                        color: (_page2SizeBarIndex == 1)
                                            ? Colors.black
                                            : Color.fromRGBO(
                                                255,
                                                255,
                                                255,
                                                0.8,
                                              ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: uiHeight / 120,),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _page2SizeBarIndex = 2;
                                      });
                                    },
                                    child: Container(
                                      width: uiWidth / 40,
                                      height:
                                          uiHeight /
                                          ((_page2SizeBarIndex == 2) ? 12 : 24),
                                      decoration: BoxDecoration(
                                        shape: (_page2SizeBarIndex == 2)
                                            ? BoxShape.rectangle
                                            : BoxShape.circle,
                                        color: (_page2SizeBarIndex == 2)
                                            // ? Color.fromRGBO(255, 255, 255, 0.9)
                                            ? Color.fromRGBO(255, 100, 0, 1)
                                            : Color.fromRGBO(255, 255, 255, 0),
                                        borderRadius: (_page2SizeBarIndex == 2)
                                            ? BorderRadius.circular(
                                                uiWidth / (designWidth / 32),
                                              )
                                            : null,
                                      ),
                                      child: Icon(
                                        Icons.change_circle_outlined,
                                        size: uiWidth / (designWidth / 24),
                                        color: (_page2SizeBarIndex == 2)
                                            ? Colors.black
                                            : Color.fromRGBO(
                                                255,
                                                255,
                                                255,
                                                0.8,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.card_giftcard,
                                    size: uiWidth / (designWidth / 24),
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                  ),
                                  SizedBox(height: uiHeight / 200),
                                  Icon(
                                    Icons.help_outline_sharp,
                                    size: uiWidth / (designWidth / 24),
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: uiWidth / 200),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            uiWidth / (designWidth / 32.0),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: uiWidth / (designWidth / 50.0),
                              sigmaY: uiWidth / (designWidth / 10.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                left: uiWidth / (designWidth / 32),
                                right: uiWidth / (designWidth / 32),
                                top: uiHeight / (designHeight / 24),
                                bottom: uiHeight / (designHeight / 32),
                              ),
                              width: uiWidth / 1.613,
                              height: uiHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  uiWidth / (designWidth / 32),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(255, 255, 255, 0.1),
                                  width: uiWidth / (designWidth / 1.5),
                                ),
                              ),
                              child: _page2Widget[_page2SizeBarIndex],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ];

    return Scaffold(body: _widgetList[_currentIndex]);
  }
}

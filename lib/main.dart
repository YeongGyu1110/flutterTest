// GEMINI_TEST_COMMENT_SYNC_20241117
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
  int _currentPage2_3Index = 0;


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
                    color: Colors.white,
                    height: uiHeight / 1000,
                    width: uiWidth / 2.5,
                  ),
                  SizedBox(height: uiHeight / 100),
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
                    color: Colors.white,
                    height: uiHeight / 1000,
                    width: uiWidth / 2.5,
                  ),
                  SizedBox(height: uiHeight / 100),
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
                    color: Colors.white,
                    height: uiHeight / 1000,
                    width: uiWidth / 2.5,
                  ),
                  SizedBox(height: uiHeight / 100),
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
      Container()
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
                      // _page2SizeBarIndex++;
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
      Container()
    ];

    late final List<Widget> _currentPage2_5Widget = [
      Expanded(
        child: Container(
          clipBehavior: Clip.antiAlias,
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
              Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AI으로 인한 `코딩(Codeing)`의 변화",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontScale * 50,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: "DoHyeon",
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: uiHeight / 1000,
                                width: uiWidth / 2.5,
                              ),
                              SizedBox(height: uiHeight / 200),
                              Text(
                                '생성형 AI는 코드 생성 및 자동 완성으로 개발 생산성을 극대화시키고 있습니다. 이로 인해 개발자의 역할은 단순 코딩에서 시스템 설계, 복잡한 문제 정의, 그리고 AI 생성 코드의 검토 및 통합과 같은 고차원적인 작업으로 변화하고 있습니다. 따라서 개발자는 AI 도구의 활용 능력을 높이는 동시에, 코드의 근본 원리에 대한 깊은 이해를 바탕으로 AI 생성 코드를 검증하고 최적화하는 역량이 더욱 중요해질 것입니다.',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.85),
                                  fontSize: fontScale * 26,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: "DoHyeon",
                                ),
                              ),
                              SizedBox(height: uiHeight / 20),
                              Text(
                                "코드의 미래를 묻다: 인간과 AI의 협업 시대",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontScale * 50,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: "DoHyeon",
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: uiHeight / 1000,
                                width: uiWidth / 2.5,
                              ),
                              SizedBox(height: uiHeight / 200),
                              Text(
                                '생성형 AI는 개발자의 생산성을 혁신적으로 높이는 강력한 도구이자 협업자이며, 아이디어를 코드로 구현하는 진입 장벽을 낮출 잠재력을 가집니다. 다만, AI가 생성한 코드의 정확성, 보안, 그리고 윤리적/법적 문제에 대한 인간의 필수적인 검토와 책임이 뒤따라야 합니다.',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.85),
                                  fontSize: fontScale * 26,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: "DoHyeon",
                                ),
                              ),
                              SizedBox(height: uiHeight / 100),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Align(
                        alignment: Alignment.centerRight ,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: uiHeight / 1.9,
                          width: uiWidth / 10,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white24
                            ),
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
                            image: AssetImage('assets/halftone_5.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _page2SizeBarIndex++;
                      _currentPage2_3Index = 0;
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
      Container()
    ];
    // LLM으로 인한 긍정 부정적 영향 =====================================

    // 직업 세계에 영향을 주는 요인 ======================================
    late final List<Widget> _currentPage2_6Widget = [
      Expanded(
        child: Container(
            height: uiHeight / 1.9,
            clipBehavior: Clip.antiAlias,
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
            child: Stack(
              children: [
                Column(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
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
                              image: AssetImage('assets/halftone_6.png'),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _currentPage2_3Index ++;
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
                    ]
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: uiWidth / 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "미래: 프로그래머의 진화",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 50,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 300),
                      Container(
                        color: Colors.white,
                        height: uiHeight / 1000,
                        width: uiWidth / 2.85,
                      ),
                      SizedBox(height: uiHeight / 200),
                      Text(
                        'AI의 발전으로 프로그래머는 큰 발전의 기회를 얻게 되었다.',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: fontScale * 28,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            ' ◈ 디지털 전환 가속화',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontScale * 28,
                              fontWeight: FontWeight.w100,
                              fontFamily: "DoHyeon",
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ◈ AI/클라우드/빅데이터 분야 폭발적 성장',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontScale * 28,
                              fontWeight: FontWeight.w100,
                              fontFamily: "DoHyeon",
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ◈ 높은 수요 대비 공급 부족 현상',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontScale * 28,
                              fontWeight: FontWeight.w100,
                              fontFamily: "DoHyeon",
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      SizedBox(height: uiHeight / 16),
                      Text(
                        "AI, 기회의 문을 열다.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 38,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Text(
                        '프로그래머는 현재 전 산업 분야의 디지털 전환 가속화와 AI, 클라우드 컴퓨팅, 빅데이터 등 혁신적인 신기술 분야의 폭발적인 성장으로 인해 전례 없는 높은 수요를 누리고 있습니다. 이러한 수요는 숙련된 인력의 공급을 초과하고 있어, 프로그래머에게 높은 연봉과 유연한 근무 환경이라는 실질적인 보상으로 이어지고 있습니다. 따라서 기술 변화에 발맞춰 지속적으로 성장하는 프로그래머에게는 무궁무진한 커리어 확장 기회가 열려 있습니다.',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          fontSize: fontScale * 26,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_3Index > 0) {
              _currentPage2_3Index = 0;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          height: uiHeight / 1.9,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              if (_currentPage2_3Index > 0) {
                _currentPage2_3Index = 0;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
            // width: uiWidth / 30,
            width:  uiWidth,
            height: uiHeight / 25,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white12,
                width: uiWidth / (designWidth / 1.5),
              ),
              borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
            ),
          ),
        ),
      )
    ];

    late final List<Widget> _currentPage2_7Widget = [
      Expanded(
        child: Container(
            height: uiHeight / 1.9,
            clipBehavior: Clip.antiAlias,
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
            child: Stack(
              children: [
                Column(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
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
                              image: AssetImage('assets/halftone_7.png'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: uiHeight / 100,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _currentPage2_3Index ++;
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
                    ]
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: uiWidth / 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "미래: 코드를 대체하다.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 50,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 300),
                      Container(
                        color: Colors.white,
                        height: uiHeight / 1000,
                        width: uiWidth / 2.85,
                      ),
                      SizedBox(height: uiHeight / 200),
                      Text(
                        '빠른 속도로 발전한 도구가 결국 경쟁자가 되었다.',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: fontScale * 28,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            ' ◈ AI 코딩 도구에 의한 업무 대체 위협',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontScale * 28,
                              fontWeight: FontWeight.w100,
                              fontFamily: "DoHyeon",
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ◈ 빠른 기술 변화에 대한 지속적인 학습 부담',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontScale * 28,
                              fontWeight: FontWeight.w100,
                              fontFamily: "DoHyeon",
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ◈ 경쟁 심화',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontScale * 28,
                              fontWeight: FontWeight.w100,
                              fontFamily: "DoHyeon",
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      SizedBox(height: uiHeight / 16),
                      Text(
                        "AI, 재앙의 문을 열다.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 38,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Text(
                        '프로그래머 직업의 가장 큰 위협은 AI 코파일럿과 같은 코딩 자동화 도구의 급속한 발전입니다. 이 도구들은 단순하고 반복적인 코딩 업무를 빠르게 대체하며 특히 초급 개발자에게 큰 위협이 될 수 있습니다. 또한, 기술의 생명 주기가 매우 짧아 빠르게 변화하는 기술 스택을 따라가지 못하면 도태되기 쉬우며, 업계 진입자가 늘어나면서 경쟁이 심화되는 현상도 피할 수 없는 위기 요인입니다.',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          fontSize: fontScale * 26,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            if (_currentPage2_3Index > 1) {
              _currentPage2_3Index = 1;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          height: uiHeight / 1.9,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              if (_currentPage2_3Index > 1) {
                _currentPage2_3Index = 1;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
            width:  uiWidth,
            height: uiHeight / 25,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white12,
                width: uiWidth / (designWidth / 1.5),
              ),
              borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
            ),
          ),
        ),
      )
    ];

    late final List<Widget> _currentPage2_8Widget = [
      Expanded(
        child: Container(
            height: uiHeight / 1.9,
            clipBehavior: Clip.antiAlias,
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
            child: Stack(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
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
                        image: AssetImage('assets/halftone_8.png'),
                      ),
                    ),
                  ),
                ),
                Column(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
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
                              image: AssetImage('assets/halftone_9.png'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: uiHeight / 100,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _currentIndex++;
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
                    ]
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: uiWidth / 10,
                      left: uiWidth / 11
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "다가올 큰 변화를 위한 준비",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 50,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(width: uiWidth / 300),
                      Container(
                        color: Colors.white,
                        height: uiHeight / 1000,
                        width: uiWidth / 2.85,
                      ),
                      SizedBox(height: uiHeight / 300),
                      Text(
                        '"AI가 일으킨 혼란에서 살아남아야 할것이다."',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Text(
                        '"설계"',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 32,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Text(
                        '"협업"',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 32,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Text(
                        '"도메인"',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(height: uiHeight / 50),
                      Text(
                        "프로그래머: 변화",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 40,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      Text(
                        '     미래의 프로그래머는 AI 코파일럿의 도움을 받아 단순한 `코드 작성자`의 역할을 넘어 시스템 전체를 구상하고 설계하는 `설계자`로 진화할것 입니다. 이에 따라 개발자는 복잡한 문제를 정의하고 추상화하는 고차원적 사고 능력을 최우선으로 강화해야 합니다. 나아가, 개발하는 산업의 도메인 지식과 비기술직 팀원들과의 효과적인 소통 능력을 겸비한 융합 인재만이 AI 시대의 기회를 선점하고 핵심 역할을 수행할 수 있습니다.',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          fontSize: fontScale * 28,
                          fontWeight: FontWeight.w100,
                          fontFamily: "DoHyeon",
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              if (_currentPage2_3Index > 3) {
                _currentPage2_3Index = 3;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
            // width: uiWidth / 30,
            width:  uiWidth,
            height: uiHeight / 1000,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white12,
                width: uiWidth / (designWidth / 1.5),
              ),
              borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
            ),
          ),
        ),
      )
    ];

    // 직업 세계에 영향을 주는 요인 ======================================

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
          _currentPage2_3Widget[(_currentPage2_2Index == 0) ? 0 : (_currentPage2_2Index == 2) ? 2 : 1],
          SizedBox(width: uiWidth / 200),
          _currentPage2_4Widget[(_currentPage2_2Index == 1) ? 0 : (_currentPage2_2Index == 2) ? 2 : 1],
          _currentPage2_5Widget[(_currentPage2_2Index == 2) ? 0 : 1],
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              _currentPage2_6Widget[(_currentPage2_3Index == 0) ? 0 : (_currentPage2_3Index == 1) ? 1 : 2],
              SizedBox(width: uiWidth / 200,),
              _currentPage2_7Widget[(_currentPage2_3Index == 1) ? 0 : (_currentPage2_3Index == 0) ? 1 : 2],
            ],
          ),
          SizedBox(height: uiHeight / 100),
          _currentPage2_8Widget[(_currentPage2_3Index) == 2 ? 0 : 1]
        ],
      ),
    ];

    late final List<Widget> _widgetList = [
      Stack(
        children: [
          Image(
            width: uiWidth,
            height: uiHeight,
            image: AssetImage("assets/background0.png"),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(top: uiHeight / 2),
            decoration: BoxDecoration(
              // color: Colors.black
              // image: DecorationImage(image: AssetImage(".png"), )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 5. 왼쪽 이미지에 전용 애니메이션 적용
                SlideTransition(
                  position: _leftAnimation,
                  child: Image(
                    width: uiWidth / 3,
                    image: AssetImage('assets/ascii_left.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // 5. 오른쪽 이미지에 전용 애니메이션 적용
                SlideTransition(
                  position: _rightAnimation,
                  child: Image(
                    width: uiWidth / 3,
                    image: AssetImage('assets/ascii_right.png'),
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
                          "Interface",
                          style: TextStyle(
                            fontFamily: "StackSansText",
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: uiWidth / (designWidth / 24),
                          ),
                        ),
                        SizedBox(width: uiWidth / 28),
                        Text(
                          "Reference",
                          style: TextStyle(
                            fontFamily: "StackSansText",
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: uiWidth / (designWidth / 24),
                          ),
                        ),
                        SizedBox(width: uiWidth / 32),
                        Text(
                          "Experience",
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
                    launchUrl(Uri.parse("https://github.com/yeonggyu1110/project_jinro"));
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
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex += 1;
              });
            },
            child: Stack(
              children: [
                Image(
                  height: uiHeight,
                  width: uiWidth,
                  fit: BoxFit.fill,
                  image: AssetImage("assets/background1.png"),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: uiHeight / 50
              ),
              child: Text("CHAPTER ONE", style: TextStyle(
                color: Colors.white,
                fontSize: fontScale * 28,
                fontWeight: FontWeight.w400,
                fontFamily: "DoHyeon",
              ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("HOW TO MOVE FORWARD INTO\nTHE FUTRUE", style: TextStyle(
                    fontSize: fontScale * 70,
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w500,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: uiHeight / 100,),
                  Text("MY EXACT WORKFLOW FOR CLEAN, PRODUCTION-READY UIS", style: TextStyle(
                    fontSize: fontScale * 30,
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w400,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: uiHeight / 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.code,
                        size: fontScale * 50,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.widgets,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.memory,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.terminal,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.palette_outlined,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              // Container(color: Colors.black),
              Image(
                width: uiWidth,
                height: uiHeight,
                image: AssetImage("assets/background2.png"),
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 0,
                top: 0,
                child: SlideTransition(
                  position: _topAnimation,
                  child: Image(
                      width: uiWidth / 2.3,
                      image: AssetImage("assets/ascii_top.png")),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SlideTransition(
                  position: _bottomAnimation,
                  child: Image(
                      width: uiWidth / 2.6,
                      image: AssetImage("assets/ascii_bottom.png")),
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
                              Stack(
                                children: [
                                  AnimatedPositioned(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    top: _page2SizeBarIndex *
                                        (uiHeight / 24),
                                    height: uiHeight / 12,
                                    width: uiWidth / 40,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(255, 100, 0, 1),
                                        borderRadius: BorderRadius.circular(uiWidth / (designWidth / 31)),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_page2SizeBarIndex == 0) {
                                              _currentPage2_1Index = 0;
                                            } else {
                                              _page2SizeBarIndex = 0;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: uiWidth / 40,
                                          height:
                                          uiHeight /
                                              ((_page2SizeBarIndex == 0)
                                                  ? 12
                                                  : 23.5),
                                          // decoration: BoxDecoration(
                                          //   // shape: (_page2SizeBarIndex == 0)
                                          //   //     ? BoxShape.rectangle
                                          //   //     : BoxShape.circle,
                                          //   // borderRadius: (_page2SizeBarIndex == 0)
                                          //   //     ? BorderRadius.circular(
                                          //   //   uiWidth / (designWidth / 32),
                                          //   // )
                                          //   //     : null,
                                          // ),
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
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_page2SizeBarIndex == 1) {
                                              _currentPage2_2Index = 0;
                                            } else {
                                              _page2SizeBarIndex = 1;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: uiWidth / 40,
                                          height:
                                          uiHeight /
                                              ((_page2SizeBarIndex == 1) ? 12 : 24),
                                          // decoration: BoxDecoration(
                                          //   shape: (_page2SizeBarIndex == 1)
                                          //       ? BoxShape.rectangle
                                          //       : BoxShape.circle,
                                          //   // color: (_page2SizeBarIndex == 1)
                                          //   //     ? Color.fromRGBO(255, 100, 0, 1)
                                          //   //     : Color.fromRGBO(255, 255, 255, 0),
                                          //   borderRadius: (_page2SizeBarIndex == 1)
                                          //       ? BorderRadius.circular(
                                          //     uiWidth / (designWidth / 32),
                                          //   )
                                          //       : null,
                                          // ),
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
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_page2SizeBarIndex == 2) {
                                            } else {
                                              _page2SizeBarIndex = 2;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: uiWidth / 40,
                                          height:
                                          uiHeight /
                                              ((_page2SizeBarIndex == 2) ? 12 : 24),
                                          // decoration: BoxDecoration(
                                          //   shape: (_page2SizeBarIndex == 2)
                                          //       ? BoxShape.rectangle
                                          //       : BoxShape.circle,
                                          //   // color: (_page2SizeBarIndex == 2)
                                          //   //     ? Color.fromRGBO(255, 100, 0, 1)
                                          //   //     : Color.fromRGBO(255, 255, 255, 0),
                                          //   borderRadius: (_page2SizeBarIndex == 2)
                                          //       ? BorderRadius.circular(
                                          //     uiWidth / (designWidth / 32),
                                          //   )
                                          //       : null,
                                          // ),
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
      Stack(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                // _currentIndex += 1;
              });
            },
            child: Stack(
              children: [
                Image(
                  height: uiHeight,
                  width: uiWidth,
                  fit: BoxFit.fill,
                  image: AssetImage("assets/background3.png"),
                ),
                // Container(
                //   height: uiHeight,
                //   width: uiWidth,
                //   color: Color.fromRGBO(0, 0, 0, 0.3),
                // )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: uiHeight / 50
              ),
              child: Text("CHAPTER TWO", style: TextStyle(
                color: Colors.white,
                fontSize: fontScale * 28,
                fontWeight: FontWeight.w400,
                fontFamily: "DoHyeon",
              ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("PREPARING TO TAKE THE RIGHT \nCAREER PATH", style: TextStyle(
                    fontSize: fontScale * 70,
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w500,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: uiHeight / 100,),
                  Text("WHAT WILL THE FUTRUE LOOK LIKE?", style: TextStyle(
                    fontSize: fontScale * 30,
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w400,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: uiHeight / 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pages_rounded,
                        size: fontScale * 45,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.remove_red_eye,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.earbuds_rounded,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.free_breakfast_outlined,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: uiWidth / 200,),
                      Icon(Icons.palette_outlined,
                        size: fontScale * 40,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ];

    return Scaffold(body: _widgetList[_currentIndex]);
  }
}
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
  bool _isHovered_GetStart = false;
  bool _isHovered_Follow = false;
  bool _isFollowed = false;
  bool _isFollowed_YEONGGYU = false;
  bool _isHovered_Organization = false;
  bool _isHovered_Email = false;
  bool _isHovered_Link = false;

  int _currentProfileImageIndex = 0;

  int _currentIndex = 0;
  int _page2SizeBarIndex = 0;

  int _currentPage2_1Index = 0;
  int _currentPage2_2Index = 0;
  int _currentPage2_3Index = 0;

  int _currentPage3_1Index = 0;

  late final PageController _pageController;

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
    _pageController = PageController(initialPage: _currentIndex);
    _pageController.addListener(() {
      setState(() {});
    });
    // 3. 왼쪽 이미지 애니메이션 초기화
    _leftController = AnimationController(
      duration: const Duration(milliseconds: 4200), // 약간 다른 속도
      vsync: this,
    )..repeat(reverse: true);

    _leftAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 0.044), // 약간 다른 움직임 범위
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
      duration: const Duration(milliseconds: 3800), // 약간 다른 속도
      vsync: this,
    )..repeat(reverse: true);

    _rightAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 0.054), // 약간 다른 움직임 범위
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
    _pageController.dispose();
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
          height: uiHeight / 1.8,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 10),
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
                      fontSize: fontScale * 48,
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
                  // SizedBox(height: uiHeight / 200),
                  Text(
                    "웹 퍼블리셔 & 콘텐츠 디자이너",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 38,
                      fontWeight: FontWeight.w800,
                      // fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    '"코딩은 `설계`의 영역입니다. AI는 이미 `단순 답안`을 생성 중입니다. UI 구현 역할은 소멸합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "DoHyeon",
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
                    'AI로 수십 가지의 마케팅 배너를 1분 만에 제작하는 시대, "템플릿" 디자인 작업은 비효율적입니다.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    "이미지 생성 AI는 스케치를 넘어 최종 결과물을 즉각 제공하여 속도, 비용, 다양성에서 인간의 수작업을 압도하며, 콘텐츠 제작에서 해당 직무를 소멸시킬 것입니다.",
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
            if (_currentPage2_1Index > 0) {
              _currentPage2_1Index = 0;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(uiWidth / (designWidth / 24)),
          width: uiWidth / 30,
          height: uiHeight / 1.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
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
          height: uiHeight / 20,
          width: uiWidth / 5.3,
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

    late final List<Widget> _currentPage2_1Widget = [
      Expanded(
        child: Container(
          height: uiHeight / 1.8,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 10),
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
                      fontSize: fontScale * 48,
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
                      fontSize: fontScale * 38,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    '"AI는 코드를 만들지라도, 인간은 `시스템`을 설계하고 `비즈니스 가치`를 연결합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "DoHyeon",
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
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "DoHyeon",
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
          height: uiHeight / 1.8,
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
          height: uiHeight / 20,
          width: uiWidth / 5.3,
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

    late final List<Widget> _currentPage2_2Widget = [
      Expanded(
        child: Container(
          height: uiHeight / 1.8,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 10),
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
                      fontSize: fontScale * 48,
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
                      fontSize: fontScale * 38,
                      fontWeight: FontWeight.w100,
                      fontFamily: "DoHyeon",
                    ),
                  ),
                  Text(
                    '"미래의 가치는 `답`이 아닌 `질문`에 있습니다. AI를 움직이는 질문을 설계하는 직업이 탄생합니다."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "DoHyeon",
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
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "DoHyeon",
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
                      _currentPage2_1Index++;
                      // _page2SizeBarIndex++;
                      // _currentPage2_2Index = 0;
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
          height: uiHeight / 1.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: uiWidth / (designWidth / 1.5),
            ),
            borderRadius: BorderRadius.circular(uiWidth / (designWidth / 32)),
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
          height: uiHeight / 20,
          width: uiWidth / 5.3,
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

    late final List<Widget> _currentPage2_21Widget = [
      Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
            top: uiHeight / (designHeight / 18),
            bottom: uiHeight / (designHeight / 16),
            left: uiWidth / (designWidth / 16),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: uiWidth / 200),
                      Container(
                        width: uiWidth / 6,
                        height: uiHeight / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 2, color: Colors.white12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: uiHeight / 20),
                            Text(
                              '프로그램',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: uiHeight / 80),
                            Text(
                              '+ 정확함  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+ 세부적  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+ 정확함  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: uiHeight / 60),
                            Container(
                              alignment: Alignment.center,
                              width: uiWidth / 7,
                              height: uiHeight / 30,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white12,
                                ),
                              ),
                              child: Text(
                                'Program',
                                style: TextStyle(
                                  color: Color.fromRGBO(44, 44, 44, 1),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '→',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: uiWidth / 5.8,
                        height: uiHeight / 3.6,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 2, color: Colors.white12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: uiHeight / 40),
                            Text(
                              '검증 전문가',
                              style: TextStyle(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                fontSize: fontScale * 54,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: uiHeight / 80),
                            Text(
                              '+ 책임  ',
                              style: TextStyle(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+ 세부적  ',
                              style: TextStyle(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+ 범용성  ',
                              style: TextStyle(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: uiHeight / 40),
                            Container(
                              alignment: Alignment.center,
                              width: uiWidth / 7,
                              height: uiHeight / 25,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white12,
                                ),
                              ),
                              child: Text(
                                'HUMAN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '←',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: uiWidth / 6,
                        height: uiHeight / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 2, color: Colors.white12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: uiHeight / 20),
                            Text(
                              '인공지능',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: uiHeight / 80),
                            Text(
                              '+ 빠른 속도  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+ 범용성  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '+ 보편성  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: uiHeight / 60),
                            Container(
                              alignment: Alignment.center,
                              width: uiWidth / 7,
                              height: uiHeight / 30,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white12,
                                ),
                              ),
                              child: Text(
                                'A.I.',
                                style: TextStyle(
                                  color: Color.fromRGBO(44, 44, 44, 1),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: uiWidth / 200),
                    ],
                  ),
                  SizedBox(height: uiHeight / 40),
                  Text(
                    'AI를 다각도로 평가하고 검증한다. ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "개발된 AI 모델의 성능, 정확성, 보안, 공정성 등을 다각도로 검증하여 AI 시스템의 신뢰성과 안정성을 확보한다.\n또한 AI 시스템의 잠재적 오류, 평향, 취약점을 발견하고 개선 방안을 제시합니다.\n"
                    "\nAI 제품 및 서비스의 품질을 향상시키고, 사용자에게 신뢰를 제공하는 데 기여한다.",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.95),
                      fontSize: fontScale * 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  top: uiHeight / 2.15,
                  left: uiWidth / 1.925,
                ),
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
      Container(),
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
      Container(),
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
                      SizedBox(width: uiWidth / 200),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: uiHeight / 1.9,
                          width: uiWidth / 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white24),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                uiWidth / (designWidth / 24),
                              ),
                              topRight: Radius.circular(
                                uiWidth / (designWidth / 24),
                              ),
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
                  ),
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
      Container(),
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
                            topLeft: Radius.circular(
                              uiWidth / (designWidth / 24),
                            ),
                            topRight: Radius.circular(
                              uiWidth / (designWidth / 24),
                            ),
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
                          _currentPage2_3Index++;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
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
              Container(
                padding: EdgeInsets.only(right: uiWidth / 10),
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
          ),
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
            width: uiWidth,
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
      ),
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
                            topLeft: Radius.circular(
                              uiWidth / (designWidth / 24),
                            ),
                            topRight: Radius.circular(
                              uiWidth / (designWidth / 24),
                            ),
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
                  SizedBox(height: uiHeight / 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentPage2_3Index++;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
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
              Container(
                padding: EdgeInsets.only(right: uiWidth / 10),
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
          ),
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
            width: uiWidth,
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
      ),
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
              Positioned.fill(
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
                    child: Image(image: AssetImage('assets/halftone_8.png')),
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
                            topLeft: Radius.circular(
                              uiWidth / (designWidth / 24),
                            ),
                            topRight: Radius.circular(
                              uiWidth / (designWidth / 24),
                            ),
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
                  SizedBox(height: uiHeight / 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        _pageController.animateToPage(
                          3,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
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
              Container(
                padding: EdgeInsets.only(
                  right: uiWidth / 10,
                  left: uiWidth / 11,
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
          ),
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
            width: uiWidth,
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
      ),
    ];
    // 직업 세계에 영향을 주는 요인 ======================================

    late final List<Widget> _currentpage3_0Widget = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: uiHeight / 200),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: uiHeight / 1.35,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 0 / 5),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Image(
                  image: AssetImage("assets/careerPoster1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: uiWidth / 48),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AI verification expert",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 80,
                      fontWeight: FontWeight.w700,
                      fontFamily: "StackSansText-Bold",
                    ),
                  ),
                  Text(
                    "AI 검증 전문가",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: uiHeight / 60),
                  Text(
                    "AI 검증 전문가는 개발된 AI 모델의 성능, 정확성,\n공정성, 보안 등을 다각도로 평가하고 검증하여 AI 시스템의\n신뢰성과 안정성을 확보하는 중요한 역할을 합니다.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontScale * 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: uiHeight / 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              "Analysis",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText-Bold",
                              ),
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              "Logic",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText-Bold",
                              ),
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              "Technical Knowledge",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText-Bold",
                              ),
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              "Ethical Judgment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText-Bold",
                              ),
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                        ],
                      ),
                      SizedBox(height: uiHeight / 100),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Text(
                          "Communication",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontScale * 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "StackSansText-Bold",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      Container(),
    ];

    late final List<Widget> _currentpage3_1Widget = [
      Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prompt Engineer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 80,
                          fontWeight: FontWeight.w700,
                          fontFamily: "StackSansText-Bold",
                        ),
                      ),
                      Text(
                        "질문 설계사",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: uiHeight / 60),
                      Text(
                        "프롬프트 엔지니어는 AI 모델이 사용자의 의도를\n정확히 이해하고 최적의 결과를생성하도록 돕는 프롬프트(질문)를\n설계하고 개선하는 전문가입니다.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: uiHeight / 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text(
                                  "Problem Solving",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontScale * 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "StackSansText-Bold",
                                  ),
                                ),
                              ),
                              SizedBox(width: uiWidth / 200),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text(
                                  "Creativity",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontScale * 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "StackSansText-Bold",
                                  ),
                                ),
                              ),
                              SizedBox(width: uiWidth / 200),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text(
                                  "Language Understanding",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontScale * 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "StackSansText-Bold",
                                  ),
                                ),
                              ),
                              SizedBox(width: uiWidth / 200),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text(
                                  "Analysis",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontScale * 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "StackSansText-Bold",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: uiHeight / 100),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              "Technical Knowledge",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontScale * 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText-Bold",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: uiWidth / 9.2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      // height: uiHeight / 1.5,
                      width: uiWidth / 2.45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(255, 255, 255, 0 / 5),
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Image(
                        image: AssetImage("assets/careerPoster2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      Container(),
    ];

    late final List<Widget> _page2Widget = [
      Column(
        children: [
          Row(
            children: [
              _currentPage2_0Widget[(_currentPage2_1Index == 0)
                  ? 0
                  : (_currentPage2_1Index == 3)
                  ? 2
                  : 1],
              SizedBox(width: uiWidth / 200),
              _currentPage2_1Widget[(_currentPage2_1Index == 1)
                  ? 0
                  : (_currentPage2_1Index == 3)
                  ? 2
                  : 1],
              SizedBox(width: uiWidth / 200),
              _currentPage2_2Widget[(_currentPage2_1Index == 2)
                  ? 0
                  : (_currentPage2_1Index == 3)
                  ? 2
                  : 1],
            ],
          ),
          SizedBox(height: uiHeight / 80),
          _currentPage2_21Widget[(_currentPage2_1Index == 3) ? 0 : 1],
        ],
      ),
      Row(
        children: [
          _currentPage2_3Widget[(_currentPage2_2Index == 0)
              ? 0
              : (_currentPage2_2Index == 2)
              ? 2
              : 1],
          SizedBox(width: uiWidth / 200),
          _currentPage2_4Widget[(_currentPage2_2Index == 1)
              ? 0
              : (_currentPage2_2Index == 2)
              ? 2
              : 1],
          _currentPage2_5Widget[(_currentPage2_2Index == 2) ? 0 : 1],
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              _currentPage2_6Widget[(_currentPage2_3Index == 0)
                  ? 0
                  : (_currentPage2_3Index == 1)
                  ? 1
                  : 2],
              SizedBox(width: uiWidth / 200),
              _currentPage2_7Widget[(_currentPage2_3Index == 1)
                  ? 0
                  : (_currentPage2_3Index == 0)
                  ? 1
                  : 2],
            ],
          ),
          SizedBox(height: uiHeight / 100),
          _currentPage2_8Widget[(_currentPage2_3Index) == 2 ? 0 : 1],
        ],
      ),
    ];

    final List<Widget> _backgrounds =
        [
              'assets/background0.png',
              'assets/background1.png',
              'assets/background2.png',
              'assets/background3.png',
              'assets/background4.png',
              'assets/background1.png',
              'assets/background3.png',
              'assets/background1.png',
              'assets/background5.png',
            ]
            .map(
              (path) =>
                  SizedBox.expand(child: Image.asset(path, fit: BoxFit.fill)),
            )
            .toList();

    late final List<Widget> _contentWidgets = [
      Container(
        child: Stack(
          children: [
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
                                _pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              borderRadius: BorderRadius.circular(
                                uiWidth / (designWidth / 8),
                              ),
                              child: MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _isHovered_GetStart = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _isHovered_GetStart = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  alignment: Alignment.center,
                                  width: uiWidth / 8,
                                  height: uiHeight / 24,
                                  decoration: BoxDecoration(
                                    color: (_isHovered_GetStart)
                                        ? Color.fromRGBO(255, 255, 255, 0.8)
                                        : Color.fromRGBO(255, 255, 255, 1),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: uiWidth / (designWidth / 2)),
                  InkWell(
                    onTap: () {
                      // print("${uiWidth}, ${uiHeight}");
                      launchUrl(
                        Uri.parse(
                          "https://github.com/yeonggyu1110/project_jinro",
                        ),
                      );
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
      ),
      InkWell(
        onTap: () {
          _pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: uiHeight / 50),
                child: Text(
                  "CHAPTER ONE",
                  style: TextStyle(
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
                    Text(
                      "HOW TO MOVE FORWARD INTO\nTHE FUTRUE",
                      style: TextStyle(
                        fontSize: fontScale * 70,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: uiHeight / 100),
                    Text(
                      "MY EXACT WORKFLOW FOR CLEAN, PRODUCTION-READY UIS",
                      style: TextStyle(
                        fontSize: fontScale * 30,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: uiHeight / 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.code,
                          size: fontScale * 50,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.widgets,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.memory,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.terminal,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.palette_outlined,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: SlideTransition(
                  position: _topAnimation,
                  child: Image(
                    width: uiWidth / 2.3,
                    image: AssetImage("assets/ascii_top.png"),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SlideTransition(
                  position: _bottomAnimation,
                  child: Image(
                    width: uiWidth / 2.6,
                    image: AssetImage("assets/ascii_bottom.png"),
                  ),
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
                                    top: _page2SizeBarIndex * (uiHeight / 24),
                                    height: uiHeight / 12,
                                    width: uiWidth / 40,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                          255,
                                          100,
                                          0,
                                          1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          uiWidth / (designWidth / 31),
                                        ),
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
                                              ((_page2SizeBarIndex == 1)
                                                  ? 12
                                                  : 24),
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
                                              ((_page2SizeBarIndex == 2)
                                                  ? 12
                                                  : 24),
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
      InkWell(
        onTap: () {
          _pageController.animateToPage(
            4,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: uiHeight / 50),
                child: Text(
                  "CHAPTER TWO",
                  style: TextStyle(
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
                    Text(
                      "PREPARING TO TAKE THE RIGHT \nCAREER PATH",
                      style: TextStyle(
                        fontSize: fontScale * 70,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: uiHeight / 100),
                    Text(
                      "WHAT WILL THE FUTRUE LOOK LIKE?",
                      style: TextStyle(
                        fontSize: fontScale * 30,
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: uiHeight / 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pages_rounded,
                          size: fontScale * 45,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.remove_red_eye,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.earbuds_rounded,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.free_breakfast_outlined,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                        SizedBox(width: uiWidth / 200),
                        Icon(
                          Icons.palette_outlined,
                          size: fontScale * 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Stack(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: uiHeight / 40,
                  bottom: uiHeight / 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideTransition(
                      position: _leftAnimation,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image(
                          height: uiHeight / 4,
                          image: AssetImage("assets/ascii_top2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // 5. 오른쪽 이미지에 전용 애니메이션 적용
                    SlideTransition(
                      position: _rightAnimation,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image(
                          height: uiHeight / 4,
                          image: AssetImage("assets/ascii_bottom2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: uiHeight / 17, left: uiWidth / 11),
            child: Text(
              "미래의 직업",
              style: TextStyle(
                color: Colors.white,
                fontSize: fontScale * 50,
                fontWeight: FontWeight.w100,
                fontFamily: "DoHyeon",
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(
                uiWidth / (designWidth / 24.0),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: uiWidth / (designWidth / 8.0),
                  sigmaY: uiWidth / (designWidth / 8.0),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.only(
                    top: uiHeight / (designHeight / 6),
                    bottom: uiHeight / (designHeight / 12),
                    left: uiWidth / (designWidth / 12),
                    right: uiWidth / (designWidth / 12),
                  ),
                  width: uiWidth / 1.2,
                  height: uiHeight / 1.3,
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
                      uiWidth / (designWidth / 24.0),
                    ),
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      width: uiWidth / (designWidth / 1.5),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          (_currentPage3_1Index == 0
                              ? _currentpage3_0Widget[(_currentPage3_1Index ==
                                        0)
                                    ? 0
                                    : 1]
                              : _currentpage3_1Widget[(_currentPage3_1Index ==
                                        1)
                                    ? 0
                                    : 1]),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            if (_currentPage3_1Index == 0) {
                              setState(() {
                                _currentPage3_1Index++;
                              });
                            } else {
                              _pageController.animateToPage(
                                5, // Loop back to the first page
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
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
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: uiHeight / 6.5,
              left: uiWidth / 7,
              right: uiWidth / 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          " 06",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontScale * 50,
                            fontWeight: FontWeight.w800,
                            fontFamily: "RobotoMono",
                          ),
                        ),
                        // SizedBox(height: uiHeight / 100)
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: uiHeight / 200),
                        Text(
                          ":관심 직업인의 진로 경로 탐색",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontScale * 50,
                            fontWeight: FontWeight.w100,
                            fontFamily: "DoHyeon",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: uiHeight / 1.2,
                    width: uiWidth,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(10, 10, 10, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        top: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: uiHeight / 4.5,
              left: uiWidth / 7,
              right: uiWidth / 7,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: uiHeight / 18,
                    left: uiWidth / 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: uiWidth / 6.5,
                        height: uiWidth / 6.5,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image: AssetImage("assets/profile.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: uiHeight / 100),
                      Text(
                        "Lee Myung-ho",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 1),
                          fontSize: fontScale * 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: "StackSansText",
                        ),
                      ),
                      Text(
                        "Skyyype234",
                        style: TextStyle(
                          color: Color.fromRGBO(90, 96, 104, 1),
                          fontSize: fontScale * 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: uiHeight / 50),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isFollowed = !_isFollowed;
                          });
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              _isHovered_Follow = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              _isHovered_Follow = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: uiWidth / 6.5,
                            height: uiHeight / 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (_isHovered_Follow)
                                  ? Color.fromRGBO(38, 44, 54, 1)
                                  : Color.fromRGBO(32, 40, 48, 1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color.fromRGBO(61, 68, 77, 1),
                                width: 1.2,
                              ),
                            ),
                            child: Text(
                              (_isFollowed) ? "Unfollow" : "Follow",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                fontSize: fontScale * 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText",
                              ),
                            ),
                          ),
                        ),
                      ), // 팔로우 버튼
                      SizedBox(height: uiHeight / 100),
                      SizedBox(height: uiHeight / 100),
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 22),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            (_isFollowed) ? "450" : "449",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 300),
                          Text(
                            "●",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 0.8),
                              fontSize: fontScale * 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 400),
                          Text(
                            "19 ",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // 팔로우
                      SizedBox(height: uiHeight / 50),
                      Row(
                        children: [
                          Icon(
                            Icons.apartment,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 800),
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered_Organization = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered_Organization = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse("https://github.com/532501124"),
                                );
                              },
                              child: Text(
                                "532501124.//",
                                style: TextStyle(
                                  color: Color.fromRGBO(240, 246, 252, 0.9),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: (_isHovered_Organization)
                                      ? TextDecoration.underline
                                      : null,
                                  decorationColor: (_isHovered_Organization)
                                      ? Color.fromRGBO(240, 246, 252, 0.9)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // 조직
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 800),
                          Text(
                            "Moon",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 252, 0.9),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // 달
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 700),
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered_Email = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered_Email = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse("mailto:skyyype.biz@gmail.com"),
                                );
                              },
                              child: Text(
                                "skyyype.biz@gmail.com",
                                style: TextStyle(
                                  color: (_isHovered_Email)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : Color.fromRGBO(240, 246, 252, 0.9),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: (_isHovered_Email)
                                      ? TextDecoration.underline
                                      : null,
                                  decorationColor: (_isHovered_Email)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // 이메일
                      Row(
                        children: [
                          Icon(
                            Icons.link,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 800),
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered_Link = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered_Link = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse("https://skyyype.sh/status"),
                                );
                              },
                              child: Text(
                                "https://skyyype.sh/status",
                                style: TextStyle(
                                  color: (_isHovered_Link)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : Color.fromRGBO(240, 246, 252, 0.9),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: (_isHovered_Link)
                                      ? TextDecoration.underline
                                      : null,
                                  decorationColor: (_isHovered_Link)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // 링크
                    ],
                  ), // profile
                ),
              ],
            ),
          ), //profile
          Container(
            padding: EdgeInsets.only(
              top: uiHeight / 3.8,
              left: uiWidth / 2.95,
              right: uiWidth / 6,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: uiHeight / 50,
                      left: uiWidth / 100,
                      right: uiWidth / 100,
                      bottom: uiHeight / 50,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                        top: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skyyype234",
                              style: TextStyle(
                                color: Color.fromRGBO(240, 246, 252, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: uiWidth / 600),
                            Text(
                              "/",
                              style: TextStyle(
                                color: Color.fromRGBO(145, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: uiWidth / 600),
                            Text(
                              "README",
                              style: TextStyle(
                                color: Color.fromRGBO(240, 246, 252, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: uiWidth / 1000),
                            Text(
                              ".",
                              style: TextStyle(
                                color: Color.fromRGBO(145, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: uiWidth / 1000),
                            Text(
                              "md",
                              style: TextStyle(
                                color: Color.fromRGBO(145, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: uiHeight / 80),
                        Expanded(
                          child: Image(
                            width: uiWidth,
                            fit: BoxFit.fill,
                            image: AssetImage("assets/SkyyypeBannerImage.png"),
                          ),
                        ),
                        SizedBox(height: uiHeight / 100),
                        Text(
                          "이명호: 게으른 8년차 프론트엔드 개발자",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 1),
                            fontSize: fontScale * 36,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 300,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        SizedBox(height: uiHeight / 80),
                        Text(
                          "️ ⚙️ 주 사용 기술/스택",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 1),
                            fontSize: fontScale * 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 600,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        Text(
                          " - React\n - Vue.js\n - Flutter",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 0.9),
                            fontSize: fontScale * 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: uiHeight / 80),
                        Text(
                          "🌐 저는 이런 기술을 다뤄본 적이 있어요:",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 1),
                            fontSize: fontScale * 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 600,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            top: uiHeight / 40,
                            left: uiWidth / 100,
                          ),
                          height: uiHeight / 6,
                          child: Image(image: AssetImage("assets/badge.png")),
                        ),
                      ],
                    ),
                  ),
                ), // readme
              ],
            ),
          ), // readme
        ],
      ),
      Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: uiWidth / 7, right: uiWidth / 7),
            // height: uiHeight / 1.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(10, 10, 10, 1),
                      borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(24),
                        // bottomRight: Radius.circular(24)
                      ),
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        // bottom: BorderSide(color: Color.fromRGBO(50, 50, 54, 1), width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              // top: uiHeight / 4.5,
              left: uiWidth / 7.5,
              right: uiWidth / 7,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: uiHeight / 18,
                    left: uiWidth / 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 25,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image(
                              image: AssetImage("assets/profile.png"),
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lee Myung-ho",
                                style: TextStyle(
                                  color: Color.fromRGBO(240, 246, 252, 1),
                                  fontSize: fontScale * 32,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "StackSansText",
                                ),
                              ),
                              Text(
                                "Skyyype234",
                                style: TextStyle(
                                  color: Color.fromRGBO(90, 96, 104, 1),
                                  fontSize: fontScale * 26,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: uiHeight / 50),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isFollowed = !_isFollowed;
                          });
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              _isHovered_Follow = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              _isHovered_Follow = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: uiWidth / 6,
                            height: uiHeight / 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (_isHovered_Follow)
                                  ? Color.fromRGBO(38, 44, 54, 1)
                                  : Color.fromRGBO(32, 40, 48, 1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color.fromRGBO(61, 68, 77, 1),
                                width: 1.2,
                              ),
                            ),
                            child: Text(
                              (_isFollowed) ? "Unfollow" : "Follow",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                fontSize: fontScale * 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText",
                              ),
                            ),
                          ),
                        ),
                      ), // 팔로우 버튼
                      SizedBox(height: uiHeight / 100),
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 22),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            (_isFollowed) ? "450" : "449",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 300),
                          Text(
                            "●",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 0.8),
                              fontSize: fontScale * 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 400),
                          Text(
                            "19 ",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // 팔로우
                      SizedBox(height: uiHeight / 50),
                      Container(
                        width: uiWidth / 6,
                        height: uiHeight / 600,
                        color: Color.fromRGBO(61, 68, 71, 1),
                      ),
                      SizedBox(height: uiHeight / 80),
                      Text(
                        "Achievements",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 22,
                          fontWeight: FontWeight.w500,
                          decoration: (_isHovered_Organization)
                              ? TextDecoration.underline
                              : null,
                          decorationColor: (_isHovered_Organization)
                              ? Color.fromRGBO(240, 246, 252, 0.9)
                              : null,
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                      Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/YOLO_Badge.png"),
                            ),
                          ),
                          SizedBox(width: uiWidth / 800),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/PullShark.png"),
                            ),
                          ),
                          SizedBox(width: uiWidth / 800),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/QuickDraw.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: uiHeight / 40),
                      Container(
                        width: uiWidth / 6,
                        height: uiHeight / 600,
                        color: Color.fromRGBO(61, 68, 71, 1),
                      ),
                      SizedBox(height: uiHeight / 80),
                      Text(
                        "Organizations",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 22,
                          fontWeight: FontWeight.w500,
                          decoration: (_isHovered_Organization)
                              ? TextDecoration.underline
                              : null,
                          decorationColor: (_isHovered_Organization)
                              ? Color.fromRGBO(240, 246, 252, 0.9)
                              : null,
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse("https://github.com/532501124"));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: uiWidth / 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/532501124.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: uiHeight / 1.6,
            padding: EdgeInsets.only(left: uiWidth / 2.95, right: uiWidth / 6),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: uiWidth / 100,
                      right: uiWidth / 100,
                      bottom: uiHeight / 50,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: uiHeight / 80,),
                        Text(
                          "Super Project: 초거대 프로젝트",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 1),
                            fontSize: fontScale * 36,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 600,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        SizedBox(height: uiHeight / 140),
                        Text(
                          " - DarkLSE\n - Grassy\n - MultiTool",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 0.9),
                            fontSize: fontScale * 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: uiHeight / 80),
                        Text(
                          "My Career Path ⌛ (2015-2020)",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 1),
                            fontSize: fontScale * 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 600,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        SizedBox(height: uiHeight / 80),
                        Expanded(
                          child: Image(
                            image: AssetImage("assets/careerPath.png"),
                            fit: BoxFit.cover,
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
            padding: EdgeInsets.only(
              top: uiWidth / 3.14,
              left: uiWidth / 2.95,
              right: uiWidth / 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: uiHeight / 600),
                Text(
                  "Pinned",
                  style: TextStyle(
                    color: Color.fromRGBO(240, 246, 252, 0.9),
                    fontSize: fontScale * 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: uiHeight / 400),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: uiHeight / 50,
                          left: uiWidth / 110,
                        ),
                        height: uiHeight / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(60, 60, 64, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                SizedBox(width: uiWidth / 300),
                                Text(
                                  "Grassy",
                                  style: TextStyle(
                                    color: Color.fromRGBO(68, 147, 248, 1),
                                    fontSize: fontScale * 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 200),
                                Container(
                                  alignment: Alignment.center,
                                  width: uiWidth / 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color.fromRGBO(50, 50, 54, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    "Public",
                                    style: TextStyle(
                                      color: Color.fromRGBO(154, 152, 161, 1),
                                      fontSize: fontScale * 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: uiHeight / 200),
                            Text(
                              'go inside and touch the grass.',
                              style: TextStyle(
                                color: Color.fromRGBO(154, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: uiHeight / 70),
                            Row(
                              children: [
                                Container(
                                  height: uiHeight / 80,
                                  width: uiHeight / 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(241, 224, 90, 1),
                                  ),
                                ),
                                SizedBox(width: uiWidth / 600),
                                Text(
                                  "JavaScript",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 100),
                                Icon(
                                  Icons.star_border,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                Text(
                                  "132",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: uiWidth / 80),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: uiHeight / 50,
                          left: uiWidth / 110,
                        ),
                        height: uiHeight / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(60, 60, 64, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                SizedBox(width: uiWidth / 300),
                                Text(
                                  "DarkLSE",
                                  style: TextStyle(
                                    color: Color.fromRGBO(68, 147, 248, 1),
                                    fontSize: fontScale * 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 200),
                                Container(
                                  alignment: Alignment.center,
                                  width: uiWidth / 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color.fromRGBO(50, 50, 54, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    "Public",
                                    style: TextStyle(
                                      color: Color.fromRGBO(154, 152, 161, 1),
                                      fontSize: fontScale * 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: uiHeight / 200),
                            Text(
                              '웹/텍스트 기반 탐험 게임, 잊혀진 문명을 되찾으세요',
                              style: TextStyle(
                                color: Color.fromRGBO(154, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: uiHeight / 70),
                            Row(
                              children: [
                                Container(
                                  height: uiHeight / 80,
                                  width: uiHeight / 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(227, 76, 38, 1),
                                  ),
                                ),
                                SizedBox(width: uiWidth / 600),
                                Text(
                                  "HTML",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 100),
                                Icon(
                                  Icons.star_border,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                Text(
                                  "53",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: uiHeight / 60),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: uiHeight / 50,
                          left: uiWidth / 110,
                        ),
                        height: uiHeight / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(60, 60, 64, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                SizedBox(width: uiWidth / 300),
                                Text(
                                  "Origami",
                                  style: TextStyle(
                                    color: Color.fromRGBO(68, 147, 248, 1),
                                    fontSize: fontScale * 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 200),
                                Container(
                                  alignment: Alignment.center,
                                  width: uiWidth / 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color.fromRGBO(50, 50, 54, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    "Public",
                                    style: TextStyle(
                                      color: Color.fromRGBO(154, 152, 161, 1),
                                      fontSize: fontScale * 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: uiHeight / 200),
                            Text(
                              '순수 HTML에서 종이접기를 접해보세요.',
                              style: TextStyle(
                                color: Color.fromRGBO(154, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: uiHeight / 70),
                            Row(
                              children: [
                                Container(
                                  height: uiHeight / 80,
                                  width: uiHeight / 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(227, 76, 38, 1),
                                  ),
                                ),
                                SizedBox(width: uiWidth / 600),
                                Text(
                                  "HTML",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 100),
                                Icon(
                                  Icons.star_border,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                Text(
                                  "173",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: uiWidth / 80),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              // top: uiHeight / 8,
              left: uiWidth / 7,
              right: uiWidth / 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    // height: uiHeight / 1.2,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(10, 10, 10, 1),
                      borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(24),
                        // topRight: Radius.circular(24)
                      ),
                      border: Border(
                        // top: BorderSide(color: Color.fromRGBO(50, 50, 54, 1), width: 1),
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), // 나의 진로 경로 container
          Container(
            padding: EdgeInsets.only(
              top: uiHeight / 12,
              left: uiWidth / 6,
              right: uiWidth / 3,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: uiHeight / 50,
                    left: uiWidth / 100,
                    right: uiWidth / 100,
                    bottom: uiHeight / 50,
                  ),
                  // height: uiHeight / 1.38,
                  width: uiWidth / 2,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color.fromRGBO(50, 50, 54, 1),
                        width: 2,
                      ),
                      top: BorderSide(
                        color: Color.fromRGBO(50, 50, 54, 1),
                        width: 2,
                      ),
                      right: BorderSide(
                        color: Color.fromRGBO(50, 50, 54, 1),
                        width: 2,
                      ),
                      // bottom: BorderSide(color: Color.fromRGBO(50, 50, 54, 1), width: 2),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      // bottomLeft: Radius.circular(12),
                      // bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "YeongGyu1110",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 252, 1),
                              fontSize: fontScale * 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: uiWidth / 600),
                          Text(
                            "/",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 1),
                              fontSize: fontScale * 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: uiWidth / 600),
                          Text(
                            "README",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 252, 1),
                              fontSize: fontScale * 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: uiWidth / 1000),
                          Text(
                            ".",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 1),
                              fontSize: fontScale * 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 1000),
                          Text(
                            "md",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 1),
                              fontSize: fontScale * 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: uiHeight / 100),
                      Expanded(
                        child: Image(
                          width: uiWidth,
                          // height: uiHeight / 20,
                          image: AssetImage("assets/yeonggyuAsciiBanner.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: uiHeight / 100),
                      Text(
                        "Hi, Where! 👋",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 1),
                          fontSize: fontScale * 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        width: uiWidth,
                        height: uiHeight / 600,
                        color: Color.fromRGBO(61, 68, 71, 1),
                      ),
                      SizedBox(height: uiHeight / 140),
                      Text(
                        "저는 영규(이)라고 해요!\n다음과 같은 기술을 주로 다뤄요:",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "-",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 252, 0.9),
                              fontSize: fontScale * 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: uiWidth / 300),
                          Image(
                            height: uiHeight / 24,
                            image: AssetImage("assets/javascript.png"),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Text(
                        "      └ MessengerBot을 활용한 메신저 앱 알림 자동답장기 제작\n      └ Discord.Js를 활용한 디스코드 봇 제작",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "-",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 252, 0.9),
                              fontSize: fontScale * 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: uiWidth / 300),
                          Image(
                            height: uiHeight / 28,
                            image: AssetImage("assets/flutter.png"),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: uiWidth / 200),
                          Image(
                            height: uiHeight / 28,
                            image: AssetImage("assets/dart.png"),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Text(
                        "      └ 앱 UI/UX 디자인\n      └ 프론트엔드 구현",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: uiHeight / 30),
                      Text(
                        "저는 개발자 2차 전직으로 2가지 길을 걸을 수 있어요.",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "1. 유저와 상호작용하는 '프론트-엔드 개발자' 🖼️",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 1),
                          fontSize: fontScale * 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      Container(
                        width: uiWidth,
                        height: uiHeight / 600,
                        color: Color.fromRGBO(61, 68, 71, 1),
                      ),
                      SizedBox(height: uiHeight / 80),
                      Image(
                        image: AssetImage("assets/flutter_careerPath.png"),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), // readme
          Container(
            padding: EdgeInsets.only(
              top: uiHeight / 12,
              left: uiWidth / 1.52,
              right: uiWidth / 7,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: uiHeight / 18,
                    left: uiWidth / 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            (_currentProfileImageIndex == 3)
                                ? _currentProfileImageIndex = 0
                                : _currentProfileImageIndex++;
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: uiWidth / 6.5,
                          height: uiWidth / 6.5,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(61, 68, 77, 1),
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: (_currentProfileImageIndex == 0)
                                ? AssetImage("assets/Yeonggyu.jpg")
                                : (_currentProfileImageIndex == 1)
                                ? AssetImage("assets/Yeonggyu2.jpg")
                                : (_currentProfileImageIndex == 2)
                                ? AssetImage("assets/hacker.png")
                                : AssetImage("assets/Yeonggyu4.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: uiHeight / 100),
                      Text(
                        "YEONGGYU1110",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 1),
                          fontSize: fontScale * 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: "StackSansText",
                        ),
                      ),
                      Text(
                        "YeongGyu1110",
                        style: TextStyle(
                          color: Color.fromRGBO(90, 96, 104, 1),
                          fontSize: fontScale * 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: uiHeight / 50),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isFollowed_YEONGGYU = !_isFollowed_YEONGGYU;
                          });
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              _isHovered_Follow = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              _isHovered_Follow = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: uiWidth / 6.5,
                            height: uiHeight / 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (_isHovered_Follow)
                                  ? Color.fromRGBO(38, 44, 54, 1)
                                  : Color.fromRGBO(32, 40, 48, 1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color.fromRGBO(61, 68, 77, 1),
                                width: 1.2,
                              ),
                            ),
                            child: Text(
                              (_isFollowed_YEONGGYU) ? "Unfollow" : "Follow",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                fontSize: fontScale * 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText",
                              ),
                            ),
                          ),
                        ),
                      ), // 팔로우 버튼
                      SizedBox(height: uiHeight / 100),
                      SizedBox(height: uiHeight / 100),
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 22),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            (_isFollowed_YEONGGYU) ? "116" : "115",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 300),
                          Text(
                            "●",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 0.8),
                              fontSize: fontScale * 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 400),
                          Text(
                            "51",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // 팔로우
                      SizedBox(height: uiHeight / 50),
                      Row(
                        children: [
                          Icon(
                            Icons.apartment,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 800),
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered_Organization = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered_Organization = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                    "https://github.com/LICHTKRANKHEIT",
                                  ),
                                );
                              },
                              child: Text(
                                "LICHTKRANKHEIT",
                                style: TextStyle(
                                  color: Color.fromRGBO(240, 246, 252, 0.9),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: (_isHovered_Organization)
                                      ? TextDecoration.underline
                                      : null,
                                  decorationColor: (_isHovered_Organization)
                                      ? Color.fromRGBO(240, 246, 252, 0.9)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // 조직
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 800),
                          Text(
                            "🪐",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 252, 0.9),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // 달
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 700),
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered_Email = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered_Email = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                    "mailto:YeongGyu1110.work@gmail.com",
                                  ),
                                );
                              },
                              child: Text(
                                "YeongGyu1110.work@gmail.com",
                                style: TextStyle(
                                  color: (_isHovered_Email)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : Color.fromRGBO(240, 246, 252, 0.9),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: (_isHovered_Email)
                                      ? TextDecoration.underline
                                      : null,
                                  decorationColor: (_isHovered_Email)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // 이메일
                      Row(
                        children: [
                          Icon(
                            Icons.link,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 20),
                          ),
                          SizedBox(width: uiWidth / 800),
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered_Link = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered_Link = false;
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                    "https://able-daughter-6e8.notion.site/YeongGyu-292a9dde58f480ba8a2bc0098e555938",
                                  ),
                                );
                              },
                              child: Text(
                                "https://notion.site/YeongGyu1110",
                                style: TextStyle(
                                  color: (_isHovered_Link)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : Color.fromRGBO(240, 246, 252, 0.9),
                                  fontSize: fontScale * 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: (_isHovered_Link)
                                      ? TextDecoration.underline
                                      : null,
                                  decorationColor: (_isHovered_Link)
                                      ? Color.fromRGBO(68, 147, 248, 1)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // 링크
                    ],
                  ), // profile
                ),
              ],
            ),
          ), // profile
        ],
      ),
      Stack(
        children: [
          Container(
            height: uiHeight / 1.18,
            padding: EdgeInsets.only(left: uiWidth / 7, right: uiWidth / 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(10, 10, 10, 1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: uiWidth / 1.52, right: uiWidth / 7),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: uiHeight / 18,
                    left: uiWidth / 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                (_currentProfileImageIndex == 3)
                                    ? _currentProfileImageIndex = 0
                                    : _currentProfileImageIndex++;
                              });
                            },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              width: uiWidth / 25,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image(
                                image: (_currentProfileImageIndex == 0)
                                    ? AssetImage("assets/Yeonggyu.jpg")
                                    : (_currentProfileImageIndex == 1)
                                    ? AssetImage("assets/Yeonggyu2.jpg")
                                    : (_currentProfileImageIndex == 2)
                                    ? AssetImage("assets/hacker.png")
                                    : AssetImage("assets/Yeonggyu4.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: uiWidth / 200),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "YEONGGYU1110",
                                style: TextStyle(
                                  color: Color.fromRGBO(240, 246, 252, 1),
                                  fontSize: fontScale * 32,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "StackSansText",
                                ),
                              ),
                              Text(
                                "YeongGyu1110",
                                style: TextStyle(
                                  color: Color.fromRGBO(90, 96, 104, 1),
                                  fontSize: fontScale * 26,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: uiHeight / 50),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isFollowed_YEONGGYU = !_isFollowed_YEONGGYU;
                          });
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              _isHovered_Follow = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              _isHovered_Follow = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: uiWidth / 6,
                            height: uiHeight / 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (_isHovered_Follow)
                                  ? Color.fromRGBO(38, 44, 54, 1)
                                  : Color.fromRGBO(32, 40, 48, 1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color.fromRGBO(61, 68, 77, 1),
                                width: 1.2,
                              ),
                            ),
                            child: Text(
                              (_isFollowed_YEONGGYU) ? "Unfollow" : "Follow",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                fontSize: fontScale * 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "StackSansText",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: uiHeight / 100),
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            color: Color.fromRGBO(154, 152, 161, 1),
                            size: uiWidth / (designWidth / 22),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            (_isFollowed_YEONGGYU) ? "116" : "115",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 300),
                          Text(
                            "●",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 0.8),
                              fontSize: fontScale * 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 400),
                          Text(
                            "51",
                            style: TextStyle(
                              color: Color.fromRGBO(240, 246, 238, 1),
                              fontSize: fontScale * 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: uiWidth / 700),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: Color.fromRGBO(145, 152, 161, 0.9),
                              fontSize: fontScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ), // 팔로우
                      SizedBox(height: uiHeight / 50),
                      Container(
                        width: uiWidth / 6,
                        height: uiHeight / 600,
                        color: Color.fromRGBO(61, 68, 71, 1),
                      ),
                      SizedBox(height: uiHeight / 80),
                      Text(
                        "Achievements",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 22,
                          fontWeight: FontWeight.w500,
                          decoration: (_isHovered_Organization)
                              ? TextDecoration.underline
                              : null,
                          decorationColor: (_isHovered_Organization)
                              ? Color.fromRGBO(240, 246, 252, 0.9)
                              : null,
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                      Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/YOLO_Badge.png"),
                            ),
                          ),
                          SizedBox(width: uiWidth / 800),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/PullShark.png"),
                            ),
                          ),
                          SizedBox(width: uiWidth / 800),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: uiWidth / 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/QuickDraw.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: uiHeight / 40),
                      Container(
                        width: uiWidth / 6,
                        height: uiHeight / 600,
                        color: Color.fromRGBO(61, 68, 71, 1),
                      ),
                      SizedBox(height: uiHeight / 80),
                      Text(
                        "Organizations",
                        style: TextStyle(
                          color: Color.fromRGBO(240, 246, 252, 0.9),
                          fontSize: fontScale * 22,
                          fontWeight: FontWeight.w500,
                          decoration: (_isHovered_Organization)
                              ? TextDecoration.underline
                              : null,
                          decorationColor: (_isHovered_Organization)
                              ? Color.fromRGBO(240, 246, 252, 0.9)
                              : null,
                        ),
                      ),
                      SizedBox(height: uiHeight / 200),
                      InkWell(
                        onTap: () {
                          launchUrl(
                            Uri.parse("https://github.com/LICHTKRANKHEIT"),
                          );
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: uiWidth / 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/LICHTKRANKHEIT.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), // 프로필
          Container(
            height: uiHeight / 1.66,
            padding: EdgeInsets.only(left: uiWidth / 6, right: uiWidth / 3),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: uiHeight / 50,
                      left: uiWidth / 100,
                      right: uiWidth / 100,
                      bottom: uiHeight / 50,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: Color.fromRGBO(50, 50, 54, 1),
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: uiHeight / 30),
                        Text(
                          "2. 서버과 통신하는 뒷무대, '백-엔드' ⚙️",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 1),
                            fontSize: fontScale * 36,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 600,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        SizedBox(height: uiHeight / 80),
                        Image(
                          image: AssetImage("assets/backend_careerPath.png"),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: uiHeight / 30),
                        Text(
                          "쉿, 지금은 이런 기술을 배우고 있어요",
                          style: TextStyle(
                            color: Color.fromRGBO(240, 246, 252, 0.9),
                            fontSize: fontScale * 34,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: uiWidth,
                          height: uiHeight / 600,
                          color: Color.fromRGBO(61, 68, 71, 1),
                        ),
                        SizedBox(height: uiHeight / 100),
                        Row(
                          children: [
                            Text(
                              "-",
                              style: TextStyle(
                                color: Color.fromRGBO(240, 246, 252, 0.9),
                                fontSize: fontScale * 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: uiWidth / 300),
                            Image(
                              height: uiHeight / 26,
                              image: AssetImage("assets/react.png"),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(height: uiHeight / 100),
                        Row(
                          children: [
                            Text(
                              "-",
                              style: TextStyle(
                                color: Color.fromRGBO(240, 246, 252, 0.9),
                                fontSize: fontScale * 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: uiWidth / 300),
                            Image(
                              height: uiHeight / 26,
                              image: AssetImage("assets/flutter.png"),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), // 리드미
          Container(
            padding: EdgeInsets.only(
              top: uiWidth / 3.2,
              left: uiWidth / 6,
              right: uiWidth / 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pinned",
                  style: TextStyle(
                    color: Color.fromRGBO(240, 246, 252, 0.9),
                    fontSize: fontScale * 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: uiHeight / 400),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: uiHeight / 50,
                          left: uiWidth / 110,
                        ),
                        height: uiHeight / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(60, 60, 64, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                SizedBox(width: uiWidth / 300),
                                Text(
                                  "project_JinRo",
                                  style: TextStyle(
                                    color: Color.fromRGBO(68, 147, 248, 1),
                                    fontSize: fontScale * 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 200),
                                Container(
                                  alignment: Alignment.center,
                                  width: uiWidth / 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color.fromRGBO(50, 50, 54, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    "Public",
                                    style: TextStyle(
                                      color: Color.fromRGBO(154, 152, 161, 1),
                                      fontSize: fontScale * 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: uiHeight / 200),
                            Text(
                              '학교 수행평가임.',
                              style: TextStyle(
                                color: Color.fromRGBO(154, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: uiHeight / 70),
                            Row(
                              children: [
                                Container(
                                  height: uiHeight / 80,
                                  width: uiHeight / 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(0, 180, 171, 1),
                                  ),
                                ),
                                SizedBox(width: uiWidth / 600),
                                Text(
                                  "Dart",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 100),
                                Icon(
                                  Icons.star_border,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                Text(
                                  "4",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: uiWidth / 80),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: uiHeight / 50,
                          left: uiWidth / 110,
                        ),
                        height: uiHeight / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(60, 60, 64, 1),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                SizedBox(width: uiWidth / 300),
                                Text(
                                  "Js-for-Beginners",
                                  style: TextStyle(
                                    color: Color.fromRGBO(68, 147, 248, 1),
                                    fontSize: fontScale * 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 200),
                                Container(
                                  alignment: Alignment.center,
                                  width: uiWidth / 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color.fromRGBO(50, 50, 54, 1),
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    "Public",
                                    style: TextStyle(
                                      color: Color.fromRGBO(154, 152, 161, 1),
                                      fontSize: fontScale * 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: uiHeight / 200),
                            Text(
                              'JavaScript, 코딩 입문자를 위한 예제코드 v3',
                              style: TextStyle(
                                color: Color.fromRGBO(154, 152, 161, 1),
                                fontSize: fontScale * 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: uiHeight / 70),
                            Row(
                              children: [
                                Container(
                                  height: uiHeight / 80,
                                  width: uiHeight / 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(241, 224, 90, 1),
                                  ),
                                ),
                                SizedBox(width: uiWidth / 600),
                                Text(
                                  "JavaScript",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: uiWidth / 100),
                                Icon(
                                  Icons.star_border,
                                  color: Color.fromRGBO(154, 152, 161, 1),
                                  size: uiWidth / (designWidth / 22),
                                ),
                                Text(
                                  "17",
                                  style: TextStyle(
                                    color: Color.fromRGBO(154, 152, 161, 1),
                                    fontSize: fontScale * 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(),
              ],
            ),
          ), // repo
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ..._backgrounds.asMap().entries.map((entry) {
            final index = entry.key;
            final background = entry.value;
            double opacity = 0.0;
            double blur = 0.0;
            if (_pageController.hasClients &&
                _pageController.position.haveDimensions) {
              double page = _pageController.page ?? _currentIndex.toDouble();
              opacity = (1 - (page - index).abs()).clamp(0.0, 1.0);
              blur = (1.0 - opacity) * 10.0;
            } else if (index == _currentIndex) {
              opacity = 1.0;
            }

            return Opacity(
              opacity: opacity,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: background,
              ),
            );
          }),
          PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                _page2SizeBarIndex = 0;
                _currentPage2_1Index = 0;
                _currentPage2_2Index = 0;
                _currentPage2_3Index = 0;
                _currentPage3_1Index = 0;
              });
            },
            children: _contentWidgets,
          ),
        ],
      ),
    );
  }
}

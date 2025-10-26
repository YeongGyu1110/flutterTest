import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "UpDown",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var currentThemeBackgroundColor = Colors.black87;
  var currentThemeItemsColor = Colors.white;

  var currentPageTitle;

  bool isLightTheme = false;

  bool isGame = false;
  int randomNumber = random.nextInt(100) + 1;
  int max = 100;
  int min = 1;

  void startGame() {
    randomNumber = random.nextInt(100) + 1;
    max = 100;
    min = 1;
    tryCount = 1;
    isGame = true;
  }

  void reMakeRandomNumber() {
    if (max > min) {
      randomNumber = ((max + min) / 2).floor();
    } else {
      isGame = false;
    }
  }

  int tryCount = 1;

  int currentPageIndex = 0;
  var currentAppBarLeadingItem;

  Widget _buildBody() {
    var rangeMsg;

    if (isGame) {
      rangeMsg = "Range: ${min} ~ ${max}";
    } else {
      rangeMsg = "try: ${tryCount}";
    }

    var isItRandomNumber;

    if (isGame) {
      isItRandomNumber = "Is it ${randomNumber}?";
    } else {
      isItRandomNumber = "The number you thought of: ${randomNumber}";
    }

    var inGameButton;

    if (isGame) {
      inGameButton = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                tryCount += 1;
                min = randomNumber;
                setState(() {
                  reMakeRandomNumber();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.keyboard_arrow_up, color: currentThemeItemsColor),
                  Text("UP!", style: TextStyle(color: currentThemeItemsColor)),
                ],
              ),
              style: OutlinedButton.styleFrom(fixedSize: Size(120, 20)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  isGame = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.check, color: currentThemeItemsColor),
                  Text(
                    "Game!",
                    style: TextStyle(color: currentThemeItemsColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                tryCount += 1;
                max = randomNumber;
                setState(() {
                  reMakeRandomNumber();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: currentThemeItemsColor,
                  ),
                  Text(
                    "DOWN!",
                    style: TextStyle(color: currentThemeItemsColor),
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(fixedSize: Size(120, 20)),
            ),
          ),
        ],
      );
    } else {
      inGameButton = OutlinedButton(
        onPressed: () {
          setState(() {
            startGame();
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.replay, color: currentThemeItemsColor),
            Text(
              "Restart Game",
              style: TextStyle(color: currentThemeItemsColor),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(fixedSize: Size(155, 20)),
      );
    }

    switch (currentPageIndex) {
      case 1:
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 420,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentThemeItemsColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 60, left: 25, right: 25),
              width: 418,
              height: 248,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentThemeBackgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "${isItRandomNumber}",
                        style: TextStyle(
                          color: currentThemeItemsColor,
                          fontWeight: FontWeight.bold,
                          fontSize: (isGame) ? 35 : 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${rangeMsg}",
                    style: TextStyle(
                      color: (isLightTheme)
                          ? Colors.grey[900]
                          : Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 50),
                  inGameButton,
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        );
      case 2:
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentThemeItemsColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35),
              width: 498,
              height: 298,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: currentThemeBackgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "What is the Up-Down Game?",
                    style: TextStyle(
                      color: currentThemeItemsColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "The Up-Down Game is a game where ",
                    style: TextStyle(color: currentThemeItemsColor),
                  ),
                  Text(
                    "the opponent guesses the number you've guessed.",
                    style: TextStyle(color: currentThemeItemsColor),
                  ),
                  Text(
                    'You can provide hints about the range by saying "up" or "down."',
                    style: TextStyle(color: currentThemeItemsColor),
                  ),
                  SizedBox(height: 60),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        currentPageIndex = 0;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check, color: currentThemeItemsColor),
                        SizedBox(width: 5),
                        Text(
                          "OK!",
                          style: TextStyle(color: currentThemeItemsColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return Container(
          width: 500,
          height: 250,
          child: Column(
            children: [
              Text(
                "Start Up/Down Game?",
                style: TextStyle(
                  color: currentThemeItemsColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        startGame();
                        currentPageIndex = 1;
                      });
                    },
                    child: Text(
                      "START",
                      style: TextStyle(color: currentThemeItemsColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        currentPageIndex = 2;
                      });
                    },
                    child: Text(
                      "Help (How To Play?)",
                      style: TextStyle(color: currentThemeItemsColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLightTheme) {
      setState(() {
        currentThemeItemsColor = Colors.black87;
        currentThemeBackgroundColor = Colors.white;
      });
    } else {
      setState(() {
        currentThemeItemsColor = Colors.white;
        currentThemeBackgroundColor = Colors.black87;
      });
    }

    switch (currentPageIndex) {
      case 0:
      case 1:
        setState(() {
          currentPageTitle = "UpDown";
        });
        break;
      case 2:
        setState(() {
          currentPageTitle = "How to Play?";
        });
        break;

      default:
        currentPageTitle = "UpDown";
    }

    switch (currentPageIndex) {
      case 0:
        currentAppBarLeadingItem = Icon(
          Icons.pages_sharp,
          color: currentThemeItemsColor,
        );
        break;
      default:
        currentAppBarLeadingItem = IconButton(
          onPressed: () {
            if (isGame && currentPageIndex == 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: currentThemeItemsColor,
                        content: Container(width: 250, height: 130),
                      ),
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: currentThemeBackgroundColor,
                        content: Container(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 15,
                            right: 15,
                          ),
                          width: 248,
                          height: 128,
                          child: Column(
                            children: [
                              Text(
                                "FORFEIT GAME?",
                                style: TextStyle(
                                  color: currentThemeItemsColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        currentPageIndex = 0;
                                        isGame = false;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: currentThemeItemsColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Yes",
                                          style: TextStyle(
                                            color: currentThemeItemsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.close,
                                          color: currentThemeItemsColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "cancel",
                                          style: TextStyle(
                                            color: currentThemeItemsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              setState(() {
                currentPageIndex = 0;
              });
            }
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: currentThemeItemsColor,
            size: 30,
          ),
        );
    }

    final userInterfaceSize = MediaQuery.of(context).size;
    final userInterfaceWidSize = userInterfaceSize.width;
    final userInterfaceHeiSize = userInterfaceSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentThemeBackgroundColor,
        leading: currentAppBarLeadingItem,
        title: Text(
          "${currentPageTitle}",
          style: TextStyle(
            color: currentThemeItemsColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: currentThemeItemsColor,
                        content: Container(width: 350, height: 150),
                      ),
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: currentThemeBackgroundColor,
                        content: Container(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 15,
                            right: 15,
                          ),
                          width: 348,
                          height: 148,
                          child: Column(
                            children: [
                              Text(
                                "Change to ${isLightTheme ? 'Dark' : 'Light'} Theme?",
                                style: TextStyle(
                                  color: currentThemeItemsColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        isLightTheme = !isLightTheme;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: currentThemeItemsColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Yes",
                                          style: TextStyle(
                                            color: currentThemeItemsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.close,
                                          color: currentThemeItemsColor,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "No",
                                          style: TextStyle(
                                            color: currentThemeItemsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.settings, color: currentThemeItemsColor),
          ),
          SizedBox(width: userInterfaceWidSize * 0.01),
        ],
      ),
      body: Container(
        color: currentThemeBackgroundColor,
        alignment: Alignment.center,
        width: userInterfaceWidSize,
        height: userInterfaceHeiSize,
        child: _buildBody(),
      ),
    );
  }
}

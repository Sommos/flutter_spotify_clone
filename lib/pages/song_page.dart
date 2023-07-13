import "package:percent_indicator/linear_percent_indicator.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "dart:math";

import "../components/neumorphic_box.dart";
import '../components/side_menu.dart';
import "home_page.dart";

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  int _currentCarouselPage = 0;
  final Random _random = Random();
  final List<String> artistNames = [
    "Polyphia", 
    "Polyphia", 
    "Polyphia", 
    "Polyphia", 
    "Polyphia",
  ];
  final List<String> songNames = [
    "Ego Death", 
    "Neurotica", 
    "The Audacity", 
    "Playing God", 
    "Chimera",
  ];
  final List<int> endTimes = [
    350, 
    194, 
    144, 
    205, 
    236,
  ];
  List<bool> favoriteStatus = [
    false, 
    false,
    false, 
    false, 
    false,
  ];
  List<bool> shuffleStatus = [
    false, 
    false,
    false, 
    false, 
    false,
  ];
  List<bool> repeatStatus = [
    false, 
    false,
    false, 
    false, 
    false,
  ];
  List<int> startTimes = [];
  List<double> progressValues = [];
  double adjustableProgressValue = 0.0;
  double originalStartValue = 0.0;
  double originalEndValue = 1.0;
  bool isMenuOpen = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  IconData menuIcon = Icons.menu;
  
  @override
  void initState() {
    super.initState();
    startTimes = List.generate(5, (_) => _random.nextInt(150));
    progressValues = startTimes.map((startTime) => startTime / 300).toList();
    originalStartValue = startTimes[_currentCarouselPage].toDouble();
    originalEndValue = endTimes[_currentCarouselPage].toDouble();
  }

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
      menuIcon = isMenuOpen ? Icons.close : Icons.menu;
    });

    if(isMenuOpen) {
      scaffoldKey.currentState?.openDrawer();
    } else {
      scaffoldKey.currentState?.openEndDrawer();
    }
  }

  void onDrawerChanged(bool isOpen) {
    setState(() {
      if(!isOpen) {
        menuIcon = Icons.menu;
      }
    });
  }

  void favorite() {
    setState(() {
      favoriteStatus[_currentCarouselPage] = !favoriteStatus[_currentCarouselPage];
    });
  }

  void shuffle() {
    setState(() {
      shuffleStatus[_currentCarouselPage] = !shuffleStatus[_currentCarouselPage];
    });
  }

  void repeat() {
    setState(() {
      repeatStatus[_currentCarouselPage] = !repeatStatus[_currentCarouselPage];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[300],
        drawer: const SideMenu(),
        onDrawerChanged: onDrawerChanged,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    SizedBox(
                      height: 60.0, 
                      width: 60.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        child: Ink(
                          child: const NeumorphicBox(
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "P L A Y L I S T", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                        fontFamily: "BigNoodleTitling",
                      )),
                    // menu button
                    InkWell(
                      onTap: toggleMenu,
                      child: SizedBox(
                        height: 60.0, 
                        width: 60.0,
                        child: NeumorphicBox(
                          child: Icon(
                            menuIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    
                const SizedBox(height: 25.0),
                
                NeumorphicBox(
                  child: Column(
                    children: [
                      // song art
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 330.0,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentCarouselPage = index;
                            });
                          },
                        ),
                        items: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset("lib/assets/images/ego_death.png"),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset("lib/assets/images/neurotica.png"),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset("lib/assets/images/the_audacity.png"),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset("lib/assets/images/playing_god.png"),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset("lib/assets/images/chimera.png"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // artist name
                                Text(
                                  artistNames[_currentCarouselPage],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    fontFamily: "BigNoodleTitling",
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                // song name
                                Text(
                                  songNames[_currentCarouselPage],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26.0,
                                    fontFamily: "BigNoodleTitling",
                                  ),
                                ),
                              ],
                            ),
                            // favorite button
                            InkWell(
                              onTap: favorite,
                              child: Icon(
                                favoriteStatus[_currentCarouselPage] ? Icons.favorite : Icons.favorite_border_outlined, 
                                color: favoriteStatus[_currentCarouselPage] ? Colors.red : Colors.grey[700],
                                size: 40.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    
                const SizedBox(height: 30.0),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // start time
                    Text(
                      formatTime(startTimes[_currentCarouselPage]),
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontFamily: "BigNoodleTitling",
                      ),
                    ),
                    // shuffle button
                    InkWell(
                      onTap: shuffle,
                      child: Icon(
                        shuffleStatus[_currentCarouselPage] ? Icons.shuffle_on_outlined : Icons.shuffle, 
                        color: shuffleStatus[_currentCarouselPage] ? Colors.black : Colors.grey[700],
                        size: 28.0,
                      ),
                    ),
                    // repeat button
                    InkWell(
                      onTap: repeat,
                      child: Icon(
                        repeatStatus[_currentCarouselPage] ? Icons.repeat_on_outlined : Icons.repeat, 
                        color: repeatStatus[_currentCarouselPage] ? Colors.black : Colors.grey[700],
                        size: 28.0,
                      ),
                    ),
                    // end time
                    Text(
                      formatTime(endTimes[_currentCarouselPage]),
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontFamily: "BigNoodleTitling",
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30.0),
    
                // progress bar
                NeumorphicBox(
                  child: Stack(
                    children: [
                      LinearPercentIndicator(
                        lineHeight: 10,
                        percent: adjustableProgressValue,
                        progressColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        barRadius: const Radius.circular(10.0),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onPanUpdate: (details) {
                            setState(() {
                              final newProgressValue = (
                                adjustableProgressValue + details.delta.dx / context.size!.width
                              ).clamp(0.0, 1.0);
                              adjustableProgressValue = newProgressValue;
                              progressValues[_currentCarouselPage] = newProgressValue;
                            });
                          },
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.black,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 2.0,
                                elevation: 0.0,
                                pressedElevation: 8.0,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 8.0,
                              ),
                            ),
                            child: Slider(
                              value: adjustableProgressValue,
                              onChanged: (newValue) {
                                setState(() {
                                  adjustableProgressValue = newValue;
                                  progressValues[_currentCarouselPage] = newValue;
                                });
                              },
                              activeColor: Colors.transparent,
                              inactiveColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    
                const SizedBox(height: 30.0),
                
                const SizedBox(
                  height: 80.0,
                  child: Row(
                    children: [
                      // previous song
                      Expanded(
                        child: NeumorphicBox(
                          child: Icon(
                            Icons.skip_previous,
                            size: 32.0,
                          ),
                        ),
                      ),
                      // pause & play button
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: NeumorphicBox(
                            child: Icon(
                              Icons.play_arrow,
                              size: 32.0,
                            ),
                          ),
                        ),
                      ),
                      // skip song
                      Expanded(
                        child: NeumorphicBox(
                          child: Icon(
                            Icons.skip_next,
                            size: 32.0,
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
      ),
    );
  }
  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    seconds = seconds % 60;
    return "$minutes:${seconds.toString().padLeft(2, "0")}";
  }
}
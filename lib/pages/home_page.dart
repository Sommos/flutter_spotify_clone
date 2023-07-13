import 'package:flutter/material.dart';

import "../components/neumorphic_box.dart";
import '../components/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  IconData menuIcon = Icons.menu;

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
                              Icons.home_outlined,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "lib/assets/images/chimera.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
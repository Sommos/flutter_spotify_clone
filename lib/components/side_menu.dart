import "package:flutter/material.dart";

import "../pages/home_page.dart";
import "../pages/song_page.dart";
import "../pages/albums_page.dart";
import "../pages/settings_page.dart";
import "../pages/login_page.dart";

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // header picture
          DrawerHeader(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "lib/assets/images/chimera.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // home button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              title: Text(
                "H O M E",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "BigNoodleTitling",
                ),
              ),
            ),
          ),
          // artists button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SongPage()),
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.person_outlined,
                color: Colors.black,
              ),
              title: Text(
                "A R T I S T S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "BigNoodleTitling",
                ),
              ),
            ),
          ),
          // albums button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AlbumsPage()),
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.album_outlined,
                color: Colors.black,
              ),
              title: Text(
                "A L B U M S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "BigNoodleTitling",
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          // settings button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
              title: Text(
                "S E T T I N G S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "BigNoodleTitling",
                ),
              ),
            ),
          ),
          // logout button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: Text(
                "L O G O U T",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "BigNoodleTitling",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
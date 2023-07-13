import "package:flutter/material.dart";

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "lib/assets/images/chimera.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "BigNoodleTitling",
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.person_outlined,
              color: Colors.black,
            ),
            title: Text(
              "Artists",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "BigNoodleTitling",
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.album_outlined,
              color: Colors.black,
            ),
            title: Text(
              "Albums",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "BigNoodleTitling",
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          const ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: Colors.black,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "BigNoodleTitling",
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: "BigNoodleTitling",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
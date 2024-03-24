import 'package:flutter/material.dart';

import '../add_delete.dart';
import '../screen/login/Login1.dart';
import '../screen/signup/sing_up.dart';

class Drawer extends StatefulWidget {
  const Drawer({super.key, required Container child});

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [
                0.1,
                0.4,
                1
              ],
              colors: [
                Color.fromARGB(255, 107, 105, 105),
                Color.fromARGB(255, 214, 214, 235),
                Color.fromARGB(255, 116, 86, 96),
              ]),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/ "),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/ "),
              ),
              accountName: Text("safwan saadan"),
              accountEmail: Text("safwan@gmail.com"),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingUpScreen(),
                    ),
                  );
                }),

            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text("Flag"),
              onTap: () {},
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),

            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Importat"),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.chat),
              title: Text("Help"),
            ),
            const ListTile(
              leading: Icon(Icons.hide_image),
              title: Text("Login"),
            ),
            const ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
            ),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Login"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LOGIN1Screen()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.outbond),
                title: const Text("LogOut"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LOGIN1Screen()),
                  );
                }),

            const ListTile(
              leading: Icon(Icons.chat),
              title: Text("Help"),
            ),
            // Row(children:[
            const ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Dark Mode"),
            ),
            //   Switch (value: switchValue,
            //   onChanged: (newValue){
            //     setState(() {
            //       switchValue = newValue;
            //     });
            //   },

            // ],),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text("History"),
            ),
            ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("manage"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

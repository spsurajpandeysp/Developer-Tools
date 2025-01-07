import 'package:flutter/material.dart';
import 'package:tools/screens/AllTools.dart';
import 'package:tools/screens/ContactUs.dart';
import 'package:tools/screens/Disclaimer.dart';
import 'package:tools/screens/DisclosurePolicy.dart';
import 'package:tools/screens/FavTools.dart';
import 'package:tools/screens/MenuBarScreen.dart';
import 'package:tools/screens/NotificationScreen.dart';
import 'package:tools/screens/PrivacyPolicy.dart';
import 'package:tools/screens/TermsConditions.dart';
import 'package:tools/screens/ToolsCat.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> widgetList = [
    ToolsCat(),
    AllTools(),
    FavTools(),
    MenuBarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the default menu icon
        title: Text(
          "SEO Tools",
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        backgroundColor: Color(0xFF1E1E2C),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.amber,
            ),
            onPressed: () {
              // Action for search button
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.amber,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1E1E2C)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.amber, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditions()));
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text('Disclaimer'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Disclaimer()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text('Disclosure Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DisclosurePolicy()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF0F0F5),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            if (index == 3) {
              _scaffoldKey.currentState?.openDrawer(); // Opens the drawer
            } else {
              myIndex = index;
            }
          });
        },
        backgroundColor: Color(0xFF1E1E2C),
        currentIndex: myIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Cat Wise Tools",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: "All Tools",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Fav Tools",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu Bar",
          ),
        ],
      ),
    );
  }
}

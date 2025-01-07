import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tools/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int activeDot = 0; // Keeps track of which dot is active
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Start the timer for animation
    Timer(
      Duration(seconds: 3),
      () => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        ),
      },
    );

    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      setState(() {
        activeDot = (activeDot + 1) % 4; // Loop through dots
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFF68bbe3), // Baby Blue as background color
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SEO Logo or Text
                Icon(
                  Icons.search,  // A search icon related to SEO tools
                  size: 80,
                  color: Color(0xFF0e86d4), // Blue Grotto color
                ),
                SizedBox(height: 20),
                Text(
                  'SEO Tools',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                // Dot indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: activeDot == index
                              ? Color(0xFF0e86d4) // Blue Grotto for active dot
                              : Colors.grey[300], // Grey for inactive dots
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pbb_wespend/login.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.yellow[600],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WSPend",
                      style: TextStyle(
                        fontFamily: "VampiroOne",
                        color: Colors.black,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Hello WSpend friends! Welcome to the WSpend application where your journey to become financially wise begins!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Roboto", fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

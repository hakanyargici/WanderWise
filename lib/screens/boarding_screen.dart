import 'package:flutter/material.dart';
import 'home_screen.dart';

class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("../assets/WanderWise.png", height: 500), // Görsel
            SizedBox(height: 32),
            Text(
              "Hoş Geldiniz",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Seyehat Etmenin En Keyifli Hali",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Açıl Susam Açıl", textAlign: TextAlign.center, style: TextStyle(fontSize:18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

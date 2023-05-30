import 'package:flutter/material.dart';
import 'package:responsi/terbaru.dart';
import 'package:responsi/daerah.dart';
import 'package:responsi/internasional.dart';
import 'package:responsi/islam.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://static.republika.co.id/files/images/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TerbaruPage()),
                    );
                  },
                  child: Text('TERBARU'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaerahPage()),
                    );
                  },
                  child: Text('DAERAH'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InternasionalPage()),
                    );
                  },
                  child: Text('INTERNASIONAL'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IslamPage()),
                    );
                  },
                  child: Text('ISLAM'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

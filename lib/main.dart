import 'package:flutter/material.dart';

void main() {
  runApp(BirthdayCardApp());
}

class BirthdayCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Card',
      home: BirthdayCardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BirthdayCardScreen extends StatefulWidget {
  @override
  _BirthdayCardScreenState createState() => _BirthdayCardScreenState();
}

class _BirthdayCardScreenState extends State<BirthdayCardScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? cardMessage;
  String? userName;

  // دالة لإعادة تعيين البيانات
  void resetForm() {
    setState(() {
      nameController.clear();
      dateController.clear();
      cardMessage = null;
      userName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Enter your birthday (YYYY-MM-DD)'),
              keyboardType: TextInputType.datetime,
            ),
            
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userName = nameController.text;
                      cardMessage =
                      '🎉 Happy birthday to you ${userName}!\n🎉 Your special day is ${dateController.text}!';
                    });
                  },
                  child: Text('Generate Card'),
                ),
                ElevatedButton(
                  onPressed: resetForm,
                  style: ElevatedButton.styleFrom(backgroundColor:Color(0xffECE5F3) ),
                  child: Text('Reset'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (cardMessage != null && userName != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/happy.jpg', // الصورة الموجودة في assets
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black54, // إضافة خلفية نص شفافة
                    padding: EdgeInsets.all(10),
                    child: Text(
                      cardMessage!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

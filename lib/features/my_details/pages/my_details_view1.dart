import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDetailsView1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDetailsView1 extends StatefulWidget {
  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsView1> {
  String? selectedGender = 'Male';
  String? selectedCountryCode = '+1';

  final List<String> countryCodes = ['+1', '+44', '+91'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Details')),
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionLabel('Full Name'),
            valueContainer('Cody Fisher'),

            sectionLabel('Email Address'),
            valueContainer('cody.@gmail.com'),

            sectionLabel('Date of Birth'),
            valueContainerWithIcon('12/07/1990', Icons.calendar_today),

            sectionLabel('Gender'),
            genderContainer(),

            sectionLabel('Phone Number'),
            phoneContainer(),

            SizedBox(height: 30),

            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),

    );
  }

  Widget sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget valueContainer(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

  Widget valueContainerWithIcon(String text, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 16)),
          Icon(icon, size: 20, color: Colors.grey),
        ],
      ),
    );
  }

  Widget genderContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedGender,
        isExpanded: true,
        underline: SizedBox(),
        items: ['Male', 'Female'].map((gender) {
          return DropdownMenuItem(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedGender = value;
          });
        },
      ),
    );
  }


  Widget phoneContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          DropdownButton<String>(
            value: selectedCountryCode,
            underline: SizedBox(),
            items: countryCodes.map((code) {
              return DropdownMenuItem(
                value: code,
                child: Row(
                  children: [
                    Text(code == '+1' ? '🇺🇸' : code == '+44' ? '🇬🇧' : '🇮🇳'),
                    SizedBox(width: 6),
                    Text(code),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCountryCode = value;
              });
            },
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text('234 453 231 506', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

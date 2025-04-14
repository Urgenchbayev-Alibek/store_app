import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Profile", style: TextStyle(fontSize: 50, color: Colors.green),)),);
  }
}

class SearchViewV2 extends StatelessWidget {
  const SearchViewV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Search", style: TextStyle(fontSize: 50, color: Colors.green),)),);
  }
}


import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Notifications"),
        leading:  BackButton(),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildSectionTitle("Today"),
          _buildNotificationTile(
            icon: Icons.local_offer_outlined,
            title: "30% Special Discount!",
            subtitle: "Special promotion only valid today.",
            highlight: true,
          ),
          _buildSectionTitle("Yesterday"),
          _buildNotificationTile(
            icon: Icons.account_balance_wallet_outlined,
            title: "Top Up E-wallet Successfully!",
            subtitle: "You have top up your e-wallet.",
          ),
          _buildNotificationTile(
            icon: Icons.location_on_outlined,
            title: "New Service Available!",
            subtitle: "Now you can track order in real-time.",
          ),
          _buildSectionTitle("June 7, 2023"),
          _buildNotificationTile(
            icon: Icons.credit_card,
            title: "Credit Card Connected!",
            subtitle: "Credit card has been linked.",
          ),
          _buildNotificationTile(
            icon: Icons.person_outline,
            title: "Account Setup Successfully!",
            subtitle: "Your account has been created.",
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool highlight = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, size: 28),
        title: Text(title, style:  TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        contentPadding:  EdgeInsets.symmetric(horizontal: 16),
        trailing: highlight
            ?  Icon(Icons.circle, color: Colors.blue, size: 10)
            : null,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
      ],
    );
  }
}

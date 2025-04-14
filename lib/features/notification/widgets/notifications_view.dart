import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/bottom_nav_bar.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Notifications"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.w,),
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
      bottomNavigationBar: StoreBottomNavBar(),
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

}

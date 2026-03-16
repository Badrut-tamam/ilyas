import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: AppTheme.textMain)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.textMain),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Alex Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "alex.doe@example.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildAccountInfoCard(),
            const SizedBox(height: 24),
            _buildMenuList(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryBlue, AppTheme.accentBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Account Number", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text("4582 1120 3345", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Icon(Icons.copy, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    final menuItems = [
      {'icon': Icons.security, 'label': 'Security'},
      {'icon': Icons.notifications_none, 'label': 'Notifications'},
      {'icon': Icons.settings_outlined, 'label': 'Settings'},
      {'icon': Icons.help_outline, 'label': 'Help'},
      {'icon': Icons.logout, 'label': 'Logout', 'color': Colors.red},
    ];

    return Column(
      children: menuItems.map((item) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          leading: Icon(item['icon'] as IconData, color: item['color'] as Color? ?? AppTheme.primaryBlue),
          title: Text(
            item['label'] as String,
            style: TextStyle(color: item['color'] as Color? ?? AppTheme.textMain, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        );
      }).toList(),
    );
  }
}

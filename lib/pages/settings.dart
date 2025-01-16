import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
        backgroundColor: Colors.indigo.shade400,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: SpinKitCircle(
                color: Color.fromARGB(255, 74, 66, 57),
                size: 50.0,
              ),
            )
          : Stack(
              children: [
                // Background gradient
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade300, Colors.indigo.shade700],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customize Your Experience',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildSettingsOption(
                              icon: Icons.person,
                              title: 'Account Settings',
                              subtitle: 'Manage your account details',
                              color: Colors.orange,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.notifications,
                              title: 'Notifications',
                              subtitle: 'Update notification preferences',
                              color: Colors.purple,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.lock,
                              title: 'Privacy & Security',
                              subtitle: 'Control your data and privacy',
                              color: Colors.blue,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.color_lens,
                              title: 'Theme',
                              subtitle: 'Personalize your app look',
                              color: Colors.green,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.help_center,
                              title: 'Help & Support',
                              subtitle: 'Get assistance and FAQs',
                              color: Colors.red,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.language,
                              title: 'Language',
                              subtitle: 'Change your app language',
                              color: Colors.teal,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.storage,
                              title: 'Storage',
                              subtitle: 'Manage your app storage',
                              color: Colors.amber,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.info,
                              title: 'About',
                              subtitle: 'Learn about this app',
                              color: Colors.pink,
                              onTap: () {},
                            ),
                            SizedBox(height: 15),
                            _buildSettingsOption(
                              icon: Icons.logout,
                              title: 'Logout',
                              subtitle: 'Sign out of your account',
                              color: Colors.redAccent,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: onTap,
      ),
    );
  }
}

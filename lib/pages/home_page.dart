import 'package:basic_app/pages/profile.dart';
import 'package:basic_app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:basic_app/pages/contact_page.dart';
import 'package:basic_app/pages/about_page.dart';
import 'package:basic_app/pages/destination_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // default active page
  String current_Active_Page = 'Home'; 

  // loading state
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // loading for 2 secounds
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
        title: Text('Home'),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 74, 66, 57),
      ),

      /// Drawer menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 74, 66, 57),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: current_Active_Page == 'Home'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('Home',
                  style: TextStyle(
                      color: current_Active_Page == 'Home'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'Home';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.place,
                  color: current_Active_Page == 'Destination'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('Destinations',
                  style: TextStyle(
                      color: current_Active_Page == 'Destination'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'Destination';
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DestinationPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info,
                  color: current_Active_Page == 'About'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('About',
                  style: TextStyle(
                      color: current_Active_Page == 'About'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'About';
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page,
                  color: current_Active_Page == 'Contact'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('Contact',
                  style: TextStyle(
                      color: current_Active_Page == 'Contact'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'Contact';
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person,
                  color: current_Active_Page == 'Profile'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('Profile',
                  style: TextStyle(
                      color: current_Active_Page == 'Profile'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'Profile';
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: current_Active_Page == 'Settings'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('Settings',
                  style: TextStyle(
                      color: current_Active_Page == 'Settings'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'Settings';
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout,
                  color: current_Active_Page == 'Logout'
                      ? Color.fromARGB(255, 115, 97, 77)
                      : Colors.black),
              title: Text('Logout',
                  style: TextStyle(
                      color: current_Active_Page == 'Logout'
                          ? Color.fromARGB(255, 115, 97, 77)
                          : Colors.black)),
              onTap: () {
                setState(() {
                  current_Active_Page = 'Logout';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      /// Home page content /////////////
      body: isLoading
          ? Center(
              child: SpinKitCircle(
                color: Color.fromARGB(255, 74, 66, 57), 
                size: 50.0,
              ),
            )
          : Stack(
              children: [
                // Background
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Recommended Places Section
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, welcome Sourav!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "We are the best travel agency. Here are some top recommended places...",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Recommended Places for you !!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        // INDONESIA
                        PlaceCard('assets/images/INDONESIA.jpg', 'Indonesia',
                            'Explore the beautiful beaches and culture.', 4),
                        SizedBox(height: 10),
                        // JAPAN
                        PlaceCard('assets/images/JAPAN.jpg', 'Japan',
                            'Discover the land of the rising sun.', 5),
                        SizedBox(height: 10),
                        // THAILAND
                        PlaceCard('assets/images/THAILAND.jpg', 'Thailand',
                            'Enjoy vibrant nightlife and serene islands.', 3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  // Method to build place card with star ratings /////////
  Widget PlaceCard(
      String imagePath, String placeName, String description, int rating) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9.0),
            child: Image.asset(imagePath),
          ),
          ListTile(
            title:
                Text(placeName, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(description),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: List.generate(rating, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.deepOrange,
                  size: 18,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

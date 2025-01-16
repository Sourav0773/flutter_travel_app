import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../models/place_rated_model.dart';
import 'edit_profile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    // Profile data using Profile model
    Profile profile = Profile(
      name: 'Sourav',
      bio: 'Loves to explore the world and meet new people.',
      profileImagePath: 'assets/images/profilepic.jpg',
      placesRated: 24,
      lastRatedPlace: 'Bangalore Palace',
    );

    // Places rated using PlaceRated model
    List<PlaceRated> ratedPlaces = [
      PlaceRated(
          imagePath: 'assets/images/background.jpg',
          placeName: 'Bali, Indonesia',
          rating: 4),
      PlaceRated(
          imagePath: 'assets/images/about.jpg',
          placeName: 'Kyoto, Japan',
          rating: 5),
      PlaceRated(
          imagePath: 'assets/images/Contact.jpg',
          placeName: 'Bangkok, Thailand',
          rating: 3),
      PlaceRated(
          imagePath: 'assets/images/VIETNAM.jpg',
          placeName: 'Bangkok, Thailand',
          rating: 2),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? Center(
              child: SpinKitCircle(
                color: Color.fromARGB(255, 74, 66, 57),
                size: 50.0,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade50, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Header
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage(profile.profileImagePath),
                          ),
                          SizedBox(height: 10),
                          Text(
                            profile.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          SizedBox(height: 5),
                          Text(profile.bio, textAlign: TextAlign.center),
                        ],
                      ),
                    ),

                    // Profile Stats
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatCard(
                              label: 'Places Rated',
                              value: '${profile.placesRated}'),
                          _StatCard(
                              label: 'Last Rated Place',
                              value: profile.lastRatedPlace),
                        ],
                      ),
                    ),

                    // Edit Profile Button
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to EditProfilePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
                        },
                        icon: Icon(Icons.edit, color: Colors.white),
                        label: Text('Edit Profile',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),

                    // Recent Places Rated Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('Recent Places Rated',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple)),
                    ),
                    SizedBox(height: 10),

                    // Grid for Rated Places
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: ratedPlaces.length,
                        itemBuilder: (context, index) {
                          final place = ratedPlaces[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(place.imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place.placeName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children:
                                        List.generate(place.rating, (index) {
                                      return Icon(Icons.star,
                                          color: Colors.amber, size: 14);
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// Stateless widget for displaying stats
class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple)),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }
}

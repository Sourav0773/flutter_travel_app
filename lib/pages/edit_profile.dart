import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    nameController.text = name;
    bioController.text = bio;

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  // default values
  String name = "Sourav";
  String bio = "Loves to explore the world and meet new people.";

  void _saveChanges() {
    setState(() {
      name = nameController.text;
      bio = bioController.text;
    });

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile Updated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(
              child: SpinKitCircle(
                color: Color.fromARGB(255, 74, 66, 57),
                size: 50.0,
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Picture Placeholder
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[300],
                      child:
                          Icon(Icons.camera_alt, size: 40, color: Colors.white),
                    ),
                    SizedBox(height: 20),

                    // Name TextField
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Bio TextField
                    TextField(
                      controller: bioController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Bio',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Save Button
                    ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      child: Text('Save Changes'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}

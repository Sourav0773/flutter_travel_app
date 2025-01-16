import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/destination_model.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  DestinationPageState createState() => DestinationPageState();
}

class DestinationPageState extends State<DestinationPage> {

  bool isLoading = true;  // Loading state
  TextEditingController searchController = TextEditingController(); // Search box text controller
  List<Destination> filteredDestinations = destinations; // Filtered list for search functionality

  @override
  void initState() {
    super.initState();
    // Loading delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    // Add listener for the search input box
    searchController.addListener(() {
      filterDestinations(searchController.text);
    });
  }

  // Filter destinations based on search query
  void filterDestinations(String query) {
    final results = destinations.where((destination) {
      return destination.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredDestinations = results;
    });
  }
 
  //Main page app bar, main page title, body design to place cards and navigation to tapped pages 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text('Destinations'),
        backgroundColor: Color.fromARGB(255, 5, 104, 94),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DestinationSearchDelegate(),
                );
              },
            ),
          ),
        ],
      ),
      //body
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
                    'assets/images/destination.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                //main heading on top of picture cards
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Your Holiday Destinations !!!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      //card placement design
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: filteredDestinations.length,
                          //navigation to tapped pages
                          itemBuilder: (context, index) {
                            final destination = filteredDestinations[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DestinationDetailPage(selectedDestination: destination),
                                  ),
                                );
                              },
                              child: DestinationCard(selectedDestination: destination),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

//card design of pictures
class DestinationCard extends StatelessWidget {
  final Destination selectedDestination;

  const DestinationCard({super.key, required this.selectedDestination});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.asset(
              selectedDestination.imagePath,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                selectedDestination.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//tapped card detail page design
class DestinationDetailPage extends StatefulWidget {
  final Destination selectedDestination;

  const DestinationDetailPage({super.key, required this.selectedDestination});

  @override
  State<DestinationDetailPage> createState() => _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage> {

  bool isLoading = true; // loading state initially true

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
        title: Text(widget.selectedDestination.title), 
        backgroundColor: Color.fromARGB(255, 5, 104, 94),
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(
              child: SpinKitCircle(
                color: Color.fromARGB(255, 74, 66, 57),
                size: 50.0,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  //image
                  Image.asset(
                    widget.selectedDestination.imagePath,  
                    height: 300,
                    width: 450,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  // Title of the destination
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      widget.selectedDestination.title,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Rating and price section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // Star rating
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < widget.selectedDestination.stars
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                            );
                          }),
                        ),
                        Spacer(),
                        // Price
                        Text(
                          '\$${widget.selectedDestination.price}', 
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // description
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Explore the beautiful sights of ${widget.selectedDestination.title}, with amazing activities such as sightseeing, cultural experiences, and natural wonders.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}


class DestinationSearchDelegate extends SearchDelegate {
  // This method builds the actions (like clear button) for the search bar
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  // This method builds the search results (only shows when user starts typing)
  @override
  Widget buildResults(BuildContext context) {
    // Filter the destinations based on the query
    final results = destinations.where((destination) {
      return destination.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // If no results are found, display a message
    if (results.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    // If there are results, display them in a ListView
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final destination = results[index];
        return ListTile(
          title: Text(destination.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DestinationDetailPage(selectedDestination: destination),
              ),
            );
          },
        );
      },
    );
  }

  // This method builds the suggestions (shows only if the user types)
  @override
  Widget buildSuggestions(BuildContext context) {
    // Show a prompt message if the search query is empty
    if (query.isEmpty) {
      return Center(
        child: Text('Start typing to search...'),
      );
    }

    // Filter the destinations based on the query for suggestions
    final suggestions = destinations.where((destination) {
      return destination.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // If no suggestions are found, display a message
    if (suggestions.isEmpty) {
      return Center(
        child: Text(
          'No suggestions found',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    // If there are suggestions, display them in a ListView
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final destination = suggestions[index];
        return ListTile(
          title: Text(destination.title),
          onTap: () {
            query = destination.title; // Set query to suggestion title
            showResults(context); // Show results immediately
          },
        );
      },
    );
  }

  // This method builds the leading widget (back button or cancel button)
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search
      },
    );
  }
}

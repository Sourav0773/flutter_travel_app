class Destination {
  final String title;
  final String imagePath;
  final int stars;
  final double price;

  Destination({
    required this.title,
    required this.imagePath,
    required this.stars,
    required this.price,
  });
}

// List of Destinations
List<Destination> destinations = [
  Destination(title: 'OMAN', imagePath: 'assets/images/OMAN.jpg', stars: 4, price: 2500),
  Destination(title: 'VAGAMON', imagePath: 'assets/images/VAGAMON.jpg', stars: 3, price: 2000),
  Destination(title: 'UZBEKISTAN', imagePath: 'assets/images/UZBEKISTAN.jpg', stars: 5, price: 3000),
  Destination(title: 'TURKEY', imagePath: 'assets/images/TURKEY.jpg', stars: 4, price: 2200),
  Destination(title: 'INDONESIA', imagePath: 'assets/images/INDONESIA.jpg', stars: 4, price: 1800),
  Destination(title: 'JAPAN', imagePath: 'assets/images/JAPAN.jpg', stars: 5, price: 3200),
  Destination(title: 'THAILAND', imagePath: 'assets/images/THAILAND.jpg', stars: 3, price: 2100),
  Destination(title: 'VIETNAM', imagePath: 'assets/images/VIETNAM.jpg', stars: 4, price: 2600),
];

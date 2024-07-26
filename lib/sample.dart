// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class Location {
//   final String city;
//   final String country;

//   Location(this.city, this.country);

//   String get displayName => '$city - $country';
// }

// class LocationProvider with ChangeNotifier {
//   final List<Location> _locations = [
//     Location('New York', 'USA'),
//     Location('Los Angeles', 'USA'),
//     Location('London', 'UK'),
//     Location('Paris', 'France'),
//     Location('Tokyo', 'Japan'),
//     Location('Berlin', 'Germany'),
//     Location('Sydney', 'Australia'),
//   ];

//   List<Location> _filteredLocations;
//   String _searchTerm = '';

//   LocationProvider() : _filteredLocations = [] {
//     _filteredLocations = List.from(_locations)..sort((a, b) => a.displayName.compareTo(b.displayName));
//   }

//   List<Location> get locations => _filteredLocations;

//   void filterLocations(String searchTerm) {
//     _searchTerm = searchTerm;
//     if (searchTerm.isEmpty) {
//       _filteredLocations = List.from(_locations)..sort((a, b) => a.displayName.compareTo(b.displayName));
//     } else {
//       _filteredLocations = _locations
//           .where((location) => location.displayName.toLowerCase().contains(searchTerm.toLowerCase()))
//           .toList()
//         ..sort((a, b) => a.displayName.compareTo(b.displayName));
//     }
//     notifyListeners();
//   }

//   void scrollToLetter(String letter, ScrollController controller) {
//     for (int i = 0; i < _filteredLocations.length; i++) {
//       if (_filteredLocations[i].displayName.startsWith(letter)) {
//         controller.jumpTo(i * 50.0); // Assuming each item has a height of 50
//         break;
//       }
//     }
//   }
// }

// class MyApp extends StatelessWidget {

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => LocationProvider(),
//       child: MaterialApp(
//         home: LocationWidget(),
//       ),
//     );
//   }
// }

// class LocationWidget extends StatefulWidget {
//   @override
//   _LocationWidgetState createState() => _LocationWidgetState();
// }

// class _LocationWidgetState extends State<LocationWidget> {
//   final ScrollController _scrollController = ScrollController();
//   bool _isMinimized = false;
//   bool _isCollapsed = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Location Widget')),
//       body: Column(
//         children: [
//           if (!_isCollapsed)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) => Provider.of<LocationProvider>(context, listen: false).filterLocations(value),
//                 decoration: const InputDecoration(
//                   labelText: 'Search',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//           if (!_isMinimized)
//             Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Consumer<LocationProvider>(
//                       builder: (context, provider, child) {
//                         return ListView.builder(
//                           controller: _scrollController,
//                           itemCount: provider.locations.length,
//                           itemBuilder: (context, index) {
//                             final location = provider.locations[index];
//                             return ListTile(
//                               title: Text(location.displayName),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   Column(
//                     children: List.generate(26, (index) {
//                       final letter = String.fromCharCode(65 + index);
//                       return InkWell(
//                         onTap: () => Provider.of<LocationProvider>(context, listen: false)
//                             .scrollToLetter(letter, _scrollController),
//                         child: Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Text(letter),
//                         ),
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.minimize),
//                 onPressed: () => setState(() => _isMinimized = !_isMinimized),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.expand_less),
//                 onPressed: () => setState(() => _isCollapsed = !_isCollapsed),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.expand_more),ini
//                 onPressed: () => setState(() {
//                   _isMinimized = false;
//                   _isCollapsed = false;
//                 }),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

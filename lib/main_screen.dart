import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Text controllers for input fields
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  String fromInput = "";
  String toInput = "";

  // List of markers
  List<Marker> list = [
    const Marker(
      point: LatLng(22.716625, 75.858397),
      child: Icon(Icons.location_pin),
    ),
    const Marker(
      point: LatLng(25.716625, 78.858397),
      child: Icon(Icons.location_pin),
    ),
    const Marker(
      point: LatLng(28.716625, 79.858397),
      child: Icon(Icons.location_pin),
    ),
  ];

  // Function to process user input
  void processUserInput() {
    // Retrieve the user input from the TextField controllers
    fromInput = fromController.text;
    toInput = toController.text;
    setState(() {});

    // Process the user input as needed
    print('From: $fromInput');
    print('To: $toInput');

    // You can add further logic here to use the input data
    // e.g., search for the route from "fromInput" to "toInput"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // FlutterMap widget
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(22.716625, 75.858397),
              initialZoom: 13,
              enableScrollWheel: true,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.maptiler.com/maps/topo-v2/{z}/{x}/{y}@2x.png?key=NmzktbKHJaZqFjxM3i3J',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: list,
              ),
            ],
          ),

          // Two containers above the SizedBox for input fields and button
          Positioned(
            top: 50, // Adjust the top position as needed
            left: 16, // Adjust the left position as needed
            right: 16, // Adjust the right position as needed
            child: Column(
              children: [
                // Container for "From" location input field
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: fromController,
                    decoration: InputDecoration(
                      labelText: 'From',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // Container for "To" location input field
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: toController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'To',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // Button to process user input
                ElevatedButton(
                  onPressed: processUserInput,
                  child: Text('search'),
                ),
              ],
            ),
          ),

          // SizedBox for list view
          (fromInput != "" && toInput != "")
              ? SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      List<List<String>> carNames = [
                        ["Uber Auto", "Uber Go", "Uber Premier"],
                        ["Ola Auto", "Quick ride", "Premium"],
                        ["Auto", "On Go ride", "Premier ride"],
                      ];
                      List<List<String>> carPrices = [
                        ["₹35", "₹51", "₹59"],
                        ["₹31", "₹52", "₹62"],
                        ["₹36", "₹49", "₹56"],
                      ];
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: MediaQuery.of(context).size.width * 1.5,
                              width: MediaQuery.of(context).size.width * 0.9,
                              color: Colors.white.withOpacity(0.8),
                              child: Center(
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Center(
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: Image.network(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                    "https://img.icons8.com/?size=100&id=pAiw3ckyxfyj&format=png&color=000000"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.37,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    carNames[index][0],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "11:00 PM | 2 min away",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "No bargaining, doorstep pick-up",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Center(
                                              child: Text(
                                                carPrices[index][0],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Center(
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: Image.network(
                                                    "https://img.icons8.com/?size=100&id=oizVkflf4uIT&format=png&color=000000"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.37,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    carNames[index][1],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "11:00 PM | 2 min away",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "Affordable compact ride",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Center(
                                              child: Text(
                                                carPrices[index][1],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Center(
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: Image.network(
                                                    "https://img.icons8.com/?size=100&id=121696&format=png&color=000000"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.37,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    carNames[index][2],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "11:03 PM | 5 min away",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "Comfortable sedans, top-quality drivers",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Center(
                                              child: Text(
                                                carPrices[index][2],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

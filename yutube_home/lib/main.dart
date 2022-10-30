import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YutubeHome(),
    );
  }
}

class YutubeHome extends StatefulWidget {
  const YutubeHome({Key? key}) : super(key: key);

  @override
  State<YutubeHome> createState() => _YutubeHomeState();
}

class _YutubeHomeState extends State<YutubeHome> {

  List<String> texts = [
    "Home",
    "Small Text",
    "Large Text large",
    "Extra large text",
    "Education",
    "Library",
    "Sports",
    "Favourites"
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "YouTube",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 100.0,
            centerTitle: false,
            floating: true,
            backgroundColor: Colors.white,
            actions: const [
              Icon(
                Icons.cast,
                color: Colors.black,
              ),
              SizedBox(
                width: 16.0,
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              ),
              SizedBox(
                width: 16.0,
              ),
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 16.0,
              ),
              CircleAvatar(
                radius: 18.0,
              ),
              SizedBox(
                width: 16.0,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                  Container(
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.compass_calibration_rounded),
                        Text("Explore"),
                      ],
                    ),
                  ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            texts.length,
                                (index) => Card(
                              color: Colors.black.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(texts[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
                  (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://source.unsplash.com/random/$index"))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

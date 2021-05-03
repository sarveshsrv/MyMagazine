import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mymagazine/details_page.dart';
import 'package:mymagazine/components/main_carousal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cinzel",
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Magazine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> images = [
    "assets/images/six.png",
    "assets/images/seven.png",
    "assets/images/eight.png",
    "assets/images/three.jpg",
    "assets/images/nine.png",
    "assets/images/ten.png",
    "assets/images/two.jpg",
    "assets/images/eleven.png",
    "assets/images/twelve.png",
    "assets/images/thirteen.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/menu_icon.svg")),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
            child: Row(
              children: [
                Icon(
                  Icons.add_a_photo_sharp,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: Center(
                    child: Text(
                      "My Magazine",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: MediaQuery.of(context).size.width * 0.30,
            endIndent: MediaQuery.of(context).size.width * 0.35,
            thickness: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          MainCarousal(
            onPageChanged: onPageChanges,
            images: images,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        onTap: (_) {
          setState(() {
            _selectedIndex = _;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAlt), label: "user"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.compass), label: "Explore"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bookmark), label: "Saved"),
        ],
      ),
    );
  }

  onPageChanges(int index, CarouselPageChangedReason phrase) {}
}

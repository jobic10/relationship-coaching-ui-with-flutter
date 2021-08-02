import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: FlutterLogo(
          size: 25,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        shrinkWrap: true, //TODO: Later Change this to see what happens
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment(0, -0.4),
                height: 100,
                color: Colors.white,
                child: Text(
                  'Get Coaching',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 90, 25, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 25, 5, 5),
                          child: Text(
                            'YOU HAVE',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 40, 5, 25),
                          child: RichText(
                            text: TextSpan(
                              text: '206',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: ' \u{1f495}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[100]!.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Buy More',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MY COACHES',
                  style: GoogleFonts.quicksand(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'VIEW PAST SESSIONS',
                  style: GoogleFonts.quicksand(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
            shrinkWrap: true, //TODO: Toggle this later
            children: [
              _buildCard('Job', 'Available', 1, true,
                  'https://loremflickr.com/g/320/240/man/all'),
              _buildCard('Job', 'Available', 2, true,
                  'https://loremflickr.com/g/320/240/woman/all'),
              _buildCard('Job', 'Available', 3, true,
                  'https://loremflickr.com/g/320/240/student/all'),
              _buildCard('Job', 'Available', 4, true,
                  'https://loremflickr.com/g/320/240/woman/all'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String status, int cardIndex, bool isAvailable,
      String imgUrl) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 7,
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            status,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Container(
              width: 175,
              decoration: BoxDecoration(
                color: isAvailable ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Request',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      margin: cardIndex.isEven
          ? EdgeInsets.fromLTRB(10, 0, 25, 10)
          : EdgeInsets.fromLTRB(25, 0, 5, 10),
    );
  }
}

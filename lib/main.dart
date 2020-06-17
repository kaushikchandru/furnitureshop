import 'package:flutter/material.dart';
import 'package:furnitureshop/CategoryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        fontFamily: 'Avenir'
      ),
      routes: {
        '/CategoryPage':(context)=>CategoryPage(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.apps,
            size: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text("Designer Furniture", style: TextStyle(
              fontSize: 30
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,bottom:30),
            child: Text("The best place to buy furniture onine", style: TextStyle(
                fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey
            ),),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  furnitureList('sofa1', "SOFA"),
                  furnitureList('sofa2', "CHAIRS"),
                  furnitureList('sofa3', "SEATING"),
                  furnitureList('sofa4', "DECOR"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Container furnitureList(String img, String name)
  {
    return Container(
      height: 170,
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Text('$name', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$img.jpg'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: (){openCategory();},
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.symmetric(vertical: 22, horizontal: 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                        color: Color(0xffff9f24),
                      ),
                      child: Center(
                        child: Text('More', style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                        ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void openCategory()
  {
    Navigator.pushNamed(context, '/CategoryPage');
  }
}


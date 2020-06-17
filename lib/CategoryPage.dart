import 'package:flutter/material.dart';
import 'package:furnitureshop/main.dart';
import 'main.dart';
import 'package:furnitureshop/ProductPage.dart';
class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir'
      ),
      home: categoryPage(),
      routes: {
        '/HomePage' : (context)=>MyApp(),
        '/ProductPage' : (context)=>ProductPage()
      },
    );
  }
}
class categoryPage extends StatefulWidget {
  @override
  _categoryPageState createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: gotoHomePage,
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.grey,
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
            child: Text('Seating', style: TextStyle(
              fontSize: 30,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 5),
            child: Text('The premium quality seating solutions', style: TextStyle(
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
                  categoryList('chair', 'Lounce Seating', 'W/ Grade 1 Vinyl'),
                  categoryList('chair2', 'Lounce Seating', 'W/ Grade 1 Vinyl'),
                  categoryList('chair3', 'Lounce Seating', 'W/ Grade 1 Vinyl'),
                  categoryList('yellowchair', 'Lounce Seating', 'W/ Grade 1 Vinyl'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Container categoryList(String img, String name, String remark)
  {
    return Container(
      height: 220,
      margin: EdgeInsets.only(bottom: 50),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xfffceade),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60)
                )
              ),
            ),
          ),
          Container(
            height: 200,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: '$img',
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/$img.png'),
                        fit:BoxFit.contain
                      )
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45,),
                    Text('$name', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 5,),
                    Text(
                      '$remark', style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                    SizedBox(height: 20,),
                    Text('\$328', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: (){openProductPage('$img');},
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
    );
  }
  void gotoHomePage()
  {
    Navigator.pushNamed(context, '/HomePage');
  }
  void openProductPage(String img)
  {
    Navigator.pushNamed(context, '/ProductPage', arguments: {'image':'$img'});
  }
}


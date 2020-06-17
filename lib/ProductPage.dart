import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String chosenImg;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    chosenImg = arguments['image'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 60,
                  child: Center(
                    child: Text('01', style: TextStyle(
                      color: Color(0xffffcdb6),
                      fontSize: 50,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Skirtteum \nChair', style: TextStyle(
                        fontSize: 40
                      ),),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.only(right: 80),
                        child: Text('This chair is trim, clever and quite the looker. The uphostered seat and adjustable height provide a comfy seating for hours.', style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange.withOpacity(0.5)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange.withOpacity(0.5)
                            ),
                          ),
                          SizedBox(width: 40,),

                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 160),
                        decoration: BoxDecoration(
                          color: Color(0xfffceade),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Hero(
                            tag: '$chosenImg',
                            child: Container(
                              height: 300,
                              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/$chosenImg.png'),
                                  fit: BoxFit.contain
                                )
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.only(left: 40),
                            child: GridView.count(crossAxisCount: 2,
                              childAspectRatio: 5.5,
                              children: <Widget>[
                                Text('Style'),
                                Text("Cushion Type"),
                                Text("Modern", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700
                                ),),
                                Text("Soft", style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700
                                ),),
                                SizedBox(height: 20,),
                                SizedBox(height: 20,),
                                Text('Size'),
                                Text("Height"),
                                Text("Standard", style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700
                                ),),
                                Text("Standard", style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700
                                ),),

                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                            color: Color(0xffff9f24),
                          ),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Text('Next', style: TextStyle(
                                  color: Colors.white,
                                   fontSize: 17
                                ),),
                                Container(
                                  width: 20,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

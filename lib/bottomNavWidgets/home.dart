import 'package:flutter/material.dart';
import 'package:news_1st_app/constants.dart';
import '../pubg_widgets/navigationDrawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              Icons.add_circle_outlined,
              color: primaryColor,
              size: 30,
            ),
          )
        ],
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              highlightColor: Colors.white,
              icon: Icon(
                Icons.menu_rounded,
                color: primaryColor,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        // iconTheme: IconThemeData(color: primaryColor, size: 30),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Dzuabry',
          style:
              TextStyle(color: Colors.grey[600], fontFamily: 'Times new roman'),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 35,
        ),
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  hintText: 'Qué quieres leer?',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                            labelStyle: TextStyle(fontFamily: 'Roboto'),
                            indicatorColor: Colors.black,
                            labelColor: Colors.black,
                            tabs: [
                              Tab(
                                text: 'Para usted',
                              ),
                              Tab(
                                text: 'Tendencias',
                              ),
                              Tab(
                                text: 'Deportes',
                              ),
                              Tab(
                                text: 'Politics',
                              ),
                            ]),
                      ), // Row of Tabs
                      Container(
                        width: double.infinity,
                        height: screenSize.width > 768
                            ? screenSize.height - 50
                            : 480,
                        child: TabBarView(children: [
                          Container(
                              child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'images/profilePic.png'),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'E.U News',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(Icons.verified),
                                            ],
                                          ),
                                          Text(
                                            '11:45 AM',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        height:
                                            screenSize.width > 756 ? 500 : 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/postImage.png'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        textAlign: TextAlign.start,
                                        'El presidente Hernández visita la UE',
                                        style: TextStyle(
                                            fontFamily: 'Roboto', fontSize: 20),
                                      ),
                                      SizedBox(height: 15),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          fixedSize: Size.fromHeight(40),
                                          side: const BorderSide(
                                            width: 1.5,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        child: const Text('leer',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.normal)),
                                        onPressed: () {},
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.thumb_up_outlined,
                                            ),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.thumb_down_outlined,
                                            ),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.comment,
                                            ),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.share,
                                              size: 30,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ); //
                            },
                          )),
                          Container(), // Tab2Data
                          Container(), // Tab3Data
                          Container(), // Tab4Data
                        ]),
                      ), // Content of Tabs
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

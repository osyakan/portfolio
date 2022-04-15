import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

//後で下に移す
class SecondRoute extends StatelessWidget{
  const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // get screensize
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //コンテンツのタイトルと画像(Map型)
    List mycontents = [
      ['1', 'assets/programmer.png'],
      ['2', 'assets/programmer.png'],
      ['3', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("secondpage"),
        centerTitle: true,
      ),
      body: Text("hogehoge"),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kusakabe Kan's portfolio",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: "Kusakabe Kan's portfolio"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // get screensize
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //コンテンツのタイトルと画像(Map型)
    List mycontents = [
      ['1', 'assets/programmer.png'],
      ['2', 'assets/programmer.png'],
      ['3', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
      ['4', 'assets/programmer.png'],
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: screenHeight * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              title: Center(
                child: Text(
                    "Kusakabe Kan's portfolio",
                  style: TextStyle(
                    fontSize: screenWidth*0.035,
                  ),
                ),
              ),
              // Text("Kusakabe Kan's portfolio"),
              background: Image.asset('assets/programmer.png', fit: BoxFit.cover),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
              children: mycontents.asMap().entries.map((i){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      // PageTransition(
                      //   child: SecondRoute(),
                      //   type: PageTransitionType.leftToRight,
                      // ),
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => SecondRoute(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return OpenUpwardsPageTransitionsBuilder().buildTransitions(
                              MaterialPageRoute(builder: (context)=>SecondRoute()),
                              context,
                              animation,
                              secondaryAnimation,
                              child
                          );
                        }
                      ),
                      // MaterialPageRoute(builder: (context){return SecondRoute();}),
                      // MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[100*i.key],
                    ),
                    margin: EdgeInsets.all(screenHeight*0.01),
                    child: Column(
                      children: [
                        Text(i.value[0]),
                        Image.asset(i.value[1], fit: BoxFit.cover),
                      ]),
                ));
              }).toList()
          ),
        ],
      ),
    );
  }
}


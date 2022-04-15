import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kusakabe Kan's portfolio",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: "Kusakabe Kan's portfolio"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

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

    final sampleGridList =[
      Text("helli"),
      Text("helli"),
      Text("helli"),
      Text("helli"),
      Text("helli"),
      Text("helli"),
      Text("helli"),
      Text("helli"),
      Text("helli"),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),

      //added 4/15 9:37
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
            // flexibleSpace: Image.asset('assets/programmer.png', fit: BoxFit.cover),
            // bottom: PreferredSize(
            //   child: Text('this is bottom'),
            //   preferredSize :Size.fromHeight(screenHeight*0.0),
            // ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
              children: mycontents.asMap().entries.map((i){
                return InkWell(
                  onTap: (){},
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
            // children: mycontents.map((index){
            //   return Container(
            //     color: Colors.blue,
            //     child: Column(
            //         children: [
            //           Text(i[0]),
            //           Image.asset(i[1], fit: BoxFit.cover),
            //         ]),
            //   );
            // }).toList()
          ),

          // SliverList(
          //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //     return Container(padding: EdgeInsets.all(5.0), child: Text('Row_$index'));
          //   }),
          // ),
        ],
      ),

      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


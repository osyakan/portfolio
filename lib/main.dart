import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

//後で下に移す
class SecondRoute extends StatelessWidget{
  // added
  SecondRoute(this.child_list);
  List<String> child_list;

  // const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // get screensize
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(child_list[0]),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(screenWidth*0.08),
          child: Column(
            children: [
              // Text("title"),
              Image.asset(child_list[1], fit: BoxFit.cover),
              Text(child_list[2]),
              InkWell(
                child: Text(child_list[3]),
                onTap: () async{
                  if (await canLaunch(child_list[3])){
                    await launch(
                      child_list[3],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
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
      ['title',
        'assets/programmer.png',
        '''
        detail of the content
        ''',
        'https://github.com/osyakan'],
      ['1', 'assets/programmer.png',
        '''
        どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。
        吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。
        この書生というのは時々我々を捕えて煮て食うという話である。しかしその当時は何という考もなかったから別段恐しいとも
        思わなかった。ただ彼の掌に載せられてスーと持ち上げられた時何だかフワフワした感じがあったばかりである。掌の上で少
        し落ちついて書生の顔を見たのがいわゆる人間というものの見始であろう。この時妙なものだと思った感じが今でも残ってい
        る。第一毛をもって装飾されべきはずの顔がつるつるしてまるで薬缶だ。その後猫にもだいぶ逢ったがこんな片輪には一度も
        出会わした事がない。のみならず顔の真中があまりに突起している。そうしてその穴の中から時々ぷうぷうと煙を吹く。どう
        も咽せぽくて実に弱った。これが人間の飲む煙草というものである事はようやくこの頃知った。
　      この書生の掌の裏でしばらくはよい心持に坐っておったが、しばらくすると非常な速力で運転し始めた。書生が動くのか自分
        だけが動くのか分らないが無暗に眼が廻る。胸が悪くなる。到底助からないと思っていると、どさりと音がして眼から火が出た。それまで
は記憶しているがあとは何の事やらいくら考え出そうとしても分らない。
        ''',
        'https://github.com/osyakan'],
      ['2', 'assets/programmer.png', 'title2', 'datail2'],
      ['3', 'assets/programmer.png', 'title3', 'datail3'],
      ['4', 'assets/programmer.png', 'title4', 'datail4'],
      ['4', 'assets/programmer.png', 'title5', 'datail5'],
      ['4', 'assets/programmer.png', 'title6', 'datail6'],
      ['4', 'assets/programmer.png', 'title7', 'datail7'],
      ['4', 'assets/programmer.png', 'title8', 'datail8'],
      ['4', 'assets/programmer.png', 'title9', 'datail9'],
      ['4', 'assets/programmer.png', 'title10', 'datail10'],
      ['4', 'assets/programmer.png', 'title11', 'datail11'],
      ['4', 'assets/programmer.png', 'title12', 'datail12'],
      ['4', 'assets/programmer.png', 'title13', 'datail13'],
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
                        pageBuilder: (context, animation, secondaryAnimation) => SecondRoute(i.value),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return OpenUpwardsPageTransitionsBuilder().buildTransitions(
                              MaterialPageRoute(builder: (context)=>SecondRoute(i.value)),
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


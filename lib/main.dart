import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

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
        primarySwatch: Colors.cyan,
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
      ['ヘビVR',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['https://github.com/osyakan', 'youtube-url'],
      ],
      ['ハンドジェスチャアプリ',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['https://github.com/osyakan', 'youtube-url'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],
      ['コンテンツ名',
        'assets/programmer.png',
        '''
        コンテンツの詳細明記
        ''',
        ['url1', 'url2', '...', 'urlN'],
      ],


    ];
    double agesize = screenWidth*0.02;
    double schoolnamesize = screenWidth*0.018;
    double detailsize = screenWidth*0.018;
    final _random = Random();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: screenHeight * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                    "Kusakabe Kan's portfolio",
                  style: TextStyle(
                    fontSize: screenWidth*0.035,
                  ),
                ),
              centerTitle: true,
              background: Stack(
                children:[
                  Positioned(
                    top: 0,
                      child: SizedBox(
                        height: screenHeight*0.3,
                        width: screenWidth,
                        child: Image.asset('assets/programmer.png', fit: BoxFit.cover),
                      ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    // decoration: BoxDecoration(color: Colors.green),
                    // margin: EdgeInsets.all(screenWidth*0.08),
                    child: Container(
                      margin: EdgeInsets.all(screenWidth*0.04),
                      child: Row(
                        children:[
                          Image.asset('assets/programmer.png', width: screenWidth*0.3,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("北海道大学情報科学院M1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth*0.025,),),
                              Text("ヒューマンコンピュータインタラクション研究室所属", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth*0.025,),),
                              Text("email:kusakabe.kan.v5[@]elms.hokudai.ac.jp"),
                              url2link('https://github.com/osyakan', name:'githubアカウント'),
                              url2link('https://twitter.com/HCI_kan', name: '@HCI_kan'),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                    Container(
                      margin: EdgeInsets.all(screenWidth*0.03),
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.top,
                        columnWidths: <int, TableColumnWidth>{
                          0: FixedColumnWidth(screenWidth*0.13),
                          1: FixedColumnWidth(screenWidth*0.25),
                          2: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                            children:[
                              Text("経歴",style: TextStyle(fontSize: agesize*1.5,),),
                              Text(""),
                              Text(""),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text("2015 - 2020",style: TextStyle(fontSize: agesize,),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("岐阜工業高等専門学校",style: TextStyle(fontSize: schoolnamesize,),),
                                  Text("電気情報工学科",style: TextStyle(fontSize: schoolnamesize,),),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("全国高等専門学校体育大会柔道競技の部団体3連覇(2020)",style: TextStyle(fontSize: detailsize),),
                                  Text("全国高等専門学校体育大会柔道競技の部個人準優勝(2020)",style: TextStyle(fontSize: detailsize),),
                                  url2link("https://www.gifu-nct.ac.jp/elec/deguchi/sotsuron/kusakabe.pdf", name:"卒業研究", urlsize: detailsize),
                                ]
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text("2020 - 2022",style: TextStyle(fontSize: agesize,),),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("北海道大学情報エレクトロニクス学科",style: TextStyle(fontSize: schoolnamesize,),),
                                  Text("ヒューマンコンピュータインタラクション研究室",style: TextStyle(fontSize: schoolnamesize,),),
                                ],
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    url2link("http://www.sighci.jp/events/sig/197", name: "無段階調整インタフェースのためのハンドジェスチャによる操作手法の探索的研究(HCI197)", urlsize: detailsize),
                                  ]
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ]
              ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
              children: mycontents.asMap().entries.map((i){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
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
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.teal[10*i.key+100],
                      color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                      [_random.nextInt(9) * 100],
                    ),
                    margin: EdgeInsets.all(screenHeight*0.015),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(i.value[0],style: TextStyle(fontSize: screenWidth*0.02,),),
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

//detail page
class SecondRoute extends StatelessWidget{
  // added
  SecondRoute(this.child_list);
  List child_list;


  // const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // get screensize
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print(child_list[3]);

    return Scaffold(
      appBar: AppBar(
        // title: Text(child_list[0]),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(screenWidth*0.08),
            child: Column(
              children: [
                Text(child_list[0],style: TextStyle(fontSize: screenWidth*0.04,),),
                Image.asset(child_list[1], fit: BoxFit.cover),
                Text(child_list[2]),
                Column(
                  children: child_list[3].map<Widget>((String url)=>url2link(url)).toList(),
                ),
              ],
            ),
          ),
        ),),
    );
  }
}

//URLの文字列からハイパーリンクを返す関数
Widget url2link(String url, {String? name, double? urlsize}){
  return InkWell(
    child: Text(name is Null?url:name, style: urlsize is Null?TextStyle(color: Colors.blue, decoration: TextDecoration.underline):TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: urlsize),),
    onTap: () async{
      if (await canLaunch(url)){
        await launch(
          url,
        );
      }
    },
  );
}

//年号<String>, 学校名<String>, 詳細 List<String>を渡して



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "日下部完のポートフォリオ",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: "Noto Sans JP",
      ),
      locale: Locale("ja", "JP"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ja", ""),
      ],
      home: const MyHomePage(title: "日下部完のポートフォリオ"),
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
    if (screenWidth>screenHeight){
      double tmp = screenHeight;
      screenHeight = screenWidth;
      screenWidth = tmp;
    }

    // 表示するコンテンツ
    List contents = [
      {
        'title'       : 'ヘビVR',
        'pic'         : 'assets/snakeVR_pic.jpg',
        'detail'      :
'''
ヘビの視覚を体験するOculus Quest2用のアプリケーション。
ヘビはピット器官と呼ばれる器官を通して赤外線が見えているらしく、このアプリケーションはそんな赤外線の可視化を体験しながら、30秒間でいくつの餌（ネズミ）を捕食できるかを計るゲームです。
開発にはゲームエンジンのUnityを利用してC#をコーディングしました。
このプロジェクトは北大テックガレージ(リンク下記)のプログラム参加中に作成しました。
''',
        'url'         : ['https://github.com/osyakan/snakeVR_app', 'https://www.youtube.com/watch?v=cCAgF45Rq8Q', "https://u4u.oeic.hokudai.ac.jp/6146/", 'https://www.youtube.com/watch?v=fDU2Zfb23Mk'],
      },
      {
        'title'       : 'ハンドジェスチャアプリケーション',
        'pic'         : 'assets/handgesture_pic.jpg',
        'detail'      :
'''
ウェブカメラを入力に利用したハンドジェスチャで遊ぶアプリケーション。
HCI197の研究用に作成したタスク実行アプリケーションを改造し、タスクをただひたすら行うアプリケーションにしました。
開発言語にはpythonを選択し、コアとなるライブラリにはopenCVとgoogleから公開されているmediapipeを利用しています。
以上のライブラリから手のランドマークを取得し、処理を行っています。具体的には手をつまむような動作をトリガーとして、ハンドジェスチャ入力を受け付けます。
手のランドマークを絶対座標から相対座標へ変換し、そこからつまむハンドポーズを検知し、指定されたハンドジェスチャごとに動きに合わせて処理を行います。
''',
        'url'         : ['https://github.com/osyakan/handgesture_app', 'https://www.youtube.com/watch?v=jzVdSQoVtjo'],
      },
      {
        'title'       : 'このサイト',
        'pic'         : 'assets/website_pic.png',
        'detail'      :
'''
ポートフォリオ用ウェブサイトを作成するにあたって、せっかくなのでいろいろ自作しました。
フロントエンドはFlutter web（Dart）を利用し、バックエンドはGithubとFirebaseを連携させて運用しています。
''',
        'url'         : ['https://github.com/osyakan/portfolio'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
      {
        'title'       : 'no content',
        'pic'         : 'assets/nocontent.png',
        'detail'      : 'detail of content',
        'url'         : ['other url1', '...', 'other urlN'],
      },
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
                    "日下部完のポートフォリオ",
                  style: TextStyle(
                    fontSize: screenWidth*0.03,
                  ),
                ),
              centerTitle: true,
              background: Stack(
                alignment: AlignmentDirectional.center,
                children:[
                  Positioned(
                    top: 0,
                      child: SizedBox(
                        height: screenHeight*0.3,
                        width: screenWidth,
                        child: Image.asset('assets/header.png', fit: BoxFit.contain ),
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
                    alignment: AlignmentDirectional.center,
                    child: Container(
                      margin: EdgeInsets.all(screenWidth*0.04),
                      child: Row(
                        children:[
                          Image.asset('assets/profile1.jpg', width: screenWidth*0.3,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("北海道大学大学院情報科学院M1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth*0.025,),),
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
                                    url2link("http://www.gakujuren.or.jp/101.html", name: "全日本学生柔道優勝大会出場", urlsize: detailsize),
                                    url2link("http://www.gakujuren.or.jp/102.html", name: "全日本学生柔道体重別選手権大会出場", urlsize: detailsize),
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
              children: contents.asMap().entries.map((i){
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(i.value['title'],style: TextStyle(fontSize: screenWidth*0.02,fontWeight: FontWeight.bold),),
                        Image.asset(i.value['pic'], fit: BoxFit.contain),
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
  Map child_list;
  // const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // get screensize
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (child_list['url'].length != 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            child_list['title'],
            style: TextStyle(fontSize: screenWidth * 0.04,),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(screenWidth * 0.08),
              child: Column(
                children: [
                  // Text(
                  //   child_list['title'],
                  //   style: TextStyle(
                  //     fontSize: screenWidth * 0.04,
                  //   ),
                  // ),
                  Image.asset(child_list['pic'], fit: BoxFit.contain),
                  Text(child_list['detail'],
                    style: TextStyle(fontSize: screenWidth * 0.02,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth*0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: child_list['url']
                          .map<Widget>((String url) => url2content(url))
                          .toList(),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          child_list['title'],
          style: TextStyle(fontSize: screenWidth * 0.04,),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(screenWidth * 0.08),
            child: Column(
              children: [
                Image.asset(child_list['pic'], fit: BoxFit.contain),
                Text(child_list['detail'],
                  style: TextStyle(fontSize: screenWidth * 0.02,),
                ),
              ],
            ),
          ),
        ),
      ),
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

Widget url2youtubeplayer(String url){
  if (url == ''){
    print("yes come in ");
    return SizedBox.shrink();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: url.split('v=').last,
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
      autoPlay: false,
    ),
  );
  return YoutubePlayerControllerProvider(
    controller: _controller,
    child: YoutubePlayerIFrame(
      aspectRatio: 16 / 9,
    ),
  );
}

Widget url2content(String url){
  if(url.contains('youtube.com')){
    return url2youtubeplayer(url);
  }
  return url2link(url);
}



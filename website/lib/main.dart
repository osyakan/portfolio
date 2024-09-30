// reference: https://qiita.com/ampersand-dev/items/61ed134f871e7eab95ae
import 'package:flutter/material.dart';
import 'responsive_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/project_page.dart';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Kan Kusakabe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioPage(changeLanguage: _changeLanguage),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  final void Function(Locale) changeLanguage;

  PortfolioPage({required this.changeLanguage});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(3, (_) => GlobalKey());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    // Drawerを閉じる
    if (ResponsiveWidget.isSmallScreen(this.context)) {
      _scaffoldKey.currentState?.closeDrawer();
    }
  }

  Widget _buildContent() {
    return ListView(
      controller: _scrollController,
      children: [
        Section(
            key: _sectionKeys[0],
            title: AppLocalizations.of(context)!.header,
            content: HomeContent()),
        Section(
            key: _sectionKeys[1],
            title: AppLocalizations.of(context)!.project,
            content: ProjectContent()),
        Section(
            key: _sectionKeys[2],
            title: AppLocalizations.of(context)!.publication,
            content: PublicationContent()),
      ],
    );
  }

  Widget _buildNavigation() {
    return ResponsiveWidget(
      largeScreen: mainBuilder(),
      mediumScreen: mainBuilder(),
      smallScreen: SizedBox.shrink(),
    );
  }

  // メインのナビゲーション
  Container mainBuilder() {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // 左寄せ
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            // 画像は円形にする
            child: ClipOval(
              child: Image.asset('image/kan.png'),
            ),
          ),
          SizedBox(height: 20),
          NavLink(title: 'Home', onTap: () => _scrollToSection(0)),
          NavLink(title: 'Projects', onTap: () => _scrollToSection(1)),
          NavLink(title: 'Publications', onTap: () => _scrollToSection(2)),
          // 横向きに連絡先のアイコンを表示, アイコンはクリックするとリンク先に飛ぶ
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.mail),
                onPressed: () => launchUrl(
                    Uri.parse('mailto:kusakabe.kan.v5@lems.hokudai.ac.jp')),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram),
                onPressed: () =>
                    launchUrl(Uri.parse('https://www.instagram.com/hci_kan/')),
              ),
              IconButton(
                // x.com
                icon: FaIcon(FontAwesomeIcons.xTwitter),
                onPressed: () => launchUrl(Uri.parse('https://x.com/HCI_kan')),
              ),
              IconButton(
                // x.com
                icon: FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/kan-kusakabe-a83589239/')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            // add padding to the left
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              // paddingを追加
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('image/kan.png'),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.home,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => _scrollToSection(0),
          ),
          SizedBox(height: 20),
          ListTile(
            // テキストをボルドにする
            title: Text(
              AppLocalizations.of(context)!.project,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => _scrollToSection(1),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.publication,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => _scrollToSection(2),
          ),
          SizedBox(height: 20),
          // 横向きに連絡先のアイコンを表示, アイコンはクリックするとリンク先に飛ぶ
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.mail),
                onPressed: () => launchUrl(
                    Uri.parse('mailto:kusakabe.kan.v5@lems.hokudai.ac.jp')),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram),
                onPressed: () =>
                    launchUrl(Uri.parse('https://www.instagram.com/hci_kan/')),
              ),
              IconButton(
                // x.com
                icon: FaIcon(FontAwesomeIcons.xTwitter),
                onPressed: () => launchUrl(Uri.parse('https://x.com/HCI_kan')),
              ),
              IconButton(
                // x.com
                icon: FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/kan-kusakabe-a83589239/')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          // 言語切り替え
          TextButton(
            onPressed: () => setState(() {
              widget.changeLanguage(Locale('en'));
            }),
            child: Text('EN', style: TextStyle(color: Colors.black)),
          ),
          Text("/"),
          TextButton(
            onPressed: () => setState(() {
              widget.changeLanguage(Locale('ja'));
            }),
            child: Text('JP', style: TextStyle(color: Colors.black)),
          ),
        ],
        // smallScreenの場合はDrawerを表示
        leading: ResponsiveWidget.isSmallScreen(context)
            ? IconButton(
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: Icon(Icons.menu),
              )
            : null,
      ),
      drawer: ResponsiveWidget.isSmallScreen(context) ? _buildDrawer() : null,
      body: Row(
        children: [
          if (!ResponsiveWidget.isSmallScreen(context)) _buildNavigation(),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget content;

  const Section({required Key key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // サイドのパディングは16, 上下は8
      padding: EdgeInsets.symmetric(
          horizontal:
              min(max(MediaQuery.of(context).size.width * 0.024, 16), 100),
          vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline4),
          SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}

class NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double fontsize;

  const NavLink({
    Key? key,
    required this.title,
    required this.onTap,
    this.fontsize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: fontsize, vertical: fontsize / 2),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.selfIntrodution,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class ProjectContent extends StatelessWidget {
  // titleとimageを横に並べたプロジェクトを縦に並べる
  @override
  Widget build(BuildContext context) {
    // ローカライゼーションのインスタンスを取得
    final localizations = AppLocalizations.of(context)!;
    // Listでプロジェクトの内容を記述（title, image, youtubelink, youtubelink_sub, description, doi, publication1, publication2）
    final List<Map<String, dynamic>> projects = [
      {
        'title': localizations.p1Title,
        'image': localizations.p1Image,
        'youtubelink': localizations.p1Youtubelink,
        'youtubelink_sub': localizations.p1Youtubelink_sub,
        'description': localizations.p1Description,
        'doi1': localizations.p1Doi1,
        'doi2': localizations.p1Doi2,
        'doi3': localizations.p1Doi3,
        'publication1': localizations.p1Publication1,
        'publication2': localizations.p1Publication2,
        'publication3': localizations.p1Publication3,
      },
      {
        'title': localizations.p2Title,
        'image': localizations.p2Image,
        'youtubelink': localizations.p2Youtubelink,
        'youtubelink_sub': localizations.p2Youtubelink_sub,
        'description': localizations.p2Description,
        'doi1': localizations.p2Doi1,
        'doi2': localizations.p2Doi2,
        'doi3': localizations.p2Doi3,
        'publication1': localizations.p2Publication1,
        'publication2': localizations.p2Publication2,
        'publication3': localizations.p2Publication3,
      },
      {
        'title': localizations.p3Title,
        'image': localizations.p3Image,
        'youtubelink': localizations.p3Youtubelink,
        'youtubelink_sub': localizations.p3Youtubelink_sub,
        'description': localizations.p3Description,
        'doi1': localizations.p3Doi1,
        'doi2': localizations.p3Doi2,
        'doi3': localizations.p3Doi3,
        'publication1': localizations.p3Publication1,
        'publication2': localizations.p3Publication2,
        'publication3': localizations.p3Publication3,
      },
    ];
    return Column(
      children: projects
          .map(
            (project) => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProjectPage(
                          title: project['title'],
                          image: project['image'],
                          youtubelink: project['youtubelink'],
                          youtubelink_sub: project['youtubelink_sub'],
                          description: project['description'],
                          doi1: project['doi1'],
                          doi2: project['doi2'],
                          doi3: project['doi3'],
                          publication1: project['publication1'],
                          publication2: project['publication2'],
                          publication3: project['publication3'],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      // もしscreenが小さい場合は画像を表示しない
                      if (!ResponsiveWidget.isSmallScreen(context))
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.asset(project['image']),
                        ),
                      if (!ResponsiveWidget.isSmallScreen(context))
                        SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          project['title'],
                          style: TextStyle(
                            fontSize: min(
                                max(MediaQuery.of(context).size.width * 0.024,
                                    20),
                                25),
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
          .toList(),
    );
  }
}

class PublicationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Publications content goes here');
  }
}

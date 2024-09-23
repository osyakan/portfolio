// reference: https://qiita.com/ampersand-dev/items/61ed134f871e7eab95ae
import 'package:flutter/material.dart';
import 'responsive_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/project_page.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
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
            key: _sectionKeys[0], title: 'About me', content: HomeContent()),
        Section(
            key: _sectionKeys[1], title: 'Projects', content: ProjectContent()),
        Section(
            key: _sectionKeys[2],
            title: 'Publications',
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
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () => _scrollToSection(0),
          ),
          ListTile(
            title: Text('Projects'),
            onTap: () => _scrollToSection(1),
          ),
          ListTile(
            title: Text('Publications'),
            onTap: () => _scrollToSection(2),
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
        title: Text('Kan\'s Portfolio'),
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
          """
 I am a senior lecturer and researcher at the HCI lab of Jürgen Steimle at Saarland University. Previously, I was head of the HCI group at the Telecooperation Lab of Max Mühlhäuser at TU Darmstadt. I received a doctoral degree from TU Darmstadt where I explored 3D-printed interfaces. I have a background in computer science, psychology, and visual computing.

In addition, I have been an affiliated researcher at the SIRIUS Lab , lead by Mohamed Khamis, at the University of Glasgow from 2021 to 2022, where we have investigated tangible approaches to more useable security. Starting from July 2022, I am also an affiliated and visiting researcher at the HCC section, lead by Kasper Hornbæk, at the University of Copenhagen. Together with Daniel Ashbrook, we explore approaches to 3D print haptics, combining my previous research on Fabrication and Haptics.

My current research interests are at the intersection of Human-Machine Interfaces and Digital Fabrication, but also include Extended Reality and Haptics. In particular, I enjoy to design, build, and evaluate interfaces that strive to be tailored to individual users or use cases rather than to a common denominator. Feel free to check out my recent publications or contact me. 
""",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class ProjectContent extends StatelessWidget {
  // Listでプロジェクトの内容を記述（title, image, youtubelink, youtubelink_sub, description, doi, publication1, publication2）
  final List<Map<String, dynamic>> projects = [
    {
      'title':
          'RingSenseRingSense: Exploring User-Defined Gestures for Phone Ring Holders',
      'image': 'image/project1.png',
      'youtubelink': 'https://youtu.be/qIABHe3MKs8',
      'youtubelink_sub': 'https://youtu.be/JmkBwZaJJ9w',
      'description':
          'Project 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes hereProject 1 description goes here',
      'doi1': 'https://doi.org/10.12345',
      'doi2': 'https://doi.org/10.12345',
      'publication1': 'Publication 1',
      'publication2': 'Publication 2',
    },
    {
      'title': 'Project 2',
      'image': 'image/project2.png',
      'youtubelink': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'youtubelink_sub': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'description': 'Project 2 description goes here',
      'doi1': 'https://doi.org/10.12345',
      'doi2': 'https://doi.org/10.12345',
      'publication1': 'Publication 1',
      'publication2': 'Publication 2',
    },
    {
      'title': 'Project 3',
      'image': 'image/project3.png',
      'youtubelink': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'youtubelink_sub': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'description': 'Project 3 description goes here',
      'doi1': 'https://doi.org/10.12345',
      'doi2': 'https://doi.org/10.12345',
      'publication1': 'Publication 1',
      'publication2': 'Publication 2',
    },
    {
      'title': 'Project 2',
      'image': 'image/project2.png',
      'youtubelink': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'youtubelink_sub': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'description': 'Project 2 description goes here',
      'doi1': 'https://doi.org/10.12345',
      'doi2': 'https://doi.org/10.12345',
      'publication1': 'Publication 1',
      'publication2': 'Publication 2',
    },
    {
      'title': 'Project 3',
      'image': 'image/project3.png',
      'youtubelink': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'youtubelink_sub': 'https://www.youtube.com/watch?v=2QjAquJL4R0',
      'description': 'Project 3 description goes here',
      'doi1': 'https://doi.org/10.12345',
      'doi2': 'https://doi.org/10.12345',
      'publication1': 'Publication 1',
      'publication2': 'Publication 2',
    },
  ];
  // titleとimageを横に並べたプロジェクトを縦に並べる
  @override
  Widget build(BuildContext context) {
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
                          publication1: project['publication1'],
                          publication2: project['publication2'],
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

// reference: https://qiita.com/ampersand-dev/items/61ed134f871e7eab95ae
import 'package:flutter/material.dart';
import 'responsive_widget.dart';
import 'pages/home_page.dart' as home;
import 'pages/project_page.dart' as project;
import 'pages/publication_page.dart' as publication;

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
      home: MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    home.HomePage(),
    project.ProjectPage(),
    publication.PublicationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.work),
                  label: Text('Projects'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.library_books),
                  label: Text('Publications'),
                ),
              ],
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
        mediumScreen: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.work),
                  label: Text('Projects'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.library_books),
                  label: Text('Publications'),
                ),
              ],
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
        smallScreen: Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'Publications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

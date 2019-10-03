import 'package:flutter/material.dart';
import 'trial.dart';
import 'package:my_acuvue_flutter/utilities/home_drawer.dart';

class Home extends StatefulWidget {
  static const String route = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('MuAcuvue™'),
          ),
          drawer: AppDrawer(),
          body: TabBarView(
            children: [
              PlaceholderWidget(Colors.red),
              PlaceholderWidget(Colors.orange),
              PlaceholderWidget(Colors.yellow),
              PlaceholderWidget(Colors.blueAccent),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Points',
              ),
              Tab(
                icon: Icon(Icons.attach_money),
                text: 'Rewards',
              ),
              Tab(
                icon: Icon(Icons.store_mall_directory),
                text: 'Store',
              )
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}

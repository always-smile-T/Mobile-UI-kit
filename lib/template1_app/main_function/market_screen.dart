import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int carClick = 0;
  int transitClick = 0;
  int bikeClick = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: createTabBar(),
            title: Text('Flutter TabBar Example'),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Car")),
              Center(child: Text("Transit")),
              Center(child: Text("Bike"))
            ],
          ),
        )
    );
  }

  TabBar createTabBar()  {
    return TabBar(
        isScrollable: true,
        labelStyle: TextStyle(fontSize: 20),
        tabs: [
          Text("Car " + this.carClick.toString()),
          Text("Transit " + this.transitClick.toString()),
          Text("Bike " + this.bikeClick.toString())
        ],
        onTap: (index) {
          this.onTapHandler(index);
        }
    );
  }

  void onTapHandler(int index)  {
    setState(()  {
      switch(index){
        case 0:
          carClick++;
          break;
        case 1:
          transitClick++;
          break;
        case 2:
          bikeClick++;
          break;
      }
    });
  }

}
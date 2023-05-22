import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saabay/to_do_data.dart';
import 'package:saabay/to_do_tile.dart';
import 'package:saabay/todo_enter_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? sharedPreferences;

  List<ToDoModel> toDoModel = [];

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    var data = sharedPreferences!.getStringList("ToDoModel");
    for (var mapData in data!) {
      toDoModel.add(toDoModelFromJson(mapData));
    }
    debugPrint(data.toString());
    debugPrint(jsonEncode(toDoModel));
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("HomeString"),
      ),
      body: ListView.separated(
        itemCount: toDoModel.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            title: toDoModel[index].title,
            time: toDoModel[index].time,
            description: toDoModel[index].discription,
            count: (index + 1).toString(),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: MediaQuery.of(context).size.height / 150,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TodoEnterData(),
            ),
          );
        },
        child: Icon(Icons.navigate_next_rounded),
      ),
      drawer: Drawer(),
      endDrawer: Icon(Icons.home),
      endDrawerEnableOpenDragGesture: true,
      extendBody: true,
      backgroundColor: Colors.white,
    );
  }
}

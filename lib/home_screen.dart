import 'package:flutter/material.dart';
import 'package:saabay/to_do_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? sharedPreferences;

  // List<ToDoModel> toDoModel = [];

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // getData();
  }

  getData() {
    var data = sharedPreferences!.getStringList("ToDoData");
    // for (var mapdata in Data!) {
    //   toDoModel.add(ToDoModelFromJson(mapdata));
    // }
    debugPrint(data.toString());
    //debugPrint(JsonEncoder(toDoModel));
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
        title: AppString.homePageTitle,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 80,
                horizontal: MediaQuery.of(context).size.height / 70,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Color(0xB000000),
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Title",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 80),
                            Container(
                              height: MediaQuery.of(context).size.height / 50,
                              width: MediaQuery.of(context).size.width / 400,
                              decoration: BoxDecoration(color: Colors.black),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 80),
                            Text(
                              "Time",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 500),
                        Text(
                          "Discription",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline_outlined),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 25),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: MediaQuery.of(context).size.height / 150),
          itemCount: 10),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoEnterData extends StatefulWidget {
  final String? title;
  final String? discription;
  final String? time;
  const TodoEnterData({Key? key, this.title, this.discription, this.time})
      : super(key: key);

  @override
  State<TodoEnterData> createState() => _TodoEnterDataState();
}

class _TodoEnterDataState extends State<TodoEnterData> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();
  String? time = "";

  SharedPreferences? sharedPreferences;

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setdata() {
    Map<String, dynamic> data = {
      "title": titlecontroller.text,
      "discription": discriptioncontroller.text,
      "time": time,
    };
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
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
              horizontal: MediaQuery.of(context).size.height / 70,
            ),
            child: Column(
              children: [
                TextFild(),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      setdata();
                    },
                    child: const Text("Add Task"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:saabay/add_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoEnterData extends StatefulWidget {
  const TodoEnterData({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoEnterData> createState() => _TodoEnterDataState();
}

class _TodoEnterDataState extends State<TodoEnterData> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();
  String time = "";

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
    debugPrint(' Data is set ---> $data');
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 80,
            horizontal: MediaQuery.of(context).size.height / 70,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(15),
            children: [
              AppTextField(
                hintText: 'Enter Title',
                controller: titlecontroller,
                minAndMaxLine: null,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              AppTextField(
                hintText: 'Description',
                minAndMaxLine: 10,
                controller: discriptioncontroller,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(
                      time.isNotEmpty ? time : "selectedTime",
                      style: TextStyle(
                        color: time.isNotEmpty
                            ? Colors.black
                            : Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () async {
                    TimeOfDay? selectTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectTime != null) {
                      debugPrint(selectTime.format(context));
                      time = selectTime.format(context);
                      setState(() {});
                    }
                  }),
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
    );
  }
}

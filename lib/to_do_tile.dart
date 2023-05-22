import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String? title;
  final String? time;
  final String? description;
  final String? count;

  const ToDoTile(
      {Key? key, this.title, this.time, this.description, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Colors.black26,
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
                  count!,
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
                    title!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 80),
                  Container(
                    height: MediaQuery.of(context).size.height / 50,
                    width: MediaQuery.of(context).size.width / 400,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 80),
                  Text(
                    time!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 500),
              Text(
                description!,
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
    );
  }
}

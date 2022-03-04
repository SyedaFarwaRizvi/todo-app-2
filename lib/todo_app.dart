import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  hexColor(String hexColor) {
    String colornew = '0xff' + hexColor;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  void handlePress() {
    String todo = todoController.text;
    todoController.clear();
    setState(() {
      todos.add(todo);
    });
  }

  void removeList(int i) {
    String todo = todos.removeAt(i);
    setState(() {
      todos = todos;
    });
  }

  List<String> todos = [];
  TextEditingController todoController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text("To-do List App"),
                backgroundColor: Color(hexColor('#643e87'))),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(15),
                        width: 350,
                        height: 100,
                        child: Center(
                            child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            hintText: "Please enter your todo here",
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ))),
                    ElevatedButton(onPressed: handlePress, child: Text("Add")),
                    for (var i = 0; i < todos.length; i++)
                      Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 350,
                        color: Colors.pink[200],
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(todos[i],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                              ElevatedButton(
                                  onPressed: () {
                                    removeList(i);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  child: Text("delete")),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )));
  }
}

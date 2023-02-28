import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/screen/todo.dart';
import 'package:todo_app/screen/todo_item.dart';
 
class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

   @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 227, 225, 225),
    appBar: AppBar(
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(10.5),),),
      backgroundColor: Color.fromARGB(255, 83, 0, 104),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Icon(Icons.menu,
         color: Colors.white,
         size: 30,
         
          ),

          Icon(Icons.search,
         color: Colors.white,
         size: 20, ),
        
        ]
        
      ),
    
    ),
    body: Container(
        
          child: ListView(children: [
           
           
         
           Container(
             
              padding: EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10),
              child: Text('All TODOS',   style: TextStyle(  
              fontSize: 20,  
              color: Colors.black,  
              fontWeight: FontWeight.w500,)),
           ),
           for (ToDo todoo in _foundToDo.reversed)
                        TODO(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
         ]),
    ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 83, 0, 104),
        onPressed: () =>
         _displayDialog(context),
          tooltip: 'Add Item',
        
      ),

  );
  }

 _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _todoController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_todoController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

 void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

 
    
  
  void _addTodoItem(String text) {
setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: text,
      ));
    });
    _todoController.clear();
  }
 }
 

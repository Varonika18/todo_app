import 'package:flutter/material.dart';
import 'package:todo_app/screen/todo_item.dart';
 class TODO extends StatelessWidget{
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

const TODO({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
          padding: EdgeInsets.all(10),
          child:ListTile(
            onTap: () {
               onToDoChanged(todo);
            },
            contentPadding:EdgeInsets.all(10) ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
              tileColor: Colors.white,
              leading: Icon(  todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,color: Color.fromARGB(255, 33, 37, 243)),
              title: Text(todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,),),
              trailing: Container(
                height: 35,
                width: 35,
                child: IconButton(
                  icon:Icon( Icons.delete),
                iconSize:20,
                color: Color.fromARGB(255, 200, 14, 1), onPressed: () { 
                   onDeleteItem(todo.id);
                },),
              ),

            ),
              
          
     );
  }

 }
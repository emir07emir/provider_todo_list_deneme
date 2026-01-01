import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list_deneme/TodoProvider.dart';
import 'package:provider_todo_list_deneme/updatePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>TodoProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:MyHomePage(),
      ),
    );
  }
}



class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("todoList"),
      ),
      body:Center(
        child: Column(
          children: [
            Consumer<TodoProvider>(
                builder:(context,todoList,child){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: todoList.tfcontrol,
                      decoration: InputDecoration(
                        hintText: "Görev giriniz",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  );
                }
            ),
            Consumer<TodoProvider>(
                builder:(context,todoList,child){
                  return ElevatedButton(
                    onPressed: (){
                      todoList.ekle(todoList.tfcontrol.text);
                    },
                      child: Text("Ekle"));
                }
            ),
            Expanded(
              child: Consumer<TodoProvider>(
                  builder:(context,todoList,child){
                    return ListView.builder(
                      itemCount: todoList.todolist.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePage(index: index)));
                          },
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${todoList.todolist[index]}"),
                                PopupMenuButton(
                                  child:Icon(Icons.more_vert_sharp) ,
                                    onSelected: (value){
                                      if(value == 1){
                                        todoList.sil(todoList.todolist[index]);
                                      }
                                    },
                                    itemBuilder:(context) => [
                                      PopupMenuItem(
                                          value:1,
                                          child: Text("Sil",style: TextStyle(color: Colors.red),)
                                      ),
                                    ]
                          
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
              ),
            ),
          ],
        ),
      )

    );
  }
}

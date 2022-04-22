import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int counter = 0;
 final List<Widget> _list = [];

 @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }

  }
  void onClick(){
   Widget child = _newItem(counter);
   setState(() => _list.add(child));
     
   
  }
     _newItem(int i){
    Key key = Key("item ${i}");
    Container child = Container(
      key:key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
       label: Text("${i} Name Here"),
       deleteIconColor:Colors.red ,
       deleteButtonTooltipMessage: "Delete",
       onDeleted: ()=> removeItem(key),
         avatar: CircleAvatar(backgroundColor: Colors.grey.shade500,child: Text(i.toString()),)
      )
    );
    counter++;
   return child;
  }
  void removeItem(Key key){
    for(int i=0;i<_list.length;i++){
      Widget child =_list.elementAt(i);
      if (child.key == key){
        setState(() => _list.removeAt(i));
        print("Removing${key.toString()}");
          
        
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Chips, keys,children"),
      ),
      floatingActionButton: FloatingActionButton(onPressed:onClick,child:Icon(Icons.add),),
      body: Container(
        child: Center(
          child: Column(
            children: 
              _list,
            
          ),
        ),
      ),
    );
  }
}
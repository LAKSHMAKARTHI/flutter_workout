import 'package:flutter/material.dart';
import 'package:grocery/util/grocery_list.dart';

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  List list = new List();

  @override
  initState(){
    for(var index = 0; index < groceryList.length; index++){
      list.insert(index, {"name": groceryList[index]["name"], "ischeck": false, "qty": groceryList[index]["qty"]});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: groceryList.length == 0 ? NoList() : ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                  value: this.list[index]["ischeck"],
                  onChanged: (bool value)  {
                      setState(() {
                        this.list[index]["ischeck"] = value;
                      });
                  }),
              title: Text(groceryList[index]["name"]),
              trailing: DropdownButton<String>(
                value: this.list[index]["qty"],
                iconSize: 5,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    this.list[index]["qty"] = newValue;
                  });
                },
                items: <String>["0 KG", "1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()
              ),
            ),
          );
        },
      ),
    );
  }

  Widget NoList(){
    return Center(
      child: Text("There is no item."),
    );
  }
}

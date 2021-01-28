import 'package:flutter/material.dart';
import 'package:grocery/widget/no_item.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 0 > 0 ?  ListView.builder(
          itemCount: 0,
          itemBuilder: (BuildContext context, index)  {
            return Card(
              child: ListTile(
                title: Text("Rice"),
                leading: Text("${index + 1}"),
                trailing: Text("2 kg"),
              ),
            );
          },
      ) : NoItem("There is no item in cart.")
    );
  }
}

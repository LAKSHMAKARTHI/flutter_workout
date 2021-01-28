import 'package:flutter/material.dart';
import 'package:grocery/screen/list_screen.dart';
import 'package:grocery/util/constant.dart';
import 'package:grocery/util/grocery_list.dart';
import 'package:share/share.dart';
import 'cart_screen.dart';
import 'about_screen.dart';
import 'donate_screen.dart';
import 'map_screen.dart';
import 'term_screen.dart';
import 'privacy_screen.dart';
import 'goods_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [Lists(), Cart(), Goods(), GMap(), About(), Privacy(), Terms(), Donate()];

  void onTabMenu(int bb, int dw){
    setState(() {
      this.currentIndex = bb;
      this._currentIndex = dw;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(
              this.currentIndex == 0 || this.currentIndex == 2 ?
            Icons.info_outlined : Icons.share
          ), onPressed: () {
            if (this.currentIndex == 0 || this.currentIndex == 2){
              showDialog(context: context, builder: (context){
               return AlertDialog(
                  title: Text("Home"),
                  content: Text("This is test"),
                  actions: <Widget>[
                    FlatButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("Close")),
                  ],
                );
              });
            } else {
              final RenderBox box = context.findRenderObject();
              Share.share(
                "Grocery List",
                subject: "List",
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
              );
            }
          })
        ],
      ),
      body: _currentIndex == 0 || _currentIndex == 1 ?  _children[currentIndex] : _children[_currentIndex],
      bottomNavigationBar: (_currentIndex != 0) ? null : BottomNavigationBar(
        currentIndex: this.currentIndex,
        onTap: (value) => {
          this.onTabMenu(value, 0)
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded),
              label: "Goods",
          ),
        ],
      ),
      floatingActionButton: true ? null : FloatingActionButton(
        child: Icon(Icons.share),
        onPressed: () {
        },
      ),
      drawer: Drawer(
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          children: [
            DrawerHeader(child: Center(
              child: CircleAvatar(
                maxRadius: 50,
                child: Image.asset("assets/images/car.png"),
              ),
            )
            ),
            ListTile(
              leading: Icon(Icons.local_grocery_store),
              trailing: Text(
                "${groceryList.length}",
                style: TextStyle(
                  color: Constant.primaryColor,
                ),
                maxLines: 1,
              ),
              title: Text("Grocery List"),
              onTap: () {
                this.onTabMenu(0, 0);
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text("Nearby Store"),
              onTap: () {
                this.onTabMenu(0, 3);
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("About"),
              onTap: (){
                this.onTabMenu(0, 4);
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: (){
                final RenderBox box = context.findRenderObject();
                Share.share(
                    "Grocery App",
                    subject: "This is the link for grocery app & coming soon.",
                    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
                );
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text("Privacy Policy"),
              onTap: (){
                this.onTabMenu(0, 5);
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.article_rounded),
              title: Text("Terms & Condition"),
              onTap: (){
                this.onTabMenu(0, 6);
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.attach_money_outlined),
              title: Text("Donate"),
              onTap: (){
                this.onTabMenu(0, 7);
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text("Version 1.0"),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

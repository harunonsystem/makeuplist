import 'package:flutter/material.dart';

class CardDetail extends StatefulWidget {
  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  final TextEditingController eCtrl = new TextEditingController();
  List<String> litems = ['item1', 'item2', 'item3'];
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("addColumn"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.white,),
                label: const Text('Edit', style: TextStyle(color: Colors.white),)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
              child: Center(
                  child: new ListView.separated(
                separatorBuilder: (BuildContext ctxt, int index) => Divider(
                  color: Colors.pink,
                ),
                padding: EdgeInsets.all(10.0),
                itemCount: litems.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Center(
                      child: Card(
                          shape: Border(
                            top: BorderSide(color: Colors.red),
                            left: BorderSide(color: Colors.blue),
                            right: BorderSide(color: Colors.yellow),
                            bottom: BorderSide(color: Colors.green),
                          ),
                          child: ListTile(
                              title: Center(
                                  child: Text(
                            litems[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )))));
                },
              )),
            ),
          ],
        ));
  }
}

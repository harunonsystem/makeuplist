import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final TextEditingController eCtrl = new TextEditingController();
  List<String> litems = [];
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('create test'),
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

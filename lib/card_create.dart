import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CardCreate extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<CardCreate> {
  //Map<String, String> litems = {};
  List<String> items = [];
  TextEditingController title = new TextEditingController();
  // https://pub.dev/documentation/image_picker/latest/ #ImagePicker
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void openCamera() async {
    final pickerdFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickerdFile.path);
    });
  }

  void openGallery() async {
    final pickerdFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickerdFile.path);
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text('MakeupList'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blueAccent, Colors.pinkAccent])),
        ),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: const Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addPanel,
        backgroundColor: Colors.blue,
      ),
      body: new Column(children: <Widget>[
        new Expanded(
          child: Center(
            child: _image == null ? Text('no data') : Image.file(_image),
          ),
        )
      ]),
    );
  }

  void addPanel() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: TextFormField(
                  controller: title,
                  onSaved: (text) {
                    items.add(text);
                    title.clear();
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'input title...',
                  )),
              content: new SingleChildScrollView(
                  child: new Column(children: <Widget>[
                /*
                Container(
                  child: _imageFile == null
                      ? Text("Waiting a minites...")
                      : Image.file(),
                ),*/
                GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera_alt),
                        SizedBox(width: 5),
                        const Text('camera')
                      ],
                    ),
                    onTap: () async {
                      openCamera();
                    }),
                SizedBox(
                  width: 20,
                  height: 30,
                ),
                GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.photo),
                        SizedBox(width: 5),
                        const Text('gallery')
                      ],
                    ),
                    onTap: () async {
                      openGallery();
                    }),
                FlatButton.icon(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  color: Colors.pinkAccent,
                  label: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      Image.file(_image);
                    });
                  },
                ),
              ])));
        });
  }
}

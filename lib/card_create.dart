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

  void open_camera() async {
    final PickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(PickedFile.path);
    });
  }

  void open_gallery() async {
    final PickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(PickedFile.path);
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('create test'),
        centerTitle: true,
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
      ),
      body: new Column(children: <Widget>[
        new Expanded(
          child: Center(
            child: _image == null
                ? Text('no data')
                : Image.file(_image),
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
                      open_camera();
                    }),
                SizedBox(
                  width: 20,
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
                      open_gallery();
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

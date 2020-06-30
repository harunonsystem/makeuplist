import 'package:flutter/material.dart';
import 'dart:ui';

class CardDefault extends StatefulWidget {
  @override
  _CardDefaultState createState() => _CardDefaultState();
}

class PlaceItem {
  bool isExpanded;
  String name;
  String image;

  PlaceItem(this.isExpanded, this.name, this.image);
}

class _CardDefaultState extends State<CardDefault> {
  var _placeList = new List<PlaceItem>();

  ExpansionPanel _createPanel(PlaceItem place) {
    return ExpansionPanel(
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // https://flutter-widget.live/widgets/ExpansionPanelList
                      setState(() {
                        _placeList
                            .removeWhere((currentItem) => place == currentItem);
                      });
                    },
                  )),
              Text(
                place.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
      body: GestureDetector(
        onTap: () {
          return Image.asset(
            'assets/' + place.image,
            fit: BoxFit.cover,
          );
        },
        child: Image.asset(
          'assets/' + place.image,
          fit: BoxFit.fill,
        ),
      ),
      isExpanded: place.isExpanded,
    );
  }

  // List<String> defitems = [
  //   'item',
  //   'item2',
  //   'item3',
  //   'item4',
  // ];

  @override
  void initState() {
    _placeList.add(PlaceItem(
      true,
      'karacon',
      'makeup/karakon.png',
    ));
    _placeList.add(PlaceItem(true, 'base', 'makeup/base01.png'));
    _placeList.add(PlaceItem(true, 'fandation', 'makeup/fandation.png'));
    _placeList.add(PlaceItem(true, 'powder1', 'makeup/powder01.png'));
    // _placeList.add(PlaceItem(true, 'powder2', 'makeup/powder02.png'));
    _placeList.add(PlaceItem(true, 'eye1', 'makeup/clio_parette.png'));
    _placeList.add(PlaceItem(true, 'eye2', 'makeup/etude_jewel.png'));
    _placeList.add(PlaceItem(true, 'eye3', 'makeup/eye01.png'));
    _placeList.add(PlaceItem(true, 'eye4', 'makeup/eye02.png'));
    _placeList.add(PlaceItem(true, 'eye5', 'makeup/eye03.png'));
    _placeList.add(PlaceItem(true, 'eye6', 'makeup/eye04.png'));
    _placeList.add(PlaceItem(true, 'eye7', 'makeup/eye05.png'));
    _placeList.add(PlaceItem(true, 'eye8', 'makeup/eye06.png'));
    _placeList.add(PlaceItem(true, 'eye9', 'makeup/eye07.png'));
    _placeList.add(PlaceItem(true, 'eye10', 'makeup/eye08.png'));
    _placeList.add(PlaceItem(true, 'eye11', 'makeup/eye09.png'));
    _placeList.add(PlaceItem(true, 'eye12', 'makeup/eye10.png'));
    _placeList.add(PlaceItem(true, 'eye13', 'makeup/eye11.png'));
    _placeList.add(PlaceItem(true, 'eye14', 'makeup/eye12.png'));
    _placeList.add(PlaceItem(true, 'eye15', 'makeup/eye13.png'));
    _placeList.add(PlaceItem(true, 'eye16', 'makeup/eye14.png'));
    _placeList.add(PlaceItem(true, 'mascara1', 'makeup/mascara01.png'));
    _placeList.add(PlaceItem(true, 'mascara2', 'makeup/mascara02.png'));
    _placeList.add(PlaceItem(true, 'mascara3', 'makeup/mascara03.png'));
    _placeList.add(PlaceItem(true, 'mascara4', 'makeup/mascara04.png'));
    _placeList.add(PlaceItem(true, 'eyeline1', 'makeup/eyeline01.png'));
    _placeList.add(PlaceItem(true, 'eyeline2', 'makeup/eyeline02.png'));
    _placeList.add(PlaceItem(true, 'eyeline3', 'makeup/eyeline03.png'));
    _placeList.add(PlaceItem(true, 'eyeline4', 'makeup/eyeline04.png'));
    _placeList.add(PlaceItem(true, 'eyeline5', 'makeup/eyeline05.png'));
    _placeList.add(PlaceItem(true, 'eyeline6', 'makeup/eyeline06.png'));
    _placeList.add(PlaceItem(true, 'eyeline7', 'makeup/eyeline07.png'));
    _placeList.add(PlaceItem(true, 'eyeline8', 'makeup/eyeline08.png'));
    _placeList.add(PlaceItem(true, 'eyeline9', 'makeup/eyeline09.png'));
    _placeList.add(PlaceItem(true, 'eyeline10', 'makeup/eyeline10.png'));
    _placeList
        .add(PlaceItem(true, 'eyeblowmascara1', 'makeup/eyeblowmascara01.png'));
    _placeList
        .add(PlaceItem(true, 'eyeblowmascara2', 'makeup/eyeblowmascara02.png'));
    _placeList.add(PlaceItem(true, 'noseshadow1', 'makeup/noseshadow01.png'));
    _placeList.add(PlaceItem(true, 'noseshadow2', 'makeup/noseshadow02.png'));
    _placeList.add(PlaceItem(true, 'noseshadow3', 'makeup/noseshadow03.png'));
    _placeList.add(PlaceItem(true, 'noseshadow4', 'makeup/noseshadow04.png'));
    _placeList.add(PlaceItem(true, 'shading1', 'makeup/shading01.png'));
    _placeList.add(PlaceItem(true, 'shading2', 'makeup/shading02.png'));
    _placeList.add(PlaceItem(true, 'lip1', 'makeup/lip01.png'));
    _placeList.add(PlaceItem(true, 'lip2', 'makeup/lip02.png'));
    _placeList.add(PlaceItem(true, 'lip3', 'makeup/lip03.png'));
    _placeList.add(PlaceItem(true, 'lip4', 'makeup/lip04.png'));
    _placeList.add(PlaceItem(true, 'lip5', 'makeup/lip01.png'));
    _placeList.add(PlaceItem(true, 'cheak', 'makeup/cheak01.png'));
    _placeList.add(PlaceItem(true, 'powder1', 'makeup/powder-cheak.png'));
    _placeList.add(PlaceItem(true, 'powder2', 'makeup/powder-cheak02.png'));
    _placeList.add(PlaceItem(true, 'highlight1', 'makeup/highlight01.png'));
    _placeList.add(PlaceItem(true, 'highlight2', 'makeup/highlight02.png'));
    _placeList.add(PlaceItem(true, 'highlight3', 'makeup/highlight03.png'));
    _placeList.add(PlaceItem(true, 'highlight4', 'makeup/highlight04.png'));
    _placeList.add(PlaceItem(true, 'highlight5', 'makeup/highlight05.png'));
    _placeList.add(PlaceItem(true, 'highlight6', 'makeup/highlight06.png'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('list1🥺'),
          centerTitle: true,
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
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _placeList[index].isExpanded =
                        !_placeList[index].isExpanded;
                  });
                },
                children: _placeList.map(_createPanel).toList(),
              ),
            ],
          ),
        ));
  }
}

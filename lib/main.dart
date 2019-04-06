import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: P());
  }
}

class P extends StatefulWidget {
  P({Key k}) : super(key: k);
  @override
  _PS createState() => _PS();
}

class _PS extends State<P> {
  bool _iot = false;
  final R = Random();
  TextEditingController npc = TextEditingController(),
      xic = TextEditingController();
  List<int> nL;
  int rN = 0;
  void SD(int lN) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: Text("☝ $lN is last one."));
      },
    );
  }

  void SDS() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Theme(
              data: Theme.of(context)
                  .copyWith(dialogBackgroundColor: Colors.transparent),
              child: Dialog(
                  child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [CircularProgressIndicator(strokeWidth: 1)],
              )));
        });
    new Future.delayed(new Duration(milliseconds: 800), () {
      Navigator.pop(context);
      setState(() => rN);
    });
  }

  void PL() {
    nL = List<int>.generate(int.parse(xic.text) - int.parse(npc.text) + 1,
        (i) => i + int.parse(npc.text));
  }

  void SC(bool v) {
    setState(() => _iot = v);
    if (_iot) PL();
  }

  void RR() {
    npc.text = '';
    xic.text = '';
    setState(() => _iot = false);
  }

  void GR() {
    int n = int.parse(npc.text);
    int x = int.parse(xic.text);
    if (n == null || x == null || n > x) return;
    if (_iot) {
      if (nL.isEmpty) {
        SD(rN);
        PL();
        return;
      }
      int r = R.nextInt(nL.length);
      rN = nL[r];
      nL.removeAt(r);
    } else
      rN = n + R.nextInt(x - n + 1);
    SDS();
  }

  @override
  Widget build(BuildContext context) {
    Widget rR = Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IconButton(
          icon: Icon(Icons.refresh, color: Colors.white70, size: 30),
          onPressed: RR)
    ]);
    Widget rL = Container(
        child: Column(children: [
      Text('$rN', style: TextStyle(fontSize: 75.0, color: Colors.white))
    ]));
    Widget iTF =
        Container(child: Column(children: [bIT('Min', npc), bIT('Max', xic)]));
    Widget oTC = Container(
        padding: EdgeInsets.only(right: 10.0, top: 70.0, bottom: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              child: Text('one chance possibility',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontStyle: FontStyle.italic))),
          Switch(
              value: _iot,
              onChanged: SC,
              activeTrackColor: Colors.pink,
              activeColor: Colors.white)
        ]));
    Widget gB = Container(
        padding: EdgeInsets.only(left: 50, right: 50),
        height: 50,
        child: RaisedButton(
            onPressed: GR,
            elevation: 9,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text('Generate',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic))));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.deepPurple[900],
            appBar: AppBar(
              title: Text('One Chance Random'),
            ),
            body: ListView(
                padding: EdgeInsets.only(top: 32, left: 20, right: 20),
                children: [rR, rL, iTF, oTC, gB])));
  }

  Column bIT(String l, TextEditingController c) {
    return Column(children: [
      Container(
          child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  enabled: !_iot,
                  autofocus: true,
                  controller: c,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: l,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200)))))
    ]);
  }
}

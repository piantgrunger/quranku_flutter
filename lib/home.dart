import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'surat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  List<Surat> _surat = <Surat>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenForSurat();
  }

  listenForSurat() async {
    var stream = await getSurat();
    stream.listen((surat) => setState(() => _surat.add(surat)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Quranku"),
        backgroundColor: Colors.green,
      ),
      body: new Center(
          child: new ListView(
        children: _surat.map((surat) => new SuratWidget(surat)).toList(),
        
      )),
    );
  }
}



class SuratWidget extends StatelessWidget {
  final Surat _surat;

  SuratWidget(this._surat);

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new ListTile(
      title: new Text(
        _surat.nama + ' - ' + _surat.namaArab,
        style: new TextStyle(fontSize: 30.0),
      ),
      subtitle: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Text(_surat.jumlahAyat.toString() + ' ayat'),
          new Text(_surat.arti),
        ],
      ),
      onTap: ()   {
        /*
        if (await canLaunch(
            'https://quranku.alfiannaufal.com/index.php?r=site%2Fsurah&noSurah=${_surat.noSurat.toString()}')) {
          launch(
              'https://quranku.alfiannaufal.com/index.php?r=site%2Fsurah&noSurah=${_surat.noSurat.toString()}');
             */
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(surat: _surat,),
                ),
              );
        
      },
    ));
  }
}

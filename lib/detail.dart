import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailsurat.dart';
import 'surat.dart';

class Detail extends StatefulWidget {
    final Surat surat;

    Detail({this.surat}); 
  _DetailState createState() => _DetailState(this.surat);

}

class _DetailState extends State<Detail> {
   Surat  _surat;
 _DetailState(this._surat);  //constructor
  List<SuratDetail> _suratdetail = <SuratDetail>[];


  @override
  void initState() {
    super.initState();
    listenForSurat();

    
  }
  listenForSurat() async {
      var stream = await getSuratDetail(this._surat.noSurat);
      stream.listen((surat) => setState(() => _suratdetail.add(surat)));
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this._surat.nama +' - '+this._surat.namaArab+' '),
        backgroundColor: Colors.green,
      ),
      body: new Center(
          child: new ListView(
        children: _suratdetail.map((surat) => new SuratWidget(surat)).toList(),
      )),
    );
  }
}

class SuratWidget extends StatelessWidget {
  final SuratDetail _suratDetail;

  SuratWidget(this._suratDetail);

  @override
  Widget build(BuildContext context) {
    return new Card(
      
        child: new ListTile(
      title: new Text(
        _suratDetail.ayat.toString() + ' - ' + _suratDetail.ayatArab,
        style: new TextStyle(fontSize: 30.0),
      ),
      subtitle: new Text(_suratDetail.terjemahan),
    ));
  }
}

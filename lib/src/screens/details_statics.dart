import 'package:covid_statistics_app/src/viewmodel/india_view_model.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DetailScreen extends StatelessWidget {
  final IndiaViewModel indaListDescription;
  DetailScreen({Key key, @required this.indaListDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(indaListDescription.name),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Number of Cases : ${indaListDescription.casase}',
                  style: countStyle(
                    fontsize: 20.0,
                    weight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Number of Recovered : ${indaListDescription.recovered}',
                  style: countStyle(
                    fontsize: 20.0,
                    weight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Number of Deaths : ${indaListDescription.deaths}',
                  style: countStyle(
                    fontsize: 20.0,
                    weight: FontWeight.bold,
                  ),
                ),
                Builder(
                  builder: (BuildContext context) {
                    return RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        final RenderBox box = context.findRenderObject();
                        Share.share(
                            "Cases :${indaListDescription.casase} \n Recovered: ${indaListDescription.recovered} \n Deaths :${indaListDescription.deaths}",
                            subject:
                                "ConvidStatics in ${indaListDescription.name}",
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle countStyle({double fontsize, FontWeight weight}) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: weight,
  );
}

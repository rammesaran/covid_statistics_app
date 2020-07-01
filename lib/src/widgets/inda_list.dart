import 'package:covid_statistics_app/src/screens/details_statics.dart';
import 'package:covid_statistics_app/src/viewmodel/india_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IndiaListWidget extends StatelessWidget {
  final List<IndiaViewModel> indaList;
  const IndiaListWidget({
    Key key,
    this.indaList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: indaList.length,
      itemBuilder: (context, index) {
        final indianState = this.indaList[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(indaListDescription: indianState),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 240,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(indianState.name),
                      ),
                      Text(
                        'Cases :${indianState.casase}',
                        style:
                            countStyle(fontsize: 18, weight: FontWeight.bold),
                      ),
                      Text(
                        'Death :${indianState.deaths}',
                        style:
                            countStyle(fontsize: 18, weight: FontWeight.bold),
                      ),
                      Text(
                        'Recovered :${indianState.recovered}',
                        style:
                            countStyle(fontsize: 18, weight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

TextStyle countStyle({double fontsize, FontWeight weight}) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: weight,
  );
}

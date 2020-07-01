import 'package:covid_statistics_app/src/viewmodel/country_list_view_model.dart';
import 'package:covid_statistics_app/src/widgets/country_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<CountryListViewModel>(context, listen: false)
        .getCountryStatics();
  }

  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<CountryListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('International Countries'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: textController,
                onChanged: (value) {
                  countryData.getSearchData(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Search Countries",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: CountryListWidget(countrylist: countryData.getFilter),
            )
          ],
        ),
      ),
    );
  }
}

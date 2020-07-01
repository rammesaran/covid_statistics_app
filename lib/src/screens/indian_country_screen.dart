import 'package:covid_statistics_app/src/screens/blank_screen.dart';
import 'package:covid_statistics_app/src/viewmodel/india_list_view_model.dart';
import 'package:covid_statistics_app/src/widgets/inda_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndiaCountry extends StatefulWidget {
  @override
  _IndiaCountryState createState() => _IndiaCountryState();
}

class _IndiaCountryState extends State<IndiaCountry> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<IndiaListViewModel>(context, listen: false)
        .getIndianCountries();
  }

  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<IndiaListViewModel>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Welcome User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_right),
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_right),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlankScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                trailing: Icon(Icons.arrow_right),
                title: Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlankScreen()),
                  );
                },
              ),
              ListTile(
                  leading: Icon(Icons.priority_high),
                  trailing: Icon(Icons.arrow_right),
                  title: Text('Terms & Conditions'),
                  onTap: _showDialog),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Indian Countries List'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: IndiaListWidget(indaList: countryData.indainCountries),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Terms & Condition"),
          content: Text("Dummy Content"),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

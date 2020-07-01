import 'package:covid_statistics_app/src/screens/indian_country_screen.dart';
import 'package:covid_statistics_app/src/viewmodel/country_view_model.dart';
import 'package:flutter/material.dart';

class CountryListWidget extends StatelessWidget {
  final List<CountryViewModel> countrylist;

  const CountryListWidget({Key key, this.countrylist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countrylist.length,
      itemBuilder: (context, index) {
        final country = countrylist[index];

        return ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IndiaCountry()));
          },
          contentPadding: EdgeInsets.all(10),
          title: Text(country.countryname),
        );
      },
    );
  }
}

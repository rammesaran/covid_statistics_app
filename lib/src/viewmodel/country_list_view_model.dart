import 'package:covid_statistics_app/src/services/webservices.dart';
import 'package:covid_statistics_app/src/viewmodel/country_view_model.dart';
import 'package:flutter/foundation.dart';

class CountryListViewModel extends ChangeNotifier {
  List<CountryViewModel> countries = List<CountryViewModel>();
  List<CountryViewModel> getFilter = List<CountryViewModel>();

  Future<void> getCountryStatics() async {
    final result = await WebService().getWorldStatics();
    this.countries =
        result.map((e) => CountryViewModel(countriesStat: e)).toList();
    this.getFilter = this.countries;
    notifyListeners();
  }

  void getSearchData(String value) {
    this.getFilter = countries
        .where((element) =>
            element.countryname.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

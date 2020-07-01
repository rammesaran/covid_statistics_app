import 'package:covid_statistics_app/src/model/country_wise_model.dart';

class CountryViewModel {
  final CountriesStat countriesStat;

  CountryViewModel({this.countriesStat});

  String get countryname {
    return this.countriesStat.countryName;
  }

  String get cases {
    return this.countriesStat.cases;
  }

  String get deaths {
    return this.countriesStat.deaths;
  }

  String get region {
    return this.countriesStat.region;
  }

  String get totalrecovered {
    return this.countriesStat.totalRecovered;
  }
}

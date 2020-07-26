import 'package:covid_statistics_app/src/model/world_name_model.dart';

class WorldViewModel {
  final WordNameModel wordNameModel;

  WorldViewModel({this.wordNameModel});

  String get countryName {
    return this.wordNameModel.name;
  }

  double get latitude {
    return this.wordNameModel.latitude;
  }

  double get longitude {
    return this.wordNameModel.longitude;
  }
}

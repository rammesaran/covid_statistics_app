import 'package:covid_statistics_app/src/model/india_state_wise_model.dart';

class IndiaViewModel {
  final IndiaStateModel indiaStateModel;

  IndiaViewModel({this.indiaStateModel});

  String get id {
    return this.indiaStateModel.id;
  }

  String get name {
    return this.indiaStateModel.name;
  }

  String get casase {
    return this.indiaStateModel.cases;
  }

  String get recovered {
    return this.indiaStateModel.recovered;
  }

  String get deaths {
    return this.indiaStateModel.deaths;
  }
}

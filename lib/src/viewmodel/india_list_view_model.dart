import 'package:covid_statistics_app/src/services/webservices.dart';
import 'package:covid_statistics_app/src/viewmodel/india_view_model.dart';
import 'package:flutter/foundation.dart';

enum LoadingStatus { empty, completed, loading }

class IndiaListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<IndiaViewModel> indainCountries = List<IndiaViewModel>();

  Future<void> getIndianCountries() async {
    final result = await WebService().getIndiaStatics();
    loadingStatus = LoadingStatus.loading;

    this.indainCountries =
        result.map((e) => IndiaViewModel(indiaStateModel: e)).toList();
    notifyListeners();

    if (this.indainCountries.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}

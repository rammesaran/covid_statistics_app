import 'package:covid_statistics_app/src/services/webservices.dart';
import 'package:covid_statistics_app/src/viewmodel/world_view_model.dart';
import 'package:flutter/foundation.dart';

class WorldListViewModel extends ChangeNotifier {
  List<WorldViewModel> worldViewModel = List<WorldViewModel>();

  Future<void> getWorldLocation() async {
    final resultData = await WebService().getWordlNameLocation();

    this.worldViewModel =
        resultData.map((e) => WorldViewModel(wordNameModel: e)).toList();
    notifyListeners();
  }
}

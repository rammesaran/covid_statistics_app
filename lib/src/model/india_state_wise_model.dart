class IndiaStateModel {
  String id;
  String name;
  String cases;
  String recovered;
  String deaths;

  IndiaStateModel(
      {this.id, this.name, this.cases, this.recovered, this.deaths});

  IndiaStateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cases = json['cases'];
    recovered = json['recovered'];
    deaths = json['deaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cases'] = this.cases;
    data['recovered'] = this.recovered;
    data['deaths'] = this.deaths;
    return data;
  }
}

class StandAPI {
  List<Stand> stand;

  StandAPI({this.stand});

  StandAPI.fromJson(Map<String, dynamic> json) {
    if (json['stand'] != null) {
      stand = new List<Stand>();
      json['stand'].forEach((v) {
        stand.add(new Stand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stand != null) {
      data['stand'] = this.stand.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stand {
  int id;
  String name;
  String user;
  String destructivePower;
  String speed;
  String range;
  String powerPersistence;
  String precision;
  String developmentalPotential;

  Stand(
      {this.id,
      this.name,
      this.user,
      this.destructivePower,
      this.speed,
      this.range,
      this.powerPersistence,
      this.precision,
      this.developmentalPotential});

  Stand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    user = json['user'];
    destructivePower = json['destructive power'];
    speed = json['speed'];
    range = json['range'];
    powerPersistence = json['power persistence'];
    precision = json['precision'];
    developmentalPotential = json['developmental potential'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user'] = this.user;
    data['destructive power'] = this.destructivePower;
    data['speed'] = this.speed;
    data['range'] = this.range;
    data['power persistence'] = this.powerPersistence;
    data['precision'] = this.precision;
    data['developmental potential'] = this.developmentalPotential;
    return data;
  }
}

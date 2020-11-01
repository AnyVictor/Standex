import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:standex/consts/consts_api.dart';
import 'package:standex/models/standapi.dart';
part 'standapi_store.g.dart';

class StandApiStore = _StandApiStoreBase with _$StandApiStore;

abstract class _StandApiStoreBase with Store {
  @observable
  StandAPI standAPI;

  @action
  fetchStandList() {
    loadStandAPI().then((stand_list) {
      standAPI = stand_list;
    });
  }

  Future<StandAPI> loadStandAPI() async {
    try {
      final response = await http.get(ConstsAPI.standapiURL);
      var decodeJson = jsonDecode(response.body);
      return StandAPI.fromJson(decodeJson);
    } catch (error) {
      print("Error on loading list");
      return null;
    }
  }
}

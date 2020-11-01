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
    //
    loadStandAPI().then((stand_list) {
      //passa o objeto para o observable
      standAPI = stand_list;
    });
  }

  Future<StandAPI> loadStandAPI() async {
    try {
      final response = await http.get(ConstsAPI.standapiURL);
      var decodeJson = jsonDecode(
          response.body); //pega o json e tras para o app dinamicamente
      return StandAPI.fromJson(
          decodeJson); // pega o json e transforma na classe
    } catch (error) {
      print("Error on loading list");
      return null;
    }
  }
}

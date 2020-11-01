import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @action
  getStand({int index}) {
    return standAPI.stand[index];
  }

  @action
  Widget getImage({int number}) {
    return CachedNetworkImage(
        placeholder: (context, url) => new Container(
              color: Colors.transparent,
            ),
        imageUrl:
            'https://raw.githubusercontent.com/AnyVictor/Standex/master/external/stand_img/$number.png');
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

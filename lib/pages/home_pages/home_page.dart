import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:standex/consts/consts_app.dart';
import 'package:standex/models/standapi.dart';
import 'package:standex/pages/home_pages/widgets/app_bar.dart';
import 'package:standex/pages/home_pages/widgets/stand_item.dart';
import 'package:standex/stores/standapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StandApiStore standApiStore;
  @override
  void initState() {
    super.initState();
    standApiStore = StandApiStore();
    standApiStore.fetchStandList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackladybug,
                height: 600,
                width: 600,
              ),
              opacity: 0.1,
            ),
            top: -(400 / 1.8),
            left: -(screenWidth - 480),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: statusHeight,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext context) {
                        StandAPI _standApi = standApiStore.standAPI;
                        return (_standApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount: standApiStore.standAPI.stand
                                      .length, //pokeApiStore.pokeAPI.pokemon.length
                                  itemBuilder: (context, index) {
                                    Stand stand =
                                        standApiStore.getStand(index: index);
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: StandItem(
                                            index: index,
                                            name: stand.name,
                                            image: standApiStore.getImage(
                                                number: stand.id),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      Container() /*PokeDetailPage(index: index)*/,
                                                  fullscreenDialog: true,
                                                ));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

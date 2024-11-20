import 'package:flutter/material.dart';
import 'package:nerde_ne_yemeli/main.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class TurkiyeMap extends StatefulWidget {
  const TurkiyeMap({super.key});

  @override
  State<TurkiyeMap> createState() => _TurkiyeMapState();
}

class _TurkiyeMapState extends State<TurkiyeMap> {
  late MapShapeSource ShapeSource;
  late List<MapModel> mapData;

  @override
  void initState() {
    // TODO: implement initState
    mapData = _getMapData();
    ShapeSource = MapShapeSource.asset(
      'assets/tr.json',
      shapeDataField: 'name',
      dataCount: mapData.length,
      primaryValueMapper: (int index) => mapData[index].city,
      dataLabelMapper: (int index) => mapData[index].cityID,
      //shapeColorValueMapper: (int index) => mapData[index].color,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColoredBox(color: Colors.black),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SfMaps(
                  layers: [
                    MapShapeLayer(
                      source: ShapeSource,
                      showDataLabels: true,
                      shapeTooltipBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(7),
                          child: ElevatedButton(
                            child: Text(
                              mapData[index].city,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyHomePage(title: "")));
                            },
                          ),
                        );
                      },
                      //tooltipSettings:
                      //  MapTooltipSettings(color: Colors.blue.shade900),
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  static List<MapModel> _getMapData() {
    return <MapModel>[
      MapModel("Adana", ""),
      MapModel("Adıyaman", ""),
      MapModel("Afyonkarahisar", ""),
      MapModel("Ağrı", ""),
      MapModel("Aksaray", ""),
      MapModel("Amasya", ""),
      MapModel("Ankara", ""),
      MapModel("Antalya", ""),
      MapModel("Ardahan", ""),
      MapModel("Artvin", ""),
      MapModel("Aydın", ""),
      MapModel("Balıkesir", ""),
      MapModel("Bartın", ""),
      MapModel("Batman", ""),
      MapModel("Bayburt", ""),
      MapModel("Bilecik", ""),
      MapModel("Bingöl", ""),
      MapModel("Bitlis", ""),
      MapModel("Bolu", ""),
      MapModel("Burdur", ""),
      MapModel("Bursa", ""),
      MapModel("Çanakkale", ""),
      MapModel("Çankırı", ""),
      MapModel("Çorum", ""),
      MapModel("Denizli", ""),
      MapModel("Düzce", ""),
      MapModel("Diyarbakır", ""),
      MapModel("Edirne", ""),
      MapModel("Elazığ", ""),
      MapModel("Erzincan", ""),
      MapModel("Erzurum", ""),
      MapModel("Eskişehir", ""),
      MapModel("Gaziantep", ""),
      MapModel("Giresun", ""),
      MapModel("Gümüşhane", ""),
      MapModel("Hakkari", ""),
      MapModel("Hatay", ""),
      MapModel("Iğdır", ""),
      MapModel("Isparta", ""),
      MapModel("İstanbul", ""),
      MapModel("İzmir", ""),
      MapModel("Kahramanmaraş", ""),
      MapModel("Karabük", ""),
      MapModel("Karaman", ""),
      MapModel("Kars", ""),
      MapModel("Kastamonu", ""),
      MapModel("Kayseri", ""),
      MapModel("Kilis", ""),
      MapModel("Kırıkkale", ""),
      MapModel("Kırklareli", ""),
      MapModel("Kırşehir", ""),
      MapModel("Kocaeli", ""),
      MapModel("Konya", ""),
      MapModel("Kütahya", ""),
      MapModel("Malatya", ""),
      MapModel("Manisa", ""),
      MapModel("Mardin", ""),
      MapModel("Mersin", ""),
      MapModel("Muğla", ""),
      MapModel("Muş", ""),
      MapModel("Nevşehir", ""),
      MapModel("Niğde", ""),
      MapModel("Ordu", ""),
      MapModel("Osmaniye", ""),
      MapModel("Rize", ""),
      MapModel("Sakarya", ""),
      MapModel("Samsun", ""),
      MapModel("Şanlıurfa", ""),
      MapModel("Siirt", ""),
      MapModel("Sinop", ""),
      MapModel("Şırnak", ""),
      MapModel("Sivas", ""),
      MapModel("Tekridağ", ""),
      MapModel("Tokat", ""),
      MapModel("Trabzon", ""),
      MapModel("Tunceli", ""),
      MapModel("Uşak", ""),
      MapModel("Van", ""),
      MapModel("Yalova", ""),
      MapModel("Yozgat", ""),
      MapModel("Zonguldak", ""),
    ];
  }
}

class MapModel {
  MapModel(this.city, this.cityID);
  String city;
  String cityID;
}

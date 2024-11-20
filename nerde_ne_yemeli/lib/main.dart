import 'package:flutter/material.dart';
import 'package:nerde_ne_yemeli/tr_page.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MapShapeSource _shapeSource;
  late List<MapModel> _mapData;
  int _index = 0;
  bool isPressed = false;

  @override
  void initState() {
    _mapData = _getMapData();
    _shapeSource = MapShapeSource.asset(
      'assets/countries.json',
      shapeDataField:
          'name', // burda properities kısmındaki ile aynı olmasına dikkat et.
      dataCount: _mapData.length,
      primaryValueMapper: (int index) => _mapData[index].country,
      dataLabelMapper: (int index) => _mapData[index].countryID,
      shapeColorValueMapper: (int index) => _mapData[index].color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              'World Map',
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: SfMaps(
                layers: [
                  MapShapeLayer(
                    color: Colors.grey.shade200,
                    source: _shapeSource,
                    showDataLabels: true, // yakınlaştırma için
                    //legend: MapLegend(MapElement
                    //    .shape), // bu üstte her bir ülke için yazının gözükmesini sağlıyor

                    shapeTooltipBuilder: (BuildContext context, int index) {
                      _index = index;
                      setState(() {
                        isPressed = true;
                      });
                      return Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          _mapData[index].countryID,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    tooltipSettings:
                        MapTooltipSettings(color: Colors.blue.shade900),

                    /*
                      // Ülke isimlerinin yakınlaştırmaya göre belirginleşmesi
                      setState(() {
                        _shapeSource = MapShapeSource.asset(
                          'assets/countries.json',
                          shapeDataField: 'name',
                          dataCount: _mapData.length,
                          primaryValueMapper: (int index) =>
                              _mapData[index].country,
                          dataLabelMapper: details.newZoomLevel > 3
                              ? (int index) => _mapData[index].countryID
                              : null,
                          shapeColorValueMapper: (int index) =>
                              _mapData[index].color,
                        );
                      });
                      return true;
                    },
                    onShapeTap: (int index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryDetailPage(
                            countryName: _mapData[index].country,
                          ),
                        ),
                      );
                    },

                    shapeTooltipBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          _mapData[index].country,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    tooltipSettings:
                        MapTooltipSettings(color: Colors.blue.shade900),


                        */
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: isPressed
                  ? ElevatedButton(
                      child: Text("${_mapData[_index].country}"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TurkiyeMap()));
                      },
                    )
                  : Text("Ülke seçmek için tıklayın")),
        ],
      ),
    );
  }

  static List<MapModel> _getMapData() {
    return <MapModel>[
      MapModel('Canada', 'CAN', Colors.green.shade200),
      MapModel('United States of America', 'USA', Colors.green.shade300),
      MapModel('Greenland', 'GRL', Colors.green.shade500),
      MapModel('Mexico', 'MEX', Colors.green.shade700),
      MapModel('Brazil', 'BRA', Colors.pink.shade600),
      MapModel('Argentina', 'ARG', Colors.pink.shade400),
      MapModel('Chile', 'CHL', Colors.pink.shade300),
      MapModel('Colombia', 'COL', Colors.pink.shade100),
      MapModel('United Kingdom', 'GBR', Colors.yellow.shade100),
      MapModel('Spain', 'ESP', Colors.yellow.shade300),
      MapModel('France', 'FRA', Colors.yellow.shade500),
      MapModel('Poland', 'POL', Colors.yellow.shade700),
      MapModel('Italy', 'ITA', Colors.yellow.shade800),
      MapModel('Turkey', 'TUR', Colors.orange.shade500),
      MapModel('Iran', 'IRN', Colors.red.shade900),
      MapModel('Saudi Arabia', 'SAU', const Color.fromARGB(255, 97, 48, 53)),
      MapModel('Iraq', 'IRQ', Colors.orange.shade300),
      MapModel('Turkmenistan', 'TKM', Colors.red.shade200),
      MapModel('Uzbekistan', 'UZB', Colors.red.shade600),
      MapModel('Afghanistan', 'AFG', Colors.orange.shade700),
      MapModel('Pakistan', 'PAK', Colors.red.shade800),
      MapModel('Algeria', 'DZA', Colors.purple.shade300),
      MapModel('Egypt', 'EGY', Colors.purple.shade200),
      MapModel('Chad', 'TCD', Colors.purple.shade100),
      MapModel('South Africa', 'ZAF', Colors.purple.shade400),
      MapModel('Morocco', 'MAR', Colors.purple.shade500),
      MapModel('Sudan', 'SDN', Colors.purple.shade600),
      MapModel('Tanzanya', 'TZA', Colors.purple.shade900),
      MapModel('Madagascar', 'MDG', Colors.purple.shade700),
      MapModel('Guinea', 'GIN', Colors.purple.shade800),
      MapModel('Russia', 'RUS', Colors.red.shade100),
      MapModel('Kazakhstan', 'KAZ', Colors.orange.shade400),
      MapModel('Mongolia', 'MNG', Colors.red.shade300),
      MapModel('India', 'IND', const Color.fromARGB(255, 104, 54, 54)),
      MapModel('China', 'CHN', const Color.fromARGB(255, 97, 48, 53)),
      MapModel('South Korea', 'KOR', const Color.fromARGB(255, 58, 20, 24)),
      MapModel('Japan', 'JPN', const Color.fromARGB(255, 170, 29, 43)),
      MapModel('Taiwan', 'TWN', const Color.fromARGB(255, 177, 109, 116)),
      MapModel('Malaysia', 'MYS', Colors.red.shade700),
      MapModel('Indonesia', 'IDN', Colors.red.shade500),
      MapModel('Philippines', 'PHL', Colors.red.shade300),
      MapModel('Australia', 'AUS', Colors.blue.shade900),
      MapModel('New Zealand', 'NZL', Colors.blue.shade600),
      MapModel('New Guinea', 'PNG', Colors.blue.shade300),
    ];
  }
}

/*

class CountryDetailPage extends StatelessWidget {
  final String countryName;

  const CountryDetailPage({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
      ),
      body: Center(
        child: Text(
          'Details for $countryName',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
*/
class MapModel {
  MapModel(this.country, this.countryID, this.color);
  String country;
  String countryID;
  Color color;
}

/* 
  ZoomPanBehavior({bool enablePinching = false, bool enableDoubleTapZooming = false, bool enablePanning = false, 
  bool enableSelectionZooming = false, bool enableMouseWheelZooming = false, 
  double maximumZoomLevel = 0.01, double selectionRectBorderWidth = 1, Color? selectionRectBorderColor, Color? selectionRectColor})
}
 */

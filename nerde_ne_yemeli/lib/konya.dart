import 'package:flutter/material.dart';

class KonyaPage extends StatefulWidget {
  const KonyaPage({super.key});

  @override
  State<KonyaPage> createState() => _KonyaPageState();
}

class _KonyaPageState extends State<KonyaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Text("Konyada Ne Yemeli?",style: TextStyle(color: Colors.black)),
        Icon(Icons.add_location_alt),
        
      ]),
    );
  }
}

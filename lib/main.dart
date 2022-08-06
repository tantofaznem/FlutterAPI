import 'package:flutter/material.dart';
import 'package:flutterapi/models/loins_model.dart';
import 'package:flutterapi/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Loins>? _loinModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _loinModel = (await ApiService().getLoins())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _loinModel == null || _loinModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _loinModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_loinModel![index].loincode.toString()),
                          Text(_loinModel![index].specie),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_loinModel![index].projectcode),
                          Text(_loinModel![index].netweight),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
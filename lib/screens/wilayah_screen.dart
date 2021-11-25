import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WilayahScreen extends StatefulWidget {
  const WilayahScreen({Key? key}) : super(key: key);

  @override
  WilayahScreenState createState() {
    return WilayahScreenState();
  }
}

class WilayahScreenState extends State<WilayahScreen> {
  Future<List<String>> _fetchWilayah() async {
    var url = Uri.parse(
        'https://temenin-isoman.herokuapp.com/bed-capacity/wilayah_json');
    var response =
        await http.get(url, headers: {"Access-Control_Allow_Origin": "*"});

    var data = jsonDecode(response.body);

    List<String> wilayah = [];
    for (var mData in data) {
      wilayah.add(mData["fields"]["nama"]);
    }

    return wilayah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Temenin Isoman - Wilayah',
          style: TextStyle(color: Colors.blueGrey.shade800),
        ),
        iconTheme: IconThemeData(color: Colors.blueGrey.shade800),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Kode Wilayah",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: _fetchWilayah(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Text(data[index]);
                        },
                      );
                    }

                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

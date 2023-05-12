import 'package:flutter/material.dart';

import 'helpers/api_helper.dart';
import 'models/random_model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("RANDOM DATA"),
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: APIHelper.apiHelper.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR : ${snapshot.error} "),
                );
              } else if (snapshot.hasData) {
                random? data = snapshot.data;
                return (data != null)
                    ? Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      height: 305,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(color: Colors.blueGrey, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Name : ${data.nameTitle}. ${data.nameFirst} ${data.nameLast}"),
                                  Row(
                                    children: [
                                      Text("Email : ${data.email}\n"
                                          .split('@')[0]),
                                      const Text("@example.com"),
                                    ],
                                  ),
                                  Text("Phone : ${data.phone}"),
                                  Text("Gender : ${data.gender}\n\n")
                                ],
                              ),
                              Image.network(
                                '${data.image}',
                                width: 75,
                              )
                            ],
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.blueGrey,
                          ),
                          Text(
                              "\nAddress : ${data.streetNumber}, ${data.streetName},"),
                          Text(
                              "                  ${data.state}, ${data.country},"),
                          Text("                  ${data.postcode}\n\n"),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.blueGrey,
                          ),
                          Text("\n Birthday : ${data.birthdate}"
                              .split('T')[0]),
                          Text("Age          : ${data.age}\n")
                        ],
                      ),
                    ),
                  ),
                )
                    : const Center(
                  child: Text("NO DATA...."),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          backgroundColor: Colors.white,
        ));
  }
}

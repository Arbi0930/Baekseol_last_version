import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lapp/Login_page.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      // DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class JoloochPage extends StatefulWidget {
  JoloochPage({
    Key? key,
  }) : super(key: key);

  @override
  State<JoloochPage> createState() => _JoloochPageState();
}

class _JoloochPageState extends State<JoloochPage> {
  DateTime dateTime = DateTime.now();
  final _formkey = GlobalKey<FormState>();

  void _onsar() {
    final date = showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1800),
      lastDate: DateTime(2200),
    );
  }

  void savebutton() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Амжилттай Хадгаллаа"),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => JoloochPage()));
    }
  }

  void LogOutButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        // DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Column(
              children: [
                Text(
                  'Бат',
                  style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 253, 255, 217),
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Жолооч',
                  style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 253, 255, 217),
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 253, 255, 217),
            ),
            elevation: MaterialStatePropertyAll<double>(0),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 253, 255, 217),
        actions: [
          Image(
            image: AssetImage('images/baekseol.png'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/back1.jpg'), fit: BoxFit.fitWidth),
        ),
        child: SafeArea(
            child: Center(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 408.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 288.0),
                      child: Text(
                        "Он сар",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 128.0,
                        top: 10,
                        left: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ElevatedButton(onPressed: _onsar, child: Text('$dateTime')),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  "Б.Бренд",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Б.Нэр",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Т/ширхэг",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Б.үнэ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "У.Дугаар",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "З.Нэр",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "З.мэйл",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "З.хаяг",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "З.Огноо",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Х.Огноо",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Төлбөр",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text("Бренд"),
                                  ),
                                  DataCell(
                                    Text("Нэр"),
                                  ),
                                  DataCell(
                                    Text("12"),
                                  ),
                                  DataCell(
                                    Text("120000₮"),
                                  ),
                                  DataCell(
                                    Text("89111145"),
                                  ),
                                  DataCell(
                                    Text("Бат"),
                                  ),
                                  DataCell(
                                    Text("Bat123@gmail.com"),
                                  ),
                                  DataCell(
                                    Text("БЗФ 26 хороо энканто"),
                                  ),
                                  DataCell(
                                    Text("2022/01/12"),
                                  ),
                                  DataCell(
                                    Text("2022/01/13"),
                                  ),
                                  DataCell(DropdownButtonFormField(
                                      validator: (value) {
                                        if (value == null || value.toString().isEmpty) {
                                          return "Хоосон байж болохгүй";
                                        }
                                        return null;
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 35,
                                        color: Colors.black,
                                      ),
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                      hint: Text("Төлбөр"),
                                      items: [
                                        DropdownMenuItem(
                                          value: "1",
                                          child: Text("Бэлэн"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2",
                                          child: Text("Данс"),
                                        ),
                                        DropdownMenuItem(
                                          value: "3",
                                          child: Text("Карт"),
                                        ),
                                      ],
                                      onChanged: (value) {}))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  foregroundColor: MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: savebutton,
                                child: Text("Хадгалах"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     padding: EdgeInsets.only(left: 10, right: 10),
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         border: Border.all(color: Colors.white),
                          //         borderRadius: BorderRadius.circular(30)),
                          //     child: ElevatedButton(
                          //       style: ButtonStyle(
                          //         elevation: MaterialStateProperty.all(0),
                          //         backgroundColor:
                          //             MaterialStateProperty.all(Colors.white),
                          //         foregroundColor:
                          //             MaterialStateProperty.all(Colors.black),
                          //       ),
                          //       onPressed: LogOutButton,
                          //       child: Text("Гарах"),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1800),
        lastDate: DateTime(2200),
      );
}

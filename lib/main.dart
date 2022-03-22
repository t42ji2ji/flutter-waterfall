import 'package:flutter/material.dart';
import 'package:playsee/mainViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainViewModel viewModel = MainViewModel();
  Color primaryColor = Color(0xFF2D4146);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await viewModel.getJsonData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_back_ios,
                          color: primaryColor,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(),
                            cursorColor: primaryColor,
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                prefixIcon:
                                    Icon(Icons.search, color: primaryColor),
                                // border: InputBorder.none,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                hintText: '搜尋',
                                fillColor: Color(0xFFF4F4F4),
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: viewModel.getWidget(),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 30,
                      color: primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.people,
                      size: 30,
                      color: primaryColor,
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

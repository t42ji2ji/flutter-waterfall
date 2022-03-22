import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playsee/service.dart';

class MainViewModel {
  List<dynamic> data = [];
  String genPhotoThumbNail(id) {
    return 'http://g-pst.framy.co/stk/$id.jpg';
  }

  String test() {
    var id = data[0]['id'];
    return genPhotoThumbNail(id);
  }

  getJsonData() async {
    var res = await Service().dio.get('/test1.0/backstage/exm1');
    Map<String, dynamic> datas = jsonDecode(res.toString());
    data = datas['p'];
    print(data.length);
    print(test());
  }

  Widget normalCard(color, id) {
    return Expanded(flex: 1, child: baseCard(id));
  }

  Widget baseCard(id) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(genPhotoThumbNail(id)))),
        height: 100,
        margin: EdgeInsets.all(1),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '贊助',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://source.unsplash.com/random/100x100',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  id,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getWidget() {
    List<Widget> widgets = [];
    for (int i = 0; i < data.length / 3; i++) {
      if (i % 2 != 0) {
        widgets.add(
          Row(
            children: <Widget>[
              Expanded(flex: 2, child: baseCard(data[i * 3]['id'])),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    baseCard(data[i * 3 + 1]['id']),
                    baseCard(data[i * 3 + 2]['id'])
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        widgets.add(Row(
          children: <Widget>[
            normalCard(Colors.green, data[i * 3]['id']),
            normalCard(Colors.yellow, data[i * 3 + 1]['id']),
            normalCard(Colors.red, data[i * 3 + 2]['id']),
          ],
        ));
      }
    }
    return widgets;
  }
}

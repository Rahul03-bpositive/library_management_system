import 'package:flutter/material.dart';

Color color(String color) {
  return Color(int.parse('0xFF${color.replaceAll('#', '')}'));
}

ListTile listtile(List quickAction, int index) {
  return ListTile(
    leading: quickAction[index]['leading'],
    title: Text(quickAction[index]['title']),
    subtitle: Text(quickAction[index]['subtitle']),
    trailing: quickAction[index]['trailing'],
  );
}

dynamic listtile1(List<Map<String, dynamic>> quickAction, int index) {
  return Padding(
    padding: EdgeInsets.zero,
    child: ListTile(
      minTileHeight: 50,
      leading: quickAction[index]['leading'],
      title: Text(quickAction[index]['title'], style: TextStyle(fontSize: 13)),
      trailing: quickAction[index]['trailing'],
    ),
  );
}

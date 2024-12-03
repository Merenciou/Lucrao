// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Api {
//   static const baseUrl = 'http://192.168.3.101/api/';

//   static addGainMonth(Map mData) async {
//     print('aqqqqqqqqqqqqqui $mData');
//     var url = Uri.parse('${baseUrl}add_month');
//     try {
//       final res = await http.post(url, body: mData);

//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body.toString());
//         print(data);
//       } else {
//         print('ERRRO AO OBTER DADOSSSSSSSSSSS');
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }

import 'package:flutter/material.dart';

import './models/person-helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HandlerPersonHelper extends ChangeNotifier {
  HandlerPersonHelper() {
    initPerson();
  }
  void initPerson() async {
    var url = Uri.parse('https://randomuser.me/api/');
    var response = await http.get(url);
    print(convert.jsonDecode(response.body)['results']);

    // print(res.body);
  }

  List<PersonHelp> personsHelp = [
    PersonHelp(
      name: "Esso",
      lastname: "Pantong",
      description:
          "ผมมีประสบการณ์ประกอบเฟอร์นิเจอร์มาตั้งแต่ยังหนุ่ม ผมมีประสบการณ์มา 8 ปี ทำงานที่ HomePro ทั้งการส่งของติดตั้งและประกอบชิ้นส่วนคุณสามารถเชื่อใจผีมือผมได้ ให้ผมบริการคุณนะครับ",
      serviceType: "Handyman",
      image: "assets/handyman/man1.jpeg",
      sex: "Male",
      age: 20,
    ),
    PersonHelp(
      name: "Nattapatpol",
      lastname: "Keawsaisoon",
      description:
          "ผมเป็นคนตั้งใจทำงานที่ได้รับมอบหมายเป็นอย่างดีผมทำตามคำสั่งให้เกียติคุณและดูแลสิ่งของของคุณ ผมมีเกียติบัตรประกอบอาชีพช่างประปาและช่างทั่วไป คุณสามารถเรียกใช้ผมได้ตามต้องการ",
      serviceType: "Handyman",
      image: "assets/handyman/man2.jpeg",
      sex: "Male",
      age: 20,
    ),
    PersonHelp(
      name: "Korn",
      lastname: "",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: 'assets/handyman/man3.jpeg',
      sex: "Male",
      age: 20,
    ),
    PersonHelp(
      name: "MayBe",
      lastname: "",
      description:
          "ฉันเคยทำงานที่ IKEA ฉันมีความสามารถในการประกอบเฟอร์นิเจอร์ ฉันมีประการณ์บริการลูกค้าในการประกอบสินค้า เฟอร์นิเจอร์และอุปกรณ์ต่างๆ คุณสามารถมั่นใจผีมือของฉันได้ แน่นอนฉันจะไม่ทำให้คุณผิดหวัง",
      serviceType: "Handyman",
      image: 'assets/handyman/man4.jpeg',
      sex: "Famale",
      age: 20,
    ),
    PersonHelp(
      name: "Pin",
      lastname: "Sukjaroen",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: 'assets/handyman/man5.jpeg',
      sex: "Male",
      age: 20,
    ),
  ];

  List<PersonHelp> get getAllPersonHelper => [...this.personsHelp];

  List<PersonHelp> getPersonHelperWithService(String serviceType) {
    return getAllPersonHelper
        .where((person) => person.serviceType == serviceType)
        .toList();
  }
}

//  PersonHelp(
//       name: "B",
//       lastname: "b",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Personal Assistant",
//     ),
//     PersonHelp(
//       name: "E",
//       lastname: "e",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Party Events",
//     ),
//     PersonHelp(
//       name: "F",
//       lastname: "f",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Party Events",
//     ),
//     PersonHelp(
//       name: "G",
//       lastname: "g",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Wait in Line",
//     ),
//     PersonHelp(
//       name: "H",
//       lastname: "h",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Wait in Line",
//     ),

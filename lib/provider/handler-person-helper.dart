import 'dart:math';

import 'package:flutter/material.dart';

import './models/person-helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HandlerPersonHelper extends ChangeNotifier {
  Future<void> initPerson() async {
    return Future.delayed(Duration(milliseconds: 1000));
    // List serviceType = [
    //   "Handyman",
    //   "Personal Assistant",
    //   "Party Events",
    //   "Wait in Line",
    //   "Office Service",
    //   "Yardwork Garden",
    //   "Delivery",
    //   "Moving Service",
    //   "Friend For You",
    //   "Cleaning",
    //   "Furniture Assembly",
    //   "Cooking",
    // ];

    // var url = Uri.parse('https://randomuser.me/api/');
    // for (var i = 0; i < 30; i++) {
    //   var response = await http.get(url);
    //   var personFromApi = convert.jsonDecode(response.body)['results'][0];
    //   personsHelp.add(PersonHelp(
    //     name: personFromApi['name']['first'],
    //     lastname: personFromApi['name']['last'],
    //     age: personFromApi['dob']['age'],
    //     description:
    //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
    //     image: personFromApi['picture']['thumbnail'],
    //     serviceType: serviceType[Random().nextInt(6)],
    //     gender: personFromApi['gender'],
    //   ));
    // }
    // print(res.body);
  }

  List<PersonHelp> personsHelp = [
    PersonHelp(
        name: "Esso",
        lastname: "Pantong",
        description:
            "ผมมีประสบการณ์ประกอบเฟอร์นิเจอร์มาตั้งแต่ยังหนุ่ม ผมมีประสบการณ์มา 8 ปี ทำงานที่ HomePro ทั้งการส่งของติดตั้งและประกอบชิ้นส่วนคุณสามารถเชื่อใจผีมือผมได้ ให้ผมบริการคุณนะครับ",
        serviceType: "Handyman",
        image: "assets/handyman/electric_man.jpeg",
        gender: "Male",
        age: 20,
        jobType: "ช่างไฟ",
        imageSkill: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfSFYK47R0h0y5IoDqeSnYDHMi19QnQuvHJQ&usqp=CAU',
          'https://assets.siccode.com/i-s-b/sic-code-7629-electrical-electronic-repair-shops.jpg'
        ]),
    PersonHelp(
        name: "Nattapatpol",
        lastname: "Keawsaisoon",
        description:
            "ผมเป็นคนตั้งใจทำงานที่ได้รับมอบหมายเป็นอย่างดีผมทำตามคำสั่งให้เกียติคุณและดูแลสิ่งของของคุณ ผมมีเกียติบัตรประกอบอาชีพช่างประปาและช่างทั่วไป คุณสามารถเรียกใช้ผมได้ตามต้องการ",
        serviceType: "Handyman",
        image: "assets/handyman/plumber_man.jpeg",
        gender: "Male",
        age: 20,
        jobType: 'ช่างประปา',
        imageSkill: [
          'https://stmath09.files.wordpress.com/2016/04/e0b88ae0b988e0b8b2e0b887e0b89be0b8a3e0b8b0e0b89be0b8b211.jpg',
          'https://i0.wp.com/taarifa.rw/wp-content/uploads/2021/02/NJYIZcSAE5ODTImqJirgg7kunj18e3wK1598976088.jpg?w=1000&ssl=1'
        ]),
    PersonHelp(
        name: "Korn",
        lastname: "",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
        serviceType: "Handyman",
        image: 'assets/handyman/wood_man.jpeg',
        gender: "Male",
        age: 20,
        jobType: 'ช่างไม้',
        imageSkill: [
          'https://images.squarespace-cdn.com/content/v1/5602c473e4b0a65d125ef0dc/1554644928528-UP5UHEXD7LJ10OLSER2W/ke17ZwdGBToddI8pDm48kAJsswp0EXV6qc0SOJ8DOsUUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKc_E7dXkCi7l7eF32s1E_vQW45WD95yMX6bcbEP6L1pnbQgytvpF9JKWwbDEjqe30p/Carpenter.jpg',
          'https://storage.googleapis.com/air-multi-tmbi-cpt-uploads/wp-content/uploads/2020/03/4e43e850-61u5vx9jfvl._ac_sl1000_-1024x1024.jpg'
        ]),
    PersonHelp(
        name: "MayBe",
        lastname: "",
        description:
            "ฉันเคยทำงานที่ IKEA ฉันมีความสามารถในการประกอบเฟอร์นิเจอร์ ฉันมีประการณ์บริการลูกค้าในการประกอบสินค้า เฟอร์นิเจอร์และอุปกรณ์ต่างๆ คุณสามารถมั่นใจผีมือของฉันได้ แน่นอนฉันจะไม่ทำให้คุณผิดหวัง",
        serviceType: "Handyman",
        image: 'assets/handyman/barber_man.jpeg',
        gender: "Famale",
        age: 20,
        jobType: 'ช่างตัดผม',
        imageSkill: [
          'https://content3.jdmagicbox.com/comp/firozabad/b6/9999p5612.5612.170730122710.b7b6/catalogue/forgein-hair-cut-salon-shikohabad-firozabad-men-beauty-parlours-g260xtjnuo.jpg?clr=3e3328',
          'https://www.menshairstylestoday.com/wp-content/uploads/2019/02/Comb-Over-Tapered-Haircut.jpg'
        ]),
    PersonHelp(
        name: "Pin",
        lastname: "Sukjaroen",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
        serviceType: "Handyman",
        image: 'assets/handyman/mechanics_man.jpeg',
        gender: "Male",
        age: 20,
        jobType: 'ช่างยนต์',
        imageSkill: [
          'https://miro.medium.com/max/4320/1*JktzC9GrA_l4yz0cCy8a5Q.jpeg',
          'https://img2.thejournal.ie/article/4814747/river?version=4814834&width=1340'
        ]),
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

// PersonHelp(
//       name: "Esso",
//       lastname: "Pantong",
//       description:
//           "ผมมีประสบการณ์ประกอบเฟอร์นิเจอร์มาตั้งแต่ยังหนุ่ม ผมมีประสบการณ์มา 8 ปี ทำงานที่ HomePro ทั้งการส่งของติดตั้งและประกอบชิ้นส่วนคุณสามารถเชื่อใจผีมือผมได้ ให้ผมบริการคุณนะครับ",
//       serviceType: "Handyman",
//       image: "assets/handyman/man1.jpeg",
//       gender: "Male",
//       age: 20,
//     ),
//     PersonHelp(
//       name: "Nattapatpol",
//       lastname: "Keawsaisoon",
//       description:
//           "ผมเป็นคนตั้งใจทำงานที่ได้รับมอบหมายเป็นอย่างดีผมทำตามคำสั่งให้เกียติคุณและดูแลสิ่งของของคุณ ผมมีเกียติบัตรประกอบอาชีพช่างประปาและช่างทั่วไป คุณสามารถเรียกใช้ผมได้ตามต้องการ",
//       serviceType: "Handyman",
//       image: "assets/handyman/man2.jpeg",
//       gender: "Male",
//       age: 20,
//     ),
//     PersonHelp(
//       name: "Korn",
//       lastname: "",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Handyman",
//       image: 'assets/handyman/man3.jpeg',
//       gender: "Male",
//       age: 20,
//     ),
//     PersonHelp(
//       name: "MayBe",
//       lastname: "",
//       description:
//           "ฉันเคยทำงานที่ IKEA ฉันมีความสามารถในการประกอบเฟอร์นิเจอร์ ฉันมีประการณ์บริการลูกค้าในการประกอบสินค้า เฟอร์นิเจอร์และอุปกรณ์ต่างๆ คุณสามารถมั่นใจผีมือของฉันได้ แน่นอนฉันจะไม่ทำให้คุณผิดหวัง",
//       serviceType: "Handyman",
//       image: 'assets/handyman/man4.jpeg',
//       gender: "Famale",
//       age: 20,
//     ),
//     PersonHelp(
//       name: "Pin",
//       lastname: "Sukjaroen",
//       description:
//           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
//       serviceType: "Handyman",
//       image: 'assets/handyman/man5.jpeg',
//       gender: "Male",
//       age: 20,
//     ),

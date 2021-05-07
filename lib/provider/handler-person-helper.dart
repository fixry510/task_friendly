import 'package:flutter/material.dart';

import './models/person-helper.dart';

class HandlerPersonHelper extends ChangeNotifier {
  List<PersonHelp> personsHelp = [
    PersonHelp(
      name: "Esso",
      lastname: "Pantong",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: "assets/handyman/man1.jpeg",
    ),
    PersonHelp(
      name: "Nattapatpol",
      lastname: "",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: "assets/handyman/man2.jpeg",
    ),
    PersonHelp(
      name: "Korn",
      lastname: "",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: 'assets/handyman/man3.jpeg',
    ),
    PersonHelp(
      name: "MayBe",
      lastname: "",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: 'assets/handyman/man4.jpeg',
    ),
    PersonHelp(
      name: "Pin",
      lastname: "Sukjaroen",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
      serviceType: "Handyman",
      image: 'assets/handyman/man5.jpeg',
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

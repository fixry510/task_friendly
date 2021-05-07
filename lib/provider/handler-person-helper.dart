import 'package:flutter/material.dart';

import './models/person-helper.dart';

class HandlerPersonHelper extends ChangeNotifier {
  List<PersonHelp> personsHelp = [
    PersonHelp(
      name: "Peter",
      lastname: "Keawsaisoon",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
    ),
    PersonHelp(
      name: "Esso",
      lastname: "Pantong",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
    ),
    PersonHelp(
      name: "Maybe",
      lastname: "Maybeee",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
    ),
    PersonHelp(
      name: "Kon",
      lastname: "Footkon",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
    ),
  ];

  List<PersonHelp> get getPersonHelper => [...this.personsHelp];
}

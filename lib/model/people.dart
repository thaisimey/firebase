// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

People peopleFromJson(String str) => People.fromJson(json.decode(str));
String peopleToJson(People data) => json.encode(data.toJson());

class People {
  People({
    this.glossary,
  });

  Glossary glossary;

  factory People.fromJson(Map<String, dynamic> json) => People(
    glossary: Glossary.fromJson(json["glossary"]),
  );

  Map<String, dynamic> toJson() => {
    "glossary": glossary.toJson(),
  };
}

class Glossary {
  Glossary({
    this.title,
    this.glossDiv,
  });

  String title;
  GlossDiv glossDiv;

  factory Glossary.fromJson(Map<String, dynamic> json) => Glossary(
    title: json["title"],
    glossDiv: GlossDiv.fromJson(json["GlossDiv"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "GlossDiv": glossDiv.toJson(),
  };
}

class GlossDiv {
  GlossDiv({
    this.title,
    this.glossList,
  });

  String title;
  GlossList glossList;

  factory GlossDiv.fromJson(Map<String, dynamic> json) => GlossDiv(
    title: json["title"],
    glossList: GlossList.fromJson(json["GlossList"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "GlossList": glossList.toJson(),
  };
}

class GlossList {
  GlossList({
    this.glossEntry,
  });

  GlossEntry glossEntry;

  factory GlossList.fromJson(Map<String, dynamic> json) => GlossList(
    glossEntry: GlossEntry.fromJson(json["GlossEntry"]),
  );

  Map<String, dynamic> toJson() => {
    "GlossEntry": glossEntry.toJson(),
  };
}

class GlossEntry {
  GlossEntry({
    this.id,
    this.sortAs,
    this.glossTerm,
    this.acronym,
    this.abbrev,
    this.glossDef,
    this.glossSee,
  });

  String id;
  String sortAs;
  String glossTerm;
  String acronym;
  String abbrev;
  GlossDef glossDef;
  String glossSee;

  factory GlossEntry.fromJson(Map<String, dynamic> json) => GlossEntry(
    id: json["ID"],
    sortAs: json["SortAs"],
    glossTerm: json["GlossTerm"],
    acronym: json["Acronym"],
    abbrev: json["Abbrev"],
    glossDef: GlossDef.fromJson(json["GlossDef"]),
    glossSee: json["GlossSee"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "SortAs": sortAs,
    "GlossTerm": glossTerm,
    "Acronym": acronym,
    "Abbrev": abbrev,
    "GlossDef": glossDef.toJson(),
    "GlossSee": glossSee,
  };
}

class GlossDef {
  GlossDef({
    this.para,
    this.glossSeeAlso,
  });

  String para;
  List<String> glossSeeAlso;

  factory GlossDef.fromJson(Map<String, dynamic> json) => GlossDef(
    para: json["para"],
    glossSeeAlso: List<String>.from(json["GlossSeeAlso"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "para": para,
    "GlossSeeAlso": List<dynamic>.from(glossSeeAlso.map((x) => x)),
  };
}

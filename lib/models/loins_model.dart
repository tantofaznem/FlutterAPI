// To parse this JSON data, do
//
//     final loins = loinsFromJson(jsonString);

import 'dart:convert';

List<Loins> loinsFromJson(String str) => List<Loins>.from(json.decode(str).map((x) => Loins.fromJson(x)));

String loinsToJson(List<Loins> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Loins {
    Loins({
        this.loincode,
        this.code,
        this.specie,
        this.grade,
        this.vesselname,
        this.type,
        this.productformat,
        this.dateprocessed,
        this.datebb,
        this.projectcode,
        this.netweight,
        this.producttype,
        this.oldoc,
    });

    String loincode;
    String code;
    String specie;
    String grade;
    String vesselname;
    String type;
    String productformat;
    DateTime dateprocessed;
    DateTime datebb;
    String projectcode;
    String netweight;
    String producttype;
    String oldoc;

    factory Loins.fromJson(Map<String, dynamic> json) => Loins(
        loincode: json["loincode"],
        code: json["code"],
        specie: json["specie"],
        grade: json["grade"],
        vesselname: json["vesselname"],
        type: json["type"],
        productformat: json["productformat"],
        dateprocessed: DateTime.parse(json["dateprocessed"]),
        datebb: DateTime.parse(json["datebb"]),
        projectcode: json["projectcode"],
        netweight: json["netweight"],
        producttype: json["producttype"],
        oldoc: json["oldoc"],
    );

    Map<String, dynamic> toJson() => {
        "loincode": loincode,
        "code": code,
        "specie": specie,
        "grade": grade,
        "vesselname": vesselname,
        "type": type,
        "productformat": productformat,
        "dateprocessed": "${dateprocessed.year.toString().padLeft(4, '0')}-${dateprocessed.month.toString().padLeft(2, '0')}-${dateprocessed.day.toString().padLeft(2, '0')}",
        "datebb": "${datebb.year.toString().padLeft(4, '0')}-${datebb.month.toString().padLeft(2, '0')}-${datebb.day.toString().padLeft(2, '0')}",
        "projectcode": projectcode,
        "netweight": netweight,
        "producttype": producttype,
        "oldoc": oldoc,
    };
}

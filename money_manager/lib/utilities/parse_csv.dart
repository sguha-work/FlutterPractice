import 'dart:convert';
import 'dart:typed_data';
import 'package:collection/collection.dart';

class ParseCSV {
  static final instance = ParseCSV();
  String _getCharecterCode(selectedFile) {
    try {
      String charecterCodeString = String.fromCharCodes(selectedFile.bytes);
      return charecterCodeString;
    } catch (e) {
      return 'error' + e.toString();
    }
  }

  static String getCSVDataAsString(selectedFile) {
    String s = instance._getCharecterCode(selectedFile.bytes);
    if (s == 'error') {
      return s;
    }
    var outputAsUint8List = Uint8List.fromList(s.codeUnits);
    return utf8.decode(outputAsUint8List);
  }

  static List<dynamic> getCSVLines(selectedFile) {
    List csvFileContentList = [];
    String s = instance._getCharecterCode(selectedFile);
    if (s == 'error') {
      return [s];
    }
    var outputAsUint8List = Uint8List.fromList(s.codeUnits);
    csvFileContentList = utf8.decode(outputAsUint8List).split('\n');
    return csvFileContentList;
  }

  static String getJSONFromCSV(selectedFile) {
    List lines = getCSVLines(selectedFile);
    String outputJSON = '';
    List<String> headers = lines[0].split(',');
    List<Map<String, dynamic>> listOfObject = [];
    for (int index1 = 1; index1 < lines.length; index1++) {
      final chunks = lines[index1].split(',');
      chunks.asMap().forEach((index, element) {
        Map<String, dynamic> objectData = {headers[index]: element};
        listOfObject.add(objectData);
      });
    }
    outputJSON = jsonEncode(listOfObject);
    return outputJSON;
  }
}

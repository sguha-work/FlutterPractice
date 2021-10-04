import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../utilities/parse_csv.dart';

class UploadCSV extends StatefulWidget {
  const UploadCSV({Key? key}) : super(key: key);
  @override
  State<UploadCSV> createState() => _UploadCSV();
}

class _UploadCSV extends State<UploadCSV> {
  late PlatformFile selectedFile;

  Future selectCSVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        withData: true,
        type: FileType.custom,
        allowedExtensions: ['csv']);

    if (result != null) {
      selectedFile = result.files.first;
      //showMyDialog(selectedFile);
      showMyDialog(ParseCSV.getJSONFromCSV(selectedFile));
    } else {
      //selectedFile = null;
    }
  }

  // Future<String> parseCSV(selectedFile) async {
  //   List csvList = [];
  //   List csvFileContentList = [];
  //   List CsvModuleList = [];
  //   try {
  //     String s = String.fromCharCodes(selectedFile.bytes);
  //     var outputAsUint8List = Uint8List.fromList(s.codeUnits);
  //     csvFileContentList = utf8.decode(outputAsUint8List).split('\n');
  //     //print('Selected CSV File contents: ');
  //     showMyDialog(csvFileContentList.toString());
  //   } catch (e) {
  //     //print(e.toString());
  //     return 'Error: ' + e.toString();
  //   }
  //   throw () {
  //     return '';
  //   };
  // }

  Future<void> showMyDialog(data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('File content'),
                Text(data),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: selectCSVFile,
            child: const Text('Select file'),
          ),
        ],
      ),
    );
  }
}

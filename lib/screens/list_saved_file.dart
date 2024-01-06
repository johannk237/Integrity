import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:integrity/components/side_menu.dart';
import 'package:permission_handler/permission_handler.dart';

class ListSavedFile extends StatefulWidget {
  const ListSavedFile({super.key});

  @override
  State<ListSavedFile> createState() => _ListSavedFileState();
}

class _ListSavedFileState extends State<ListSavedFile> {
  File? _file;

  String hash() {
    List<int> bytes = utf8.encode(_file!.readAsBytesSync().toString());
    String hash = sha256.convert(bytes).toString();
    return hash;
  }

  getFile() async{
    await Permission.storage.request();
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null){
      final file = File(result.files.single.path!);
      setState(() {
        _file = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List Saved Files", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50,),
              Text(_file!=null?"File Name":"No file is selected"),
              _file!=null?Image.file(File(_file!.path)):Container(),
              // Pick file first

              Text(_file!=null?_file!.path.split("/").last:""),
              Text(_file!=null?_file!.path:""),
              const SizedBox(height: 20,),
              Text(_file!=null?hash():""),
              ElevatedButton(
                  onPressed: (){
                    getFile();
                  },
                  child: const Text("Select file")),
            ],
          ),
        ),
      ),
    );
  }
}

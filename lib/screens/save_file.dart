import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:integrity/components/side_menu.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveFile extends StatefulWidget {
  const SaveFile({super.key});

  @override
  State<SaveFile> createState() => _SaveFileState();
}

class _SaveFileState extends State<SaveFile> {
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
  save(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Save File", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30,),
              Text(_file!=null?"File Name":"No file is selected", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              Text(_file!=null?_file!.path.split("/").last:"", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20,),
              Text(_file!=null?"File Hash":"", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              Text(_file!=null?hash():"", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20,),
              _file!=null?
              ElevatedButton(
                  onPressed: (){
                    save();
                  },
                  child: const Text("save")):
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

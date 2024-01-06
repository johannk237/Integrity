import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:integrity/components/side_menu.dart';
import 'package:permission_handler/permission_handler.dart';

class CompareFile extends StatefulWidget {
  const CompareFile({super.key});

  @override
  State<CompareFile> createState() => _CompareFileState();
}

class _CompareFileState extends State<CompareFile> {
  File? _file1;
  File? _file2;
  bool compar = false;


  String hash1() {
    List<int> bytes = utf8.encode(_file1!.readAsBytesSync().toString());
    String hash = sha256.convert(bytes).toString();
    return hash;
  }

  String hash2() {
    List<int> bytes = utf8.encode(_file2!.readAsBytesSync().toString());
    String hash = sha256.convert(bytes).toString();
    return hash;
  }

  getFile1() async{
    await Permission.storage.request();
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null){
      final file = File(result.files.single.path!);
      setState(() {
        _file1 = file;
      });
    }
  }
  getFile2() async{
    await Permission.storage.request();
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null){
      final file = File(result.files.single.path!);
      setState(() {
        _file2 = file;
      });
    }
  }

  String compare(){
    if (hash2()==hash1()) {
      return "Your files are the same";
    } else {
      return "Your files are different";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Compare Files", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //const SizedBox(height: 30,),
                Text(_file1!=null?"File Name":"No file is selected", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                Text(_file1!=null?_file1!.path.split("/").last:"", style: const TextStyle(fontSize: 20)),
                //const SizedBox(height: 20,),
                Text(_file1!=null?"File Hash":"", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                Text(_file1!=null?hash1():"", style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10,),

                ElevatedButton(
                    onPressed: (){
                      getFile1();
                    },
                    child: const Text("Select first file")),

                const SizedBox(height: 20,),
                Text(_file2!=null?"File Name":"No file is selected", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                Text(_file2!=null?_file2!.path.split("/").last:"", style: const TextStyle(fontSize: 20)),
                //const SizedBox(height: 20,),
                Text(_file2!=null?"File Hash":"", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                Text(_file2!=null?hash2():"", style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10,),

                ElevatedButton(
                    onPressed: (){
                      getFile2();
                    },
                    child: const Text("Select first file")),
                const SizedBox(height: 20,),
                Text(compar?compare():"", style: const TextStyle(fontSize: 20)),
                (_file1!=null && _file2!=null) ?
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        compar = !compar;
                      });
                    },
                    child: const Text("Compare files")):Container(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

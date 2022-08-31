import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:spice/models/product.dart';

class ProductController extends GetxController {
  final Box _box = Hive.box<Product>('products');

  Box get product => _box;

  bool isDeleteInProgress = false;

  createProduct({required Product product}) {
    _box.add(product);
    update();
  }

  updateProduct({required int key, required Product product}) {
    print("update: ${product.key} ${product.name}");
    _box.put(key, product);
    update();
  }

  deleteProduct({required int key}) {
    _box.delete(key);
    update();
  }

  Future delete() async {
    isDeleteInProgress = true;
    update();
    var result = await Future.delayed(Duration(milliseconds: 500), () async {
      var value = await _box.clear();
      print(">>> deleted value: $value");
      isDeleteInProgress = false;
      update();
      return value;
    });
    return result; //ha nulla vagy nagyobb akk sikeres
  }

  Future<void> makingBackup(BuildContext context) async {
    /*Directory? selectedDirectory = await FolderPicker.pick(
        allowFolderCreation: true,
        context: context,
        rootDirectory: Directory(FolderPicker.rootPath),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));*/
    if (_box.length != 0) {
      String? selected = await FilePicker.platform.getDirectoryPath();
      print(selected);
      if (selected != null) {
        Directory selectedDirectory = Directory(selected);

        Map<String, Product> map =
            _box.toMap().map((key, value) => MapEntry(key.toString(), value));
        String json = JsonEncoder().convert(map);
        print(json);
        Directory dir = selectedDirectory;
        String formattedDate = DateTime.now()
            .toString()
            .replaceAll('.', '-')
            .replaceAll(' ', '-')
            .replaceAll(':', '-');
        await File('${dir.path}/$formattedDate.json').writeAsString(json);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Backup saved in folder Passman')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nincs adat')),
      );
    }
  }

  restore(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.first.path!);
      _box.clear();
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      for (var i in map.entries) {
        print(i);
        _box.add(Product.fromJson(i.value));
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Restored Successfully...')),
      );
    }
/*    final Directory rootPath = Directory("/storage/emulated/0/");
    String? path = await FilesystemPicker.open(
      title: 'Save to folder',
      context: context,
      rootDirectory: rootPath,
      fsType: FilesystemType.folder,
      pickText: 'Save file to this folder',
      contextActions: [
        FilesystemPickerNewFolderContextAction(),
      ],
    );
    print(path);*/
    update();
  }

  deleteAll() {
    _box.clear();
    update();
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spice/models/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductController extends GetxController {
  final Box _box = Hive.box<Product>('products');

  Box get product => _box;

  bool isDeleteInProgress = false;

  createProduct({required Product product}) {
    _box.add(product);
    update();
  }

  updateProduct({required int key, required Product product}) {
    _box.put(key, product);
    update();
  }

  deleteProduct({required int key}) {
    _box.delete(key);
    update();
  }

  Future delete(BuildContext context, String delete) async {
    isDeleteInProgress = true;
    update();
    var result = await Future.delayed(Duration(milliseconds: 500), () async {
      var value = await _box.clear();
      isDeleteInProgress = false;
      update();
      return value;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(delete)));
    return result;
  }

  Future<void> makingBackup(
      BuildContext context, String backup1, String backup2) async {
    if (_box.length != 0) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();

      if (statuses[Permission.storage] == PermissionStatus.granted) {
        String? selected = await FilePicker.platform.getDirectoryPath();

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
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$backup1: $selected')));
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(backup2)));
    }
  }

  restore(BuildContext context, String restore) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage] == PermissionStatus.granted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.first.path!);
        _box.clear();
        Map<String, dynamic> map = jsonDecode(await file.readAsString());
        for (var i in map.entries) {
          print(i);
          _box.add(Product.fromJson(i.value));
        }

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(restore)));
      }
      update();
    }
  }

  deleteAll() {
    _box.clear();
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    Hive.close();
    super.onClose();
  }
}

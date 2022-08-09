import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:spice/models/product.dart';

class ProductController extends GetxController {
  final Box _box = Hive.box<Product>('products');

  Box get product => _box;

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
}

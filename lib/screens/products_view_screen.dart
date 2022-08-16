import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/screens/products_add_screen.dart';
import 'package:spice/screens/products_edit_screen.dart';
import 'package:spice/widgets/button_widget.dart';
import '../global.dart';

class ProductsViewScreen extends StatelessWidget {
  ProductsViewScreen({Key? key}) : super(key: key) {}
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.background,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: color.mainText,
          ),
          onPressed: () => Get.back(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Termékek",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.sp),
        child: GetBuilder<ProductController>(builder: (cont) {
          if (cont.product.length == 0) {
            return Center(
                child: Text(
              "Nincs termék",
              style: TextStyle(color: color.inputBorder, fontSize: 10.sp),
            ));
          } else {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cont.product.length,
                itemBuilder: (context, index) {
                  Product product = cont.product.getAt(index);
                  return ButtonWidget(
                    function: () {
                      Get.to(
                          () => ProductsEditScreen(
                                product: product,
                                controller: productController,
                              ),
                          transition: Transition.cupertino);
                    },
                    title: SizedBox(
                      height: 25.sp,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(product.name,
                            style: TextStyle(
                              color: color.secondText,
                              fontSize: 15.sp,
                            )),
                      ),
                    ),
                  );
                });
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
              () => ProductsAddScreen(
                    controller: productController,
                  ),
              transition: Transition.rightToLeft);
        },
        child: Icon(
          Icons.add,
          color: color.mainText,
        ),
        backgroundColor: color.mainButton,
      ),
    );
  }
}

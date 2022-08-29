import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/data_controller.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/screens/products/products_edit_screen.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../global.dart';

class QuickAccessScreen extends StatelessWidget {
  QuickAccessScreen({Key? key, required this.productController})
      : super(key: key) {}
  ProductController productController;
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
          preferredSize: Size.fromHeight(40.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget("Gyors elérés"),
                ),
                LineWidget(),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5.sp, right: 14.sp, left: 14.sp),
        child: Column(
          children: [
            SubTextWidget(
                "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából vagy"),
            SizedBox(
              height: 5.sp,
            ),
            Flexible(
              child: GetBuilder<ProductController>(builder: (cont) {
                if (cont.product.length == 0) {
                  return Center(
                      child: Text(
                    "Nincs termék",
                    style: TextStyle(color: color.subText, fontSize: 10.sp),
                  ));
                } else {
                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cont.product.length,
                      itemBuilder: (context, index) {
                        Product product = cont.product.getAt(index);
                        return LineButtonWidget(
                          function: () {
                            cont.updateProduct(
                                key: product.key,
                                product: Product(
                                  name: product.name,
                                  quantity: product.quantity,
                                  spices: product.spices,
                                  isFavorite: !(product.isFavorite),
                                ));
                          },
                          leading: Icon(
                            (product.isFavorite)
                                ? CupertinoIcons.check_mark_circled
                                : CupertinoIcons.circle,
                            color: color.mainText,
                            size: 14.sp,
                          ),
                          title: SizedBox(
                            height: 25.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                product.name,
                                style: TextStyle(
                                  color: color.secondText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          background: (product.isFavorite)
                              ? color.blue
                              : color.flatButton,
                        );
                      });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

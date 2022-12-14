import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../controllers/language_controller.dart';
import '../../global.dart';

class QuickAccessScreen extends StatelessWidget {
  QuickAccessScreen({Key? key, required this.productController})
      : super(key: key);
  ProductController productController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.color.background,
            appBar: AppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: theme.color.background,
              automaticallyImplyLeading: false,
              leading: IconButton(
                tooltip: controller.otherBack,
                icon: Icon(
                  Icons.arrow_back,
                  size: 20.sp,
                  color: theme.color.mainText,
                ),
                onPressed: () => Get.back(),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.sp),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Column(
                    children: [
                      FadeInUp(
                        duration: Duration(milliseconds: 600),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: MainTextWidget(controller.quickAccessHeader1),
                        ),
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 600),
                        child: LineWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 5.sp, right: 14.sp, left: 14.sp),
              child: Column(
                children: [
                  FadeInUp(
                    duration: Duration(milliseconds: 600),
                    child: SubTextWidget(controller.quickAccessDescription1),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Flexible(
                    child: GetBuilder<ProductController>(builder: (cont) {
                      if (cont.product.length == 0) {
                        return FadeInUp(
                          duration: Duration(milliseconds: 600),
                          child: Center(
                              child: Text(
                            controller.noProduct,
                            style: TextStyle(
                                color: theme.color.subText, fontSize: 10.sp),
                          )),
                        );
                      } else {
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: cont.product.length,
                            itemBuilder: (context, index) {
                              Product product = cont.product.getAt(index);
                              return FadeInUp(
                                duration:
                                    Duration(milliseconds: (index * 100 + 700)),
                                child: LineButtonWidget(
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
                                    color: (product.isFavorite)
                                        ? theme.color.white
                                        : theme.color.mainText,
                                    size: 14.sp,
                                  ),
                                  title: SizedBox(
                                    height: 25.sp,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        product.name,
                                        style: TextStyle(
                                          color: (product.isFavorite)
                                              ? theme.color.white
                                              : theme.color.secondText,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  background: (product.isFavorite)
                                      ? theme.color.blue
                                      : theme.color.flatButton,
                                ),
                              );
                            });
                      }
                    }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

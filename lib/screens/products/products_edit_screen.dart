import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/controllers/spice_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/models/spice.dart';
import 'package:spice/screens/spices/spice_add_screen.dart';
import 'package:spice/screens/spices/spice_edit_screen.dart';
import 'package:spice/widgets/input_field_widget.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../controllers/language_controller.dart';
import '../../global.dart';
import '../../widgets/get_dialog_widget.dart';

class ProductsEditScreen extends StatelessWidget {
  ProductsEditScreen(
      {Key? key, required this.product, required this.controller})
      : super(key: key) {
    productNameController.text = product.name;
    productQuantityController.text = product.quantity.toString();
    //referencia nélküli adatátadás
    tempSpiceController.spices.addAll(product.spices);
  }
  final Product product;

  //inputs controller
  TextEditingController productNameController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  //getx controller
  SpiceController tempSpiceController = Get.put(SpiceController());
  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controllerLanguage) {
          return Scaffold(
            backgroundColor: color.background,
            appBar: AppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: color.background,
              automaticallyImplyLeading: false,
              leading: IconButton(
                tooltip: controllerLanguage.otherBack,
                icon: Icon(
                  Icons.arrow_back,
                  size: 20.sp,
                  color: color.mainText,
                ),
                onPressed: () {
                  tempSpiceController.onClose();
                  Get.back();
                },
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 5.sp),
                  child: IconButton(
                    tooltip: controllerLanguage.productEditToolTip1,
                    icon: Icon(
                      CupertinoIcons.delete,
                      size: 16.sp,
                      color: color.mainText,
                    ),
                    onPressed: () {
                      Get.dialog(GetDialogWidget(
                        title: controllerLanguage.alertProductDeleteTitle,
                        description: controllerLanguage.alertProductDelete,
                        buttonTitle: controllerLanguage.alertYes,
                        buttonTitle2: controllerLanguage.alertNo,
                        buttonOnPressed: () {
                          controller.deleteProduct(key: product.key);
                          Get.back(closeOverlays: true);
                        },
                        buttonOnPressed2: () {
                          Get.back();
                        },
                      ));
                    },
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(25.sp),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      controllerLanguage.productEditHeader1,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 8.sp),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.sp, vertical: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFieldWidget(
                      controller: productNameController,
                      autofocus: false,
                      labelText: controllerLanguage.inputText,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 20.sp),
                    InputFieldWidget(
                      controller: productQuantityController,
                      autofocus: false,
                      labelText: controllerLanguage.inputNumber,
                      textInputType: TextInputType.numberWithOptions(),
                      secondLabelText: "Kg",
                    ),
                    SizedBox(height: 5.sp),
                    LineWidget(),
                    SizedBox(height: 5.sp),
                    SecondTextWidget(controllerLanguage.productEditHeader2),
                    SizedBox(height: 5.sp),
                    SubTextWidget(controllerLanguage.productEditDescription1),
                    SizedBox(height: 5.sp),
                    LineButtonWidget(
                      background: color.blue,
                      function: () async {
                        Get.to(SpiceAddScreen(controller: tempSpiceController),
                            transition: Transition.cupertino);
                      },
                      leading: Icon(
                        CupertinoIcons.add,
                        color: color.white,
                        size: 14.sp,
                      ),
                      title: SizedBox(
                        height: 25.sp,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controllerLanguage.productAddButton1,
                            style: TextStyle(
                              color: color.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: color.mainArrow,
                        size: 20.sp,
                      ),
                    ),
                    Expanded(
                      child: GetBuilder<SpiceController>(builder: (cont) {
                        if (cont.spices.length == 0) {
                          return Center(
                              child: Text(
                            controllerLanguage.noSpice,
                            style: TextStyle(
                                color: color.subText, fontSize: 10.sp),
                          ));
                        } else {
                          return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: cont.spices.length,
                              itemBuilder: (context, index) {
                                Spice spice = cont.spices[index];
                                return LineButtonWidget(
                                  function: () async {
                                    Get.to(
                                        SpiceEditScreen(
                                          spice: cont.spices[index],
                                          controller: tempSpiceController,
                                        ),
                                        transition: Transition.cupertino);
                                  },
                                  trailing: Padding(
                                      padding: EdgeInsets.only(right: 10.sp),
                                      child: Text(
                                        spice.quantity.toStringAsFixed(2),
                                        style: TextStyle(
                                          color: color.secondText,
                                          fontSize: 12.sp,
                                        ),
                                      )),
                                  title: SizedBox(
                                    height: 25.sp,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        spice.name,
                                        style: TextStyle(
                                          color: color.secondText,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  background: color.flatButton,
                                );
                              });
                        }
                      }),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: controllerLanguage.productEditToolTip2,
              onPressed: () {
                if (productNameController.text.trim().isEmpty) {
                  Get.dialog(
                    GetDialogWidget(
                      title: controllerLanguage.alertError,
                      description: controllerLanguage.alertProductNameEmpty,
                      buttonTitle: controllerLanguage.alertClose,
                      buttonOnPressed: () => Get.back(),
                    ),
                  );
                } else if (productQuantityController.text.trim().isEmpty) {
                  Get.dialog(
                    GetDialogWidget(
                      title: controllerLanguage.alertError,
                      description: controllerLanguage.alertProductQuantityEmpty,
                      buttonTitle: controllerLanguage.alertClose,
                      buttonOnPressed: () => Get.back(),
                    ),
                  );
                } else if (double.tryParse(
                        productQuantityController.text.replaceAll(',', '.')) ==
                    null) {
                  Get.dialog(
                    GetDialogWidget(
                      title: controllerLanguage.alertError,
                      description: controllerLanguage.alertProductQuantityNaN,
                      buttonTitle: controllerLanguage.alertClose,
                      buttonOnPressed: () => Get.back(),
                    ),
                  );
                } else {
                  double number = double.parse(
                      productQuantityController.text.replaceAll(',', '.'));
                  controller.updateProduct(
                      key: product.key,
                      product: Product(
                        name: productNameController.text.trim(),
                        quantity: number,
                        spices: tempSpiceController.spices,
                        isFavorite: product.isFavorite,
                      ));

                  Get.back();
                }
              },
              child: Icon(
                Icons.check,
                color: color.white,
              ),
              backgroundColor: color.blue,
            ),
          );
        });
  }
}

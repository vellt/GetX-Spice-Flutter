import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/screens/home/quick_access_screen.dart';
import 'package:spice/screens/language/language_screen.dart';
import 'package:spice/screens/products/products_view_screen.dart';
import 'package:spice/screens/calculating/calculating_screen.dart';
import 'package:spice/widgets/big_button_widget.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../controllers/theme_controller.dart' as t;

import '../../controllers/language_controller.dart';
import '../../global.dart';
import '../data/data_view_screen.dart';

class HomeScreen extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controller) {
          return Obx(() {
            return Scaffold(
              backgroundColor: theme.color.background,
              appBar: AppBar(
                shadowColor: Colors.transparent.withOpacity(0.1),
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: theme.color.background,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0.sp),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 12),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.sp),
                            child: Text(
                              "Spice",
                              style: TextStyle(
                                color: theme.color.mainText,
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Container(
                            height: 21.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                                color: theme.color.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(),
                                child: Text(
                                  "v1.3.7",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.sp),
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              IconButton(
                                tooltip: controller.homeToolTip1,
                                splashRadius: 22,
                                icon: Unicon(
                                  Unicons.uniGithub,
                                  color: theme.color.mainText,
                                  size: 20.sp,
                                ),
                                onPressed: () async {
                                  if (await canLaunchUrlString(
                                      "https://github.com/vellt"))
                                    await launchUrlString(
                                        "https://github.com/vellt");
                                },
                              ),
                              IconButton(
                                tooltip: controller.homeToolTip2,
                                splashRadius: 22,
                                icon: Icon(
                                  (theme.isDarkMode)
                                      ? Icons.light_mode
                                      : Icons.dark_mode,
                                  color: theme.color.secondText,
                                  size: 20.sp,
                                ),
                                onPressed: () =>
                                    theme.setTheme(theme: t.Themes.next),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(right: 14.sp, left: 14.sp),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      LineWidget(),
                      SizedBox(height: 8.sp),
                      FadeInUp(
                          duration: Duration(milliseconds: 600),
                          child: SecondTextWidget(language.homeHeader1)),
                      SizedBox(height: 5.sp),
                      FadeInUp(
                        duration: Duration(milliseconds: 600),
                        child: SubTextWidget(language.homeDescription1),
                      ),
                      SizedBox(height: 10.sp),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: FadeInUp(
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              height: 135.sp,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FadeInRight(
                                    duration: Duration(milliseconds: 500),
                                    child: BigButtonWidget(
                                      onPressed: () {
                                        Get.to(
                                            () => QuickAccessScreen(
                                                productController:
                                                    productController),
                                            transition: Transition.downToUp);
                                      },
                                      background: theme.color.background,
                                      isDotted: true,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                                CupertinoIcons
                                                    .rectangle_on_rectangle_angled,
                                                size: 25.sp,
                                                color: theme.color.bigButton),
                                            SizedBox(height: 8.sp),
                                            Text(
                                              language.homeButton1,
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: theme.color.bigButton),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  GetBuilder<ProductController>(
                                      builder: (cont) {
                                    if (cont.product.length == 0) {
                                      return Center();
                                    } else {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: cont.product.length,
                                          itemBuilder: (context, index) {
                                            Product product =
                                                cont.product.getAt(index);
                                            if (product.isFavorite) {
                                              return FadeInRight(
                                                duration: Duration(
                                                    milliseconds:
                                                        (600 + (index * 100))),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.sp),
                                                  child: BigButtonWidget(
                                                    onPressed: () {
                                                      int index = cont
                                                          .product.values
                                                          .toList()
                                                          .indexOf(product);
                                                      Get.to(
                                                          CalculatingScreen(
                                                            tabIndex: index,
                                                            productController:
                                                                productController,
                                                          ),
                                                          transition: Transition
                                                              .cupertino);
                                                    },
                                                    background:
                                                        theme.color.flatButton,
                                                    isDotted: false,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.sp,
                                                          right: 10.sp,
                                                          left: 10.sp,
                                                          top: 20.sp),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SecondTextWidget(
                                                              product.name),
                                                          SizedBox(
                                                              height: 8.sp),
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Icon(
                                                              Icons
                                                                  .navigate_next,
                                                              color: theme.color
                                                                  .subArrow,
                                                              size: 20.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else
                                              return Container();
                                          });
                                    }
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      FadeInUp(
                          duration: Duration(milliseconds: 500),
                          child: LineWidget()),
                      SizedBox(height: 5.sp),
                      FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child: FadeInUp(
                            duration: Duration(milliseconds: 500),
                            child: SecondTextWidget(language.homeHeader2)),
                      ),
                      SizedBox(height: 5.sp),
                      FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child: SubTextWidget(language.homeDescription2),
                      ),
                      SizedBox(height: 5.sp),
                      FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child: LineButtonWidget(
                          background: theme.color.blue,
                          function: () {
                            Get.to(
                              () => CalculatingScreen(
                                tabIndex: 0,
                                productController: productController,
                              ),
                              transition: Transition.cupertino,
                            );
                          },
                          leading: Icon(
                            CupertinoIcons.collections,
                            color: theme.color.white,
                            size: 14.sp,
                          ),
                          title: SizedBox(
                            height: 25.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                language.homeButton2,
                                style: TextStyle(
                                  color: theme.color.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: theme.color.mainArrow,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 600),
                        child: LineButtonWidget(
                          background: theme.color.flatButton,
                          function: () {
                            Get.to(
                              () => ProductsViewScreen(
                                  controller: productController),
                              transition: Transition.cupertino,
                            );
                          },
                          leading: Icon(
                            CupertinoIcons.tray_full,
                            color: theme.color.mainText,
                            size: 14.sp,
                          ),
                          title: SizedBox(
                            height: 25.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                language.homeButton3,
                                style: TextStyle(
                                  color: theme.color.mainText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: theme.color.subArrow,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 700),
                        child: LineButtonWidget(
                          background: theme.color.flatButton,
                          function: () {
                            Get.to(
                              () => DataViewScreen(
                                controller: productController,
                              ),
                              transition: Transition.cupertino,
                            );
                          },
                          leading: Icon(
                            CupertinoIcons.chart_pie,
                            color: theme.color.mainText,
                            size: 14.sp,
                          ),
                          title: SizedBox(
                            height: 25.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                language.homeButton4,
                                style: TextStyle(
                                  color: theme.color.mainText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: theme.color.subArrow,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 800),
                        child: LineButtonWidget(
                          background: theme.color.flatButton,
                          function: () {
                            Get.to(
                              () => LanguageScreen(),
                              transition: Transition.cupertino,
                            );
                          },
                          leading: Icon(
                            CupertinoIcons.globe,
                            color: theme.color.mainText,
                            size: 14.sp,
                          ),
                          title: SizedBox(
                            height: 25.sp,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                language.homeButton5,
                                style: TextStyle(
                                  color: theme.color.mainText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: theme.color.subArrow,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

//todo: duration: Duration(milliseconds: (index * 100) + 500),

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edf/Pages/productList.dart';

import '../Pages/sdnav.dart';
import '/models/product_model.dart';
import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../utils/size_utils.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/custom_app_bar.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          drawer: Dra(),
          backgroundColor: theme.colorScheme.onPrimary,
          appBar: AppBar(
            title: Text("Order placed"),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromRGBO(4, 99, 4, 1),
                      Color.fromRGBO(76, 161, 70, 1)
                    ]),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(15),
                ),
                Container(
                  height:250,
                  width: 250,
                  child: Image.asset("assets/images/order placed image.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(top: 30),
                      child: Text(
                        "Order Placed Successfully!",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 11, bottom: 11),
                      child: SizedBox(
                        width: getHorizontalSize(260),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Congratulations! Your order has been placed. You can track your order number #12345678",
                                textAlign: TextAlign.left,
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                 Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: (){

                  Get.to(ProductList());
                }, 
                style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Color.fromRGBO(4, 99, 4, 100),
                      foregroundColor: Colors.white,
                      minimumSize: Size(350, 51),
                    ),
                child: Text("Continue",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),)),
            ),
                Padding(
                  padding: getPadding(
                    left: 50,
                    top: 42,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Product you may also like",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Divider(
                          height: getVerticalSize(
                            5,
                          ),
                          thickness: getVerticalSize(
                            5,
                          ),
                          color: theme.colorScheme.primary,
                          indent: getHorizontalSize(
                            22,
                          ),
                          endIndent: getHorizontalSize(
                            22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(
                        145,
                      ),
                      child: Padding(
                        padding: getPadding(
                          top: 29,
                        ),
                        child: RawScrollbar(
                          thumbVisibility: true,
                          thumbColor: theme.colorScheme.onPrimaryContainer,
                          thickness: getVerticalSize(
                            3,
                          ),
                          padding: EdgeInsets.only(
                              left: getHorizontalSize(22),
                              right: getHorizontalSize(22),
                              bottom: getVerticalSize(1)),
                          child: ListView.separated(
                            padding:
                                getPadding(left: 22, right: 22, bottom: 18),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                width: getHorizontalSize(
                                  22,
                                ),
                              );
                            },
                            itemCount: productList.length,
                            itemBuilder: (context, index) {
                              ProductModel productModel = productList[index];
                              return Container(
                                height: getVerticalSize(
                                  100,
                                ),
                                width: getHorizontalSize(
                                  97,
                                ),
                                margin: getMargin(
                                  bottom: 1,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    productModel.productUrl != null
                                        ? Container(
                                            height: getVerticalSize(
                                              100,
                                            ),
                                            width: getHorizontalSize(
                                              97,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white70,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    5,
                                                  ),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      productModel.productUrl ??
                                                          ""),
                                                  fit: BoxFit.cover,
                                                )),
                                          )
                                        : SizedBox(
                                            height: getVerticalSize(
                                              100,
                                            ),
                                            width: getHorizontalSize(
                                              97,
                                            ),
                                          ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: getPadding(
                                          left: 17,
                                          right: 14,
                                          bottom: 1,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${productModel.productName}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 20,
                                              ),
                                              child: Text(
                                                "\$${productModel.price}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/store_app_bar.dart';
import 'package:store_app/features/common/store_text_button.dart';

import '../../../core/routing/routes.dart';
import '../../../core/sizes.dart';
import '../../common/store_text_item.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Checkout"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25, vertical: 15),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.secondary.withValues(alpha: 0.5)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Address", style: TextStyle(fontFamily: "General Sans", fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        context.push(Routes.addressPage);
                      },
                      child: const Text(
                        "Change",
                        style: TextStyle(decoration: TextDecoration.underline, fontSize: 14, fontFamily: "General Sans"),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/map_pin.svg",
                        width: 17.w,
                        height: 22.h,
                      ),
                      const SizedBox(width: 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Home", style: TextStyle(fontFamily: "General Sans", fontSize: 14, fontWeight: FontWeight.bold)),
                          Text("925 S Chugach St #APT 10, Alaska 99645",
                              style: TextStyle(fontFamily: "General Sans", fontSize: 14, fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Divider(color: AppColors.secondary.withValues(alpha: 0.5)),
              const SizedBox(height: 20),
              const Text("Payment Method", style: TextStyle(fontFamily: "General Sans", fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 13),
              Row(
                children: [
                  PaymentMethodButton(selected: true, icon: "assets/icons/card_white.svg", label: "Card"),
                  PaymentMethodButton(selected: false, icon: "assets/icons/cash.svg", label: "Cash"),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Text("VISA", style: TextStyle(fontFamily: "General Sans", fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    const Expanded(
                        child: Text(
                          " **** **** **** 2512",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                    SvgPicture.asset("assets/icons/edit.svg", width: 19, height: 20),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(color: AppColors.secondary.withValues(alpha: 0.5)),
              const SizedBox(height: 20),
              const Text("Order Summary", style: TextStyle(fontFamily: "General Sans", fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreTextItem(
                        text: "Sub-total",
                        color: Colors.black.withValues(alpha: 0.45),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      StoreTextItem(
                        text: "\$ 5,870",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreTextItem(
                        text: "Vat(%)",
                        color: Colors.black.withValues(alpha: 0.45),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      StoreTextItem(
                        text: "\$ 0.00",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreTextItem(
                        text: "Shipping fee",
                        color: Colors.black.withValues(alpha: 0.45),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      StoreTextItem(
                        text: "\$ 80",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey.withValues(alpha: 0.45)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreTextItem(
                        text: "Total",
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      StoreTextItem(
                        text: "\$ 5,950",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter promo code",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            "assets/icons/discount_1.svg",
                            width: 21,
                            height: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  StoreTextButton(
                    text: "Add",
                    width: 84.w,
                    height: 52.h,
                    callback: () {},
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Align(
                alignment: Alignment.bottomCenter,
                child: StoreTextButton(
                  text: "Place Order",
                  width: 341.w,
                  height: 54.h,
                  callback: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final bool selected;
  final String icon;
  final String label;

  const PaymentMethodButton({
    super.key,
    required this.selected,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 109.w,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(color: selected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }
}
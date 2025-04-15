import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/store_text_button.dart';
import '../../../core/routing/routes.dart';
import '../../common/store_text_item.dart';
import 'my_cart_item_container.dart';


class MyCartItems extends StatelessWidget {
  const MyCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 10,
      ),
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            width: double.infinity,
            height: 355.h,
            child: ListView.separated(
              itemBuilder: (context, index) => MyCartContainerItem(),
              separatorBuilder: (context, index) => SizedBox(
                height: 15.h,
              ),
              itemCount: 5,
            ),
          ),
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
              StoreTextButton(
                showArrow: false,
                text: "Go To CheckOut",
                callback: () {
                  context.push(Routes.checkout);
                },
                width: 341.w,
                height: 54.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

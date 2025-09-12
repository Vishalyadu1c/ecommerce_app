import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/modules/home/notification/controllers/notification_controller.dart';
// import 'package:ecommerce_app/app/modules/notification/controllers/notification_controller.dart';
// import 'package:ecommerce_app/app/modules/notification/models/notification_model.dart';
import 'package:ecommerce_app/app/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12).w,
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
          return NotificationCard(notification: notificationList[index],);
        },)
        // EmptyScreen(
        //     image: AppAssets.notification, message: "No Notification yet"),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20).w,
      margin: EdgeInsets.only(top: 12).w,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0).w
      ),
      child: Row(
        spacing: 20,
        children: [
          Stack(
            children: [
              Image.asset(Theme.of(context).brightness == Brightness.dark ? AppAssets.notificationWhite : AppAssets.notificationBlack),
              Visibility(
                visible: notification.now,
                child: Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 8.h,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade800,
                      shape: BoxShape.circle
                  
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(notification.message,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13.sp),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

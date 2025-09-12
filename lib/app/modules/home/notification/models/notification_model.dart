class NotificationModel {
  bool now;
  DateTime?dateTime;
  String message;

  NotificationModel({
    required this.now,
    required this.message,
     this.dateTime
  });
}


List<NotificationModel> notificationList =  <NotificationModel>[
  NotificationModel(now: true, message: 'Glibert,your placed and order check your\norder history for full details'),
  NotificationModel(now: false, message: 'Glibert,thank you for shopping with us we\nhave canceled order #24568'),
  NotificationModel(now: false, message: 'Glibert,your Order #24568 has been\nconfirmed check your order history f..'),

];
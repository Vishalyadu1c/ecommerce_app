import 'package:ecommerce_app/app/data/models/user_model.dart';
import 'package:ecommerce_app/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce_app/app/modules/home/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List  '),
        ),
        body: Column(
          children: [
            Expanded(child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.hasError.value) {
                return Center(
                  child: Text('Error loading users'),
                );
              }

              if (controller.users.isEmpty) {
                return const Center(child: Text('No users found'));
              }

              // Display the list of users
              return ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return UserCard(
                      user: user,
                      onTap:()=> _showUserDetails(context, user),
                      onDelete: ()=>_showDeleteDialog(context, user));
                },
              );
            }))
          ],
        ));
  }

  _showUserDetails(BuildContext context, UserModel user) {
    showBottomSheet(
        context: context, builder: (context) => UserDetailsSheet(user: user));
  }

  void  _showDeleteDialog(BuildContext context, UserModel user) {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: const Text("Delete User"),
          content: Text('Are you sure want to delete ${user.name}'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(onPressed: () {
              Navigator.pop(context);
              controller.deleteUser(user.id!);

            },
                child: const Text(
                  'Delete', style: TextStyle(color: Colors.red),)),

          ],
        ));
  }
}

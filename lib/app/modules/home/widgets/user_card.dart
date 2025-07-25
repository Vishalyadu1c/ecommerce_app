import 'package:ecommerce_app/app/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;
  final VoidCallback onDelete;


  const UserCard({super.key,
  required this.user,
  required this.onTap,
  required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal[200],
          child: Text(user.name!.isNotEmpty ? user.name![0].toUpperCase():"?",
          style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
        title: Text(user.name.toString(),style:  const TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Text(user.email.toString()),
        onTap: onTap,
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
          color: Colors.red,
        ),
      ),
    );
  }
}


class UserDetailsSheet extends StatelessWidget {
  final UserModel user;
  const UserDetailsSheet({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // now create User Avatar
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.brown[100],
            child: Text(
              user.name!.isNotEmpty ? user.name![0].toUpperCase() : "?",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16,),

          // close button

          ElevatedButton(onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text('Close',style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
  }
}
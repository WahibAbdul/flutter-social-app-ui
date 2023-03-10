import 'package:flutter/material.dart';
import 'package:social_media_ui/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  final List<User> users;

  const FollowingUsers({super.key, required this.users});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            'Following',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(
          height: 80.0,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: ((context, index) {
                final user = users[index];
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Theme.of(context).primaryColor),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(user.profileImageUrl!),
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              })),
        )
      ],
    );
  }
}

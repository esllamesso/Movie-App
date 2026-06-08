import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),

            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                "assets/images/me.jpeg",
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Eslam Mohamed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "Premium Member",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            _menuItem(
              icon: Icons.person_outline,
              title: "Account",
            ),

            _menuItem(
              icon: Icons.notifications_none,
              title: "Notifications",
            ),

            _menuItem(
              icon: Icons.download_outlined,
              title: "Downloads",
            ),

            _menuItem(
              icon: Icons.language,
              title: "App Language",
            ),

            _menuItem(
              icon: Icons.help_outline,
              title: "Help Center",
            ),

            _menuItem(
              icon: Icons.info_outline,
              title: "About",
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.logout,color: Colors.white,),
                  label: const Text("Sign Out",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  static Widget _menuItem({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
    );
  }
}
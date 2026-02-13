import 'package:flutter/material.dart';
import 'package:fixem/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue, // Soft blue background        
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          children: [
            const Text(
              'FIXEM',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Moulpali',
              ),
            ),
            const SizedBox(height: 40),

            // HOME
            _buildDrawerItem(
              context,
              icon: Icons.home,
              label: 'HOME',
              onTap: () => Navigator.pushReplacementNamed(context, RouteManger.dashboard),
            ),

            // JOBS
            _buildDrawerItem(
              context,
              icon: Icons.work_outline,
              label: 'JOBS',
              onTap: () {
                // Add your jobs page route
              },
            ),

            // LEARN
            _buildDrawerItem(
              context,
              icon: Icons.school_outlined,
              label: 'LEARN',
              onTap: () {
                // Add your learning page route
              },
            ),

            // PROFILE
            _buildDrawerItem(
              context,
              icon: Icons.person_outline,
              label: 'PROFILE',
              onTap: () => Navigator.pushReplacementNamed(context, RouteManger.createProfile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

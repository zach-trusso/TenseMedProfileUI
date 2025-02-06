import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Store profile data in a map for easy updating
  Map<String, String> profileData = {
    'name': 'Dog Name',
    'email': 'john.doe@example.com',
    'phone': '+1 234 567 890',
    'age': '5 years',
    'breed': 'Golden Retriever',
    'sex': 'Male',
    'weight': '65 lbs',
    // DOB
    // Vet Name
    // User ID
  };

  // Show edit dialog
  Future<void> _showEditDialog(String field, String currentValue) async {
    String newValue = currentValue;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Edit ${field.substring(0, 1).toUpperCase() + field.substring(1)}'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter new ${field.toLowerCase()}',
            ),
            onChanged: (value) {
              newValue = value;
            },
            controller: TextEditingController(text: currentValue),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  profileData[field] = newValue;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _showEditDialog('name', profileData['name']!),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _showEditDialog('name', profileData['name']!),
                    child: Text(
                      profileData['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: profileData['email']!,
                    onTap: () =>
                        _showEditDialog('email', profileData['email']!),
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    icon: Icons.phone,
                    title: 'Phone',
                    subtitle: profileData['phone']!,
                    onTap: () =>
                        _showEditDialog('phone', profileData['phone']!),
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    icon: Icons.calendar_today,
                    title: 'Age',
                    subtitle: profileData['age']!,
                    onTap: () => _showEditDialog('age', profileData['age']!),
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    icon: Icons.pets,
                    title: 'Breed',
                    subtitle: profileData['breed']!,
                    onTap: () =>
                        _showEditDialog('breed', profileData['breed']!),
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    icon: Icons.person,
                    title: 'Sex',
                    subtitle: profileData['sex']!,
                    onTap: () => _showEditDialog('sex', profileData['sex']!),
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    icon: Icons.monitor_weight,
                    title: 'Weight',
                    subtitle: profileData['weight']!,
                    onTap: () =>
                        _showEditDialog('weight', profileData['weight']!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.blue,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: UserProfile(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

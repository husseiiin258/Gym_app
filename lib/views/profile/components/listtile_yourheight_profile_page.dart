import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListtileYourheightProfilePage extends StatefulWidget {
  const ListtileYourheightProfilePage({super.key});

  @override
  State<ListtileYourheightProfilePage> createState() => _ListtileYourheightProfilePageState();
}

class _ListtileYourheightProfilePageState extends State<ListtileYourheightProfilePage> {
  String? height;

  @override
  void initState() {
    super.initState();
    fetchUserHeight();
  }

  Future<void> fetchUserHeight() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          height = userDoc['height']?.toString(); // Ensure height is a string
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
      // Consider adding user feedback here
    }
  }

  Future<void> updateHeight(String newHeight) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'height': newHeight});
        setState(() {
          height = newHeight;
        });
      }
    } catch (e) {
      print('Error updating user data: $e');
      // Consider adding user feedback here
    }
  }

  void _showEditDialog() {
    final TextEditingController heightController = TextEditingController(text: height);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Height'),
        content: TextField(
          controller: heightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter new height (cm)',
          ),
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
              final newHeight = heightController.text;
              if (newHeight.isNotEmpty) {
                updateHeight(newHeight);
              }
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      title: Text(
        height != null ? "$height cm" : 'Your Height',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      leading: const Icon(
        Icons.height_outlined,
        color: Color(0xff92A3FD),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit, color: Color(0xff92A3FD)),
        onPressed: _showEditDialog,
      ),
    );
  }
}

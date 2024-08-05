
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListtileYourweightProfilePage extends StatefulWidget {
  const ListtileYourweightProfilePage({super.key});

  @override
  State<ListtileYourweightProfilePage> createState() => _ListtileYourweightProfilePageState();
}

class _ListtileYourweightProfilePageState extends State<ListtileYourweightProfilePage> {
  String? weight;

  @override
  void initState() {
    super.initState();
    fetchUserWeight();
  }

  Future<void> fetchUserWeight() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          weight = userDoc['weight']?.toString();
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    
    }
  }

  Future<void> updateWeight(String newWeight) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'weight': newWeight});
        setState(() {
          weight = newWeight;
        });
      }
    } catch (e) {
      print('Error updating user data: $e');
      
    }
  }

  void _showEditDialog() {
    final TextEditingController weightController = TextEditingController(text: weight);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Weight'),
        content: TextField(
          controller: weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter new weight',
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
              final newWeight = weightController.text;
              if (newWeight.isNotEmpty) {
                updateWeight(newWeight);
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
        weight != null ? "$weight kg" : 'Your Weight',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      leading: const Icon(
        Icons.monitor_weight_outlined,
        color: Color(0xff92A3FD),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit, color: Color(0xff92A3FD)),
        onPressed: _showEditDialog,
      ),
    );
  }
}

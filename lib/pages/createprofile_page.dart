import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixem/routes/routes.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _provinceController = TextEditingController();
  final _phoneController = TextEditingController();

  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Save data to Firestore
  Future<void> _createProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        await users.add({
          'email': _emailController.text.trim(),
          'name': _nameController.text.trim(),
          'surname': _surnameController.text.trim(),
          'age': _ageController.text.trim(),
          'gender': _genderController.text.trim(),
          'province': _provinceController.text.trim(),
          'phone': _phoneController.text.trim(),
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile created successfully')),
        );

        _formKey.currentState!.reset();
        _emailController.clear();
        _nameController.clear();
        _surnameController.clear();
        _ageController.clear();
        _genderController.clear();
        _provinceController.clear();
        _phoneController.clear();

        Navigator.of(context).pushReplacementNamed(RouteManger.login);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create profile: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _provinceController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const Text(
                'CREATE PROFILE',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Moulpali',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration('Enter your email'),
                validator: (value) => value!.isEmpty ? 'Email is required' : null,
              ),
              const SizedBox(height: 20),

              // Name
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration('Enter Name'),
                validator: (value) => value!.isEmpty ? 'Name is required' : null,
              ),
              const SizedBox(height: 20),

              // Surname
              TextFormField(
                controller: _surnameController,
                decoration: _inputDecoration('Enter Surname'),
                validator: (value) => value!.isEmpty ? 'Surname is required' : null,
              ),
              const SizedBox(height: 20),

              // Age
              TextFormField(
                controller: _ageController,
                decoration: _inputDecoration('Age'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Age is required' : null,
              ),
              const SizedBox(height: 20),

              // Gender
              TextFormField(
                controller: _genderController,
                decoration: _inputDecoration('Gender'),
                validator: (value) => value!.isEmpty ? 'Gender is required' : null,
              ),
              const SizedBox(height: 20),

              // Province
              TextFormField(
                controller: _provinceController,
                decoration: _inputDecoration('Select Province'),
                validator: (value) => value!.isEmpty ? 'Province is required' : null,
              ),
              const SizedBox(height: 20),

              // Phone Number
              TextFormField(
                controller: _phoneController,
                decoration: _inputDecoration('Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Phone number is required' : null,
              ),
              const SizedBox(height: 40),

              // Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _createProfile,
                child: const Text('CREATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: label,
    );
  }
}

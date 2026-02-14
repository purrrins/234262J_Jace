import 'package:flutter/material.dart';
import 'regUsers.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String email;

  ProfilePage({required this.username, required this.email});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // load the reg user data
    var user = _getCurrentUser();
    _phoneController = TextEditingController(text: user?['phone'] ?? '');
    _addressController = TextEditingController(text: user?['address'] ?? '');
  }

  Map<String, String>? _getCurrentUser() {
    for (var user in registeredUsers) {
      if (user['username'] == widget.username) {
        return user;
      }
    }
    return null;
  }

  void _saveProfile() {
    var user = _getCurrentUser();
    if (user != null) {
      user['phone'] = _phoneController.text;
      user['address'] = _addressController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile saved successfully!')),
      );

      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Profile', style: TextStyle(color: Colors.blueAccent)),
        actions: [
          if (!_isEditing)
            IconButton(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
              icon: Icon(Icons.edit),
            )
          else
            IconButton(
              onPressed: _saveProfile,
              icon: Icon(Icons.save),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Username: ${widget.username}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Email: ${widget.email}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Contact No: ',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: _isEditing
                      ? TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: 'Enter phone number',
                          ),
                        )
                      : Text(
                          _phoneController.text.isEmpty
                              ? 'Not set'
                              : _phoneController.text,
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home Address:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                _isEditing
                    ? TextField(
                        controller: _addressController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Enter your address',
                          border: OutlineInputBorder(),
                        ),
                      )
                    : Text(
                        _addressController.text.isEmpty
                            ? 'Not set'
                            : _addressController.text,
                        style: TextStyle(fontSize: 18),
                      ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChangePasswordPage(username: widget.username),
                  ),
                );
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 16),
            if (_isEditing)
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save Profile'),
              ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  final String username;

  ChangePasswordPage({required this.username});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _changePassword() {
    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // find the user from the regUsers
    for (int i = 0; i < registeredUsers.length; i++) {
      if (registeredUsers[i]['username'] == widget.username) {
        // check the current pw is correct
        if (registeredUsers[i]['password'] != currentPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Current password is incorrect')),
          );
          return;
        }

        if (newPassword.length < 6) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('New password must be at least 6 characters')),
          );
          return;
        }

        // check new pw is match
        if (newPassword != confirmPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('New passwords do not match')),
          );
          return;
        }

        // update the password
        registeredUsers[i]['password'] = newPassword;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully!')),
        );

        Navigator.pop(context);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}

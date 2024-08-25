import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  List<_AdditionalField> _additionalFields = [];

  void _addAdditionalField() {
    setState(() {
      _additionalFields.add(_AdditionalField(
        title: 'Additional Info Title',
        titleController: TextEditingController(text: 'Additional Info Title'),
        infoController: TextEditingController(),
        isEditing: false,
      ));
    });
  }

  void _savePersonalInfo() {
    // Implement save functionality here
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Phone: ${_phoneController.text}');
    print('Address: ${_addressController.text}');
    _additionalFields.forEach((field) {
      print('Additional Info Title: ${field.titleController.text}');
      print('Additional Info: ${field.infoController.text}');
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _additionalFields.forEach((field) {
      field.titleController.dispose();
      field.infoController.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            ..._additionalFields.map((field) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: !field.isEditing,
                            child: Text(
                              field.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, size: 16),
                          onPressed: () {
                            setState(() {
                              field.isEditing = !field.isEditing;
                            });
                          },
                        ),
                      ],
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: field.isEditing
                          ? TextField(
                              key: ValueKey('titleField_${field.title}'),
                              controller: field.titleController,
                              decoration: InputDecoration(labelText: 'Title'),
                              onSubmitted: (_) {
                                setState(() {
                                  field.isEditing = false;
                                  field.title = field.titleController.text;
                                });
                              },
                            )
                          : Container(),
                    ),
                    TextField(
                      controller: field.infoController,
                      decoration: InputDecoration(labelText: 'Additional Info'),
                    ),
                    SizedBox(height: 10),
                  ],
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePersonalInfo,
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _addAdditionalField,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdditionalField {
  String title;
  final TextEditingController titleController;
  final TextEditingController infoController;
  bool isEditing;

  _AdditionalField({
    required this.title,
    required this.titleController,
    required this.infoController,
    required this.isEditing,
  });
}

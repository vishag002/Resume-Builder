import 'package:flutter/material.dart';
import 'package:resume_builder/view/common_widgets/education_details_card.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final List<EducationDetailCardData> _educationDetailData = [];

//
  void _saveWorkExperience() {
    for (var data in _educationDetailData) {
      print('Company: ${data.institutionController.text}');
      print('Job Title: ${data.degreeController.text}');
      print('Start Date: ${data.startDateController.text}');
      print('End Date: ${data.endDateController.text}');
      for (var controller in data.additionalFields) {
        print('Additional Info: ${controller.text}');
      }
    }
  }

  void _addEducationDetailCard() {
    setState(() {
      _educationDetailData.add(EducationDetailCardData());
    });
  }

  void _deleteEducationCard(int index) {
    setState(() {
      _educationDetailData[index].dispose(); // Dispose of the controllers
      _educationDetailData.removeAt(index); // Remove the card
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Details'),
        actions: [
          IconButton(
            onPressed: _addEducationDetailCard,
            icon: Icon(Icons.control_point_duplicate),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _educationDetailData.length,
        itemBuilder: (context, index) {
          return EducationDetailCard(
            data: _educationDetailData[index],
            onDelete: () => _deleteEducationCard(index),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _saveWorkExperience,
        child: Text('Save'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resume_builder/view/common_widgets/work_experience_widget.dart';

class WorkExperienceScreen extends StatefulWidget {
  @override
  _WorkExperienceScreenState createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  final List<WorkExperienceCardData> _workExperienceData = [];

  void _addWorkExperienceCard() {
    setState(() {
      _workExperienceData.add(WorkExperienceCardData());
    });
  }

  void _deleteWorkExperienceCard(int index) {
    setState(() {
      _workExperienceData[index].dispose(); // Dispose of the controllers
      _workExperienceData.removeAt(index); // Remove the card
    });
  }

  void _saveWorkExperience() {
    for (var data in _workExperienceData) {
      print('Company: ${data.companyController.text}');
      print('Job Title: ${data.jobTitleController.text}');
      print('Start Date: ${data.startDateController.text}');
      print('End Date: ${data.endDateController.text}');
      print('Description: ${data.descriptionController.text}');
      for (var controller in data.additionalFields) {
        print('Additional Info: ${controller.text}');
      }
    }
  }

  @override
  void dispose() {
    for (var data in _workExperienceData) {
      data.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Experience'),
        actions: [
          IconButton(
            onPressed: _addWorkExperienceCard,
            icon: Icon(Icons.control_point_duplicate),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _workExperienceData.length,
        itemBuilder: (context, index) {
          return WorkExperienceCard(
            data: _workExperienceData[index],
            onDelete: () => _deleteWorkExperienceCard(index),
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

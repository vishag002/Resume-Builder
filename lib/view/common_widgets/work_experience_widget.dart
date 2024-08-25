import 'package:flutter/material.dart';

class WorkExperienceCardData {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<TextEditingController> additionalFields = [];

  void addAdditionalField() {
    additionalFields.add(TextEditingController());
  }

  void dispose() {
    companyController.dispose();
    jobTitleController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
    for (var controller in additionalFields) {
      controller.dispose();
    }
  }
}

class WorkExperienceCard extends StatelessWidget {
  final WorkExperienceCardData data;
  final VoidCallback onDelete;

  const WorkExperienceCard({
    required this.data,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: data.companyController,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            TextField(
              controller: data.jobTitleController,
              decoration: InputDecoration(labelText: 'Job Title'),
            ),
            TextField(
              controller: data.startDateController,
              decoration: InputDecoration(labelText: 'Start Date'),
            ),
            TextField(
              controller: data.endDateController,
              decoration: InputDecoration(labelText: 'End Date'),
            ),
            TextField(
              controller: data.descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ...data.additionalFields.map((controller) => TextField(
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Additional Info'),
                )),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    data.addAdditionalField();
                    (context as Element).markNeedsBuild(); // Trigger rebuild
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Field'),
                ),
                ElevatedButton.icon(
                  onPressed: onDelete, // Call the onDelete callback
                  icon: Icon(Icons.delete),
                  label: Text('Delete Card'),
                  style: ElevatedButton.styleFrom(
                      //  primary: Colors.red, // Set the delete button color to red
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

import 'package:flutter/material.dart';

class EducationDetailCard extends StatelessWidget {
  final EducationDetailCardData data;
  final VoidCallback onDelete;

  const EducationDetailCard({
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
              controller: data.institutionController,
              decoration: InputDecoration(labelText: 'Institution'),
            ),
            TextField(
              controller: data.degreeController,
              decoration: InputDecoration(labelText: 'Degree'),
            ),
            TextField(
              controller: data.startDateController,
              decoration: InputDecoration(labelText: 'Start Date'),
            ),
            TextField(
              controller: data.endDateController,
              decoration: InputDecoration(labelText: 'End Date'),
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

//
class EducationDetailCardData {
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final List<TextEditingController> additionalFields = [];

  void addAdditionalField() {
    additionalFields.add(TextEditingController());
  }

  void dispose() {
    institutionController.dispose();
    degreeController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    for (var controller in additionalFields) {
      controller.dispose();
    }
  }
}

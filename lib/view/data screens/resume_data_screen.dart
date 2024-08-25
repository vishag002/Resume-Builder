import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/resume_data_model.dart';
import 'package:resume_builder/utilis/text%20constant/text_constant.dart';
import 'package:resume_builder/view/data%20screens/education_screens.dart';
import 'package:resume_builder/view/data%20screens/personal_info_screen.dart';
import 'package:resume_builder/view/data%20screens/work_experience_screen.dart';
import 'package:resume_builder/view/priview%20screens/preview_screen.dart';

class ResumeDataScreen extends StatefulWidget {
  @override
  _ResumeDataScreenState createState() => _ResumeDataScreenState();
}

class _ResumeDataScreenState extends State<ResumeDataScreen> {
  List<String> _skills = [];
  List<Project> _projects = [];
  List<Certificate> _certificates = [];

  void _addSkill() {
    setState(() {
      _skills.add('New Skill');
    });
  }

  void _addProject() {
    setState(() {
      _projects.add(Project(
        projectName: 'New Project',
        description: 'Description',
        technologies: 'Technologies',
      ));
    });
  }

  void _addCertificate() {
    setState(() {
      _certificates.add(Certificate(
        certificateName: 'New Certificate',
        organization: 'Organization',
        issueDate: 'Date',
      ));
    });
  }

  void _deleteSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Data', style: TextConstants.sectionHeading),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Personal Information
          ListTile(
            title: Text('Personal Information',
                style: TextConstants.sectionHeading),
            subtitle: Text('Name, Email, Phone, Address',
                style: TextConstants.bodyText),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Get.to(PersonalInfoScreen());
              },
            ),
          ),
          Divider(),

          // Work Experiences
          ListTile(
            title:
                Text('Work Experiences', style: TextConstants.sectionHeading),
            subtitle: Text('Company Name, Job Title, Dates, Description',
                style: TextConstants.bodyText),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Get.to(WorkExperienceScreen());
              },
            ),
          ),
          Divider(),

          // Education Details
          ListTile(
            title:
                Text('Education Details', style: TextConstants.sectionHeading),
            subtitle: Text('Institution, Degree, Dates',
                style: TextConstants.bodyText),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Get.to(EducationScreen());
              },
            ),
          ),
          Divider(),

          // Skills
          Text('Skills', style: TextConstants.sectionHeading),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _skills.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('•', style: TextConstants.skillsText),
                title: Text(_skills[index], style: TextConstants.skillsText),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditSkillDialog(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteSkill(index);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          ElevatedButton(
            onPressed: _addSkill,
            child: Text('Add Skill', style: TextConstants.bodyText),
          ),
          Divider(),

          // Projects
          Text('Projects', style: TextConstants.sectionHeading),
          Column(
            children: _projects
                .map(
                  (project) => ListTile(
                    title: Text(project.projectName,
                        style: TextConstants.subHeading),
                    subtitle: Text(
                        '${project.description} - ${project.technologies}',
                        style: TextConstants.bodyText),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Edit project
                      },
                    ),
                  ),
                )
                .toList(),
          ),
          Divider(),
          ElevatedButton(
            onPressed: _addProject,
            child: Text('Add Project', style: TextConstants.bodyText),
          ),
          Divider(),

          // Certificates
          Text('Certificates', style: TextConstants.sectionHeading),
          Column(
            children: _certificates
                .map((certificate) => ListTile(
                      title: Text(certificate.certificateName,
                          style: TextConstants.subHeading),
                      subtitle: Text(
                          '${certificate.organization} - ${certificate.issueDate}',
                          style: TextConstants.bodyText),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Edit certificate
                        },
                      ),
                    ))
                .toList(),
          ),
          Divider(),
          ElevatedButton(
            onPressed: _addCertificate,
            child: Text('Add Certificate', style: TextConstants.bodyText),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add additional fields if needed
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        child: InkWell(
          onTap: () {
            Get.to(PreviewScreen());
          },
          child: Container(
            child: Center(child: Text("Submit", style: TextConstants.bodyText)),
          ),
        ),
      ),
    );
  }

  void _showEditSkillDialog(int index) {
    final TextEditingController controller =
        TextEditingController(text: _skills[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Skill', style: TextConstants.subHeading),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter skill'),
            style: TextConstants.bodyText,
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _skills[index] = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save', style: TextConstants.bodyText),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextConstants.bodyText),
            ),
          ],
        );
      },
    );
  }
}

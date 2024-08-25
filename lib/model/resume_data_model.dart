class Resume {
  // Personal Information
  final PersonalInfo personalInfo;

  // Work Experiences
  final List<WorkExperience> workExperiences;

  // Education Details
  final List<Education> educations;

  // Skills
  final List<String> skills;

  // Projects
  final List<Project> projects;

  // Certificates
  final List<Certificate> certificates;

  Resume({
    required this.personalInfo,
    required this.workExperiences,
    required this.educations,
    required this.skills,
    required this.projects,
    required this.certificates,
  });
}

class PersonalInfo {
  final String name;
  final String email;
  final String phone;
  final String address;

  PersonalInfo({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}

class WorkExperience {
  final String companyName;
  final String jobTitle;
  final String startDate;
  final String endDate;
  final String description;

  WorkExperience({
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class Education {
  final String institution;
  final String degree;
  final String startDate;
  final String endDate;

  Education({
    required this.institution,
    required this.degree,
    required this.startDate,
    required this.endDate,
  });
}

class Project {
  final String projectName;
  final String description;
  final String technologies;

  Project({
    required this.projectName,
    required this.description,
    required this.technologies,
  });
}

class Certificate {
  final String certificateName;
  final String organization;
  final String issueDate;

  Certificate({
    required this.certificateName,
    required this.organization,
    required this.issueDate,
  });
}

class UserDataModel {
  final Data? data;

  UserDataModel({
    this.data,
  });

  UserDataModel copyWith({
    Data? data,
  }) =>
      UserDataModel(
        data: data ?? this.data,
      );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final List<Skill> skills;
  final AboutMe? aboutMe;
  final List<Project> project;
  final String? email;
  final String? cv;
  final PersonalData? personalData;
  final List<Experince> experience;

  Data({
    this.skills = const [],
    this.aboutMe,
    this.project = const [],
    this.email,
    this.cv,
    this.personalData,
    this.experience=const [],
  });

  Data copyWith({
    List<Skill>? skills,
    AboutMe? aboutMe,
     List<Project>? project,
    String? email,
    String? cv,
    PersonalData? personalData,
    List<Experince> ? experience,
  }) =>
      Data(
        skills: skills ?? this.skills,
        aboutMe: aboutMe ?? this.aboutMe,
        project: project ?? this.project,
        email: email ?? this.email,
        cv: cv ?? this.cv,
        personalData: personalData ?? this.personalData,
        experience: experience ?? this.experience,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        aboutMe:
            json["aboutMe"] == null ? null : AboutMe.fromJson(json["aboutMe"]),
        project: json["projects"] == null
            ? []
            : List<Project>.from(json["projects"]!.map((x) => Project.fromJson(x))),
        email: json["email"],
        cv: json["cv"],
        personalData: json["personalData"] == null
            ? null
            : PersonalData.fromJson(json["personalData"]),
        experience: json["experince"] == null
            ? []
            : List<Experince>.from(json["experince"]!.map((x) => Experince.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "experince": List<dynamic>.from(experience.map((x) => x.toJson())),
        "aboutMe": aboutMe?.toJson(),
        "projects": List<dynamic>.from(project.map((x) => x.toJson())),
        "email": email,
        "cv": cv,
        "personalData": personalData?.toJson(),
      };
}

class AboutMe {
  AboutMe();

  AboutMe copyWith() => AboutMe();

  factory AboutMe.fromJson(Map<String, dynamic> json) => AboutMe();

  Map<String, dynamic> toJson() => {};
}

class PersonalData {
  final Links? links;
  final String? name;
  final String? role;
  final String? shortDesc;
  final String? location;

  PersonalData({
    this.links,
    this.name,
    this.role,
    this.shortDesc,
    this.location
  });

  PersonalData copyWith({
    Links? links,
    String? name,
    String? role,
    String? shortDesc,
    String? location
  }) =>
      PersonalData(
        links: links ?? this.links,
        name: name ?? this.name,
        role: role ?? this.role,
        shortDesc: shortDesc ?? this.shortDesc,
        location: location ?? this.location
      );

  factory PersonalData.fromJson(Map<String, dynamic> json) => PersonalData(
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        name: json["name"],
        role: json["role"],
        shortDesc: json["shortDesc"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "links": links?.toJson(),
        "name": name,
        "role": role,
        "shortDesc": shortDesc,
        "location": location
      };
}

class Links {
  final String? linkedIn;
  final String? email;
  final String? cv;
  final String? github;

  Links({
    this.linkedIn,
    this.email,
    this.cv,
    this.github,
  });

  Links copyWith({
    String? linkedIn,
    String? email,
    String? cv,
    String? github,
  }) =>
      Links(
        linkedIn: linkedIn ?? this.linkedIn,
        email: email ?? this.email,
        cv: cv ?? this.cv,
        github: github ?? this.github,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        linkedIn: json["linkedIn"],
        email: json["email"],
        cv: json["cv"],
        github: json["github"],
      );

  Map<String, dynamic> toJson() => {
        "linkedIn": linkedIn,
        "email": email,
        "cv": cv,
        "github": github,
      };
}

class Skill {
  final String? name;
  final String? icon;

  Skill({
    this.name,
    this.icon,
  });

  Skill copyWith({
    String? name,
    String? icon,
  }) =>
      Skill(
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };
}


class Experince {
  final String? name;
  final String? date;
  final String? description;
  final String? location;

  Experince({this.name, this.date, this.description, this.location,});

  Experince copyWith({
    String? name,
    String? date,
    String? description,
    String? location,
  }) =>
      Experince(
        name: name ?? this.name,
        date: date ?? this.date,
        description: description ?? this.description,
        location: location ?? this.location
      );

  factory Experince.fromJson(Map<String, dynamic> json) => Experince(
        name: json["name"],
        date: json["date"],
        description: json["description"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "description": description,
        "location": location
      };
}


class Project {
  final String? companyName;
  final String? description;
  final String? projectName;
  final String? type;
  final List<String> links ;

  Project({
    this.companyName,
    this.description,
    this.projectName,
    this.type,
    this.links = const [],
  });

  Project copyWith({
   String? companyName,
   String? description,
   String? projectName,
   String? type,
    List<String>? links
  }) =>
      Project(

        companyName: companyName ?? this.companyName,
        description: description ?? this.description,
        projectName: projectName ?? this.projectName,
        type: type ?? this.type,
        links: links ?? this.links
      );

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    companyName: json["companyName"],
    description: json["description"],
    projectName: json["projectName"],
    type: json["type"],
    links: List<String>.from(json["links"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "linkedIn": companyName,
    "email": description,
    "cv": projectName,
    "github": type,
    "links": List<dynamic>.from(links.map((x) => x)),
  };
}

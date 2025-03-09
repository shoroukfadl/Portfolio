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
  final AboutMe? project;
  final String? email;
  final String? cv;
  final PersonalData? personalData;
  final AboutMe? experience;

  Data({
    this.skills = const [],
    this.aboutMe,
    this.project,
    this.email,
    this.cv,
    this.personalData,
    this.experience,
  });

  Data copyWith({
    List<Skill>? skills,
    AboutMe? aboutMe,
    AboutMe? project,
    String? email,
    String? cv,
    PersonalData? personalData,
    AboutMe? experience,
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
        project:
            json["project"] == null ? null : AboutMe.fromJson(json["project"]),
        email: json["email"],
        cv: json["cv"],
        personalData: json["personalData"] == null
            ? null
            : PersonalData.fromJson(json["personalData"]),
        experience: json["experience"] == null
            ? null
            : AboutMe.fromJson(json["experience"]),
      );

  Map<String, dynamic> toJson() => {
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "aboutMe": aboutMe?.toJson(),
        "project": project?.toJson(),
        "email": email,
        "cv": cv,
        "personalData": personalData?.toJson(),
        "experience": experience?.toJson(),
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

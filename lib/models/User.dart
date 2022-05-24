import 'dart:convert';

class User {
  final String login;
  final String avatarUrl;
  final String name;
  final String bio;
  final int public_repos;
  final int followers;

  User(
      {required this.login,
      required this.avatarUrl,
      required this.name,
      required this.bio,
      required this.public_repos,
      required this.followers});

  factory User.fromJson(Map json) {
    return User(
        login: json['login'],
        avatarUrl: json['avatar_url'],
        name: json['name'],
        public_repos: json['public_repos'],
        bio: json['bio'],
        followers: json['followers']);
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isMusician,
    required this.isContractor,
    required this.isSignUpCompleted,
  });

  final String id;
  final String name;
  final String email;
  final bool isMusician;
  final bool isContractor;
  final bool isSignUpCompleted;
}

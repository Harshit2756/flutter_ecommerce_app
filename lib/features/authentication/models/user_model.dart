import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/formatters/formatter.dart';

/// Model Class representing User Data
class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.userName,
    required this.profilePicture,
  });

  /// Helper Function to get User Full Name
  String get fullName => '$firstName $lastName';

  /// Helper Function to format User Phone Number
  String get formattedPhoneNumber => HFormatter.formatPhoneNumber(phoneNumber);

  /// Static Function to Split Full Name into First and Last Name
  static List<String> nameParts(fullName) => fullName.split(' ');

  /// Static Function to generate a username from Full Name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String cameCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$cameCaseUsername';

    return usernameWithPrefix;
  }

  /// Static Function to create a empty User Model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        userName: '',
        profilePicture: '',
      );

  /// Convert UserModel to JSON structure for storing in Firestore
  Map<String, dynamic> toJson() => {
        // 'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'userName': userName,
        'profilePicture': profilePicture,
      };

  /// Factory method to create UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        userName: data['userName'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}

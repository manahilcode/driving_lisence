// lib/models/user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final Agreement agreement; // Updated to use Agreement model
  final String authProvider;
  final String category;
  final DateTime createdAt;
  final String email;
  final DateTime lastLoginAt;
  final String name;
  final String? photoUrl;
  final TestApply testApply; // Updated to use TestApply model
  final String uid;

  UserModel({
    required this.agreement,
    required this.authProvider,
    required this.category,
    required this.createdAt,
    required this.email,
    required this.lastLoginAt,
    required this.name,
    this.photoUrl,
    required this.testApply,
    required this.uid,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      agreement: Agreement.fromMap(map['agreement'] ?? {}), // Handle null case
      authProvider: map['authProvider'] ?? '', // Provide default value
      category: map['category'] ?? '', // Provide default value
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(), // Handle null case
      email: map['email'] ?? '', // Provide default value
      lastLoginAt: (map['lastLoginAt'] as Timestamp?)?.toDate() ?? DateTime.now(), // Handle null case
      name: map['name'] ?? '', // Provide default value
      photoUrl: map['photoUrl'], // Allow null
      testApply: TestApply.fromMap(map['testApply'] ?? {}), // Handle null case
      uid: map['uid'] ?? '', // Provide default value
    );
  }
}

// Agreement Model
class Agreement {
  final bool agreement;

  Agreement({required this.agreement});

  factory Agreement.fromMap(Map<String, dynamic> map) {
    return Agreement(
      agreement: map['agreement'] ?? false, // Provide default value
    );
  }
}

// TestApply Model
class TestApply {
  final String selectDate;
  final String selectTime;
  final bool testApply;

  TestApply({
    required this.selectDate,
    required this.selectTime,
    required this.testApply,
  });

  factory TestApply.fromMap(Map<String, dynamic> map) {
    return TestApply(
      selectDate: map['selectDate'] ?? '', // Provide default value
      selectTime: map['selectTime'] ?? '', // Provide default value
      testApply: map['testApply'] ?? false, // Provide default value
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  final CollectionReference modules = FirebaseFirestore.instance.collection('course_modules');
  final CollectionReference quizzes = FirebaseFirestore.instance.collection('quizzes');
  final CollectionReference badges = FirebaseFirestore.instance.collection('badges');

  // ----------------- USER PROFILE CRUD -----------------
  Future<void> createUserProfile(Map<String, dynamic> userData) async {
    await users.add(userData);
  }

  Future<List<Map<String, dynamic>>> getUserProfiles() async {
    final snapshot = await users.get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<void> updateUserProfile(String docId, Map<String, dynamic> newData) async {
    await users.doc(docId).update(newData);
  }

  Future<void> deleteUserProfile(String docId) async {
    await users.doc(docId).delete();
  }

  // ----------------- MODULE PROGRESS -----------------
  Future<void> markUnitCompleted(String uid, String unitId) async {
    await _firestore.collection('users').doc(uid).collection('completed_units').doc(unitId).set({
      'completed': true,
      'timestamp': Timestamp.now(),
    });
  }

  Future<bool> isUnitCompleted(String uid, String unitId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('completed_units')
        .doc(unitId)
        .get();
    return snapshot.exists && snapshot.data()?['completed'] == true;
  }

  Future<bool> hasCompletedAllUnits(String uid, List<String> allUnitIds) async {
    int completedCount = 0;
    for (final unitId in allUnitIds) {
      final completed = await isUnitCompleted(uid, unitId);
      if (completed) completedCount++;
    }
    return completedCount == allUnitIds.length;
  }

  // ----------------- BADGES -----------------
  Future<void> unlockBadge(String uid, String badgeId, Map<String, dynamic> badgeData) async {
    await _firestore.collection('users').doc(uid).collection('badges').doc(badgeId).set(badgeData);
  }

  Future<bool> isBadgeUnlocked(String uid, String badgeId) async {
    final badge = await _firestore.collection('users').doc(uid).collection('badges').doc(badgeId).get();
    return badge.exists;
  }

  // ----------------- QUIZ RESULT -----------------
  Future<void> submitQuizResult({
    required String uid,
    required String unitId,
    required Map<String, dynamic> resultData,
  }) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('quizzes')
        .doc(unitId)
        .set(resultData);
  }

  Future<Map<String, dynamic>?> getQuizResult(String uid, String unitId) async {
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .collection('quizzes')
        .doc(unitId)
        .get();
    return doc.exists ? doc.data() : null;
  }
}

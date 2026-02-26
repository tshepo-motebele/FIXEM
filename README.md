# Fixem

Fixem is a modern Flutter-based application designed to bridge the gap between job seekers and employers. It features a robust job catalog system with real-time updates and an administrative suite for job management.

## 🚀 Features

### For Users
- **Secure Authentication**: Integration with Firebase Auth for safe user registration and login.
- **Job Catalog**: Browse a wide range of jobs with real-time updates from Cloud Firestore.
- **Advanced Search**: Quickly find relevant opportunities using the built-in search functionality.
- **Job Details**: View comprehensive job descriptions, required skills, salary information, and closing dates.
- **Profile Management**: Create and maintain a professional profile.
- **Module Progress**: (Work in Progress) Track learning progress and unlock badges.

### For Administrators
- **Job Management (CRUD)**: Create, Read, Update, and Delete job listings directly within the app.
- **Streamlined Dashboard**: A dedicated interface for managing the job catalog and overseeing system data.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Cross-platform UI toolkit)
- **Backend**: [Firebase](https://firebase.google.com/)
  - **Authentication**: Email/Password and social login support.
  - **Database**: Cloud Firestore for real-time data persistence.
- **Language**: [Dart](https://dart.dev/)

## 📂 Project Structure

- `lib/pages/`: Core user-facing screens (Login, Jobs, Dashboard).
- `lib/admin_pages/`: Exclusive tools for administrators (Job CRUD operations).
- `lib/services/`: Backend logic for Firestore and Firebase Auth.
- `lib/Models/`: Common UI components like the App Drawer.
- `lib/routes/`: Centralized route management.

## 🏁 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- Access to the Firebase project configuration.

### Setup
1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Configure your Firebase project (update `lib/main.dart` with your API keys if needed).
4. Run the app:
   ```bash
   flutter run
   ```

## 📄 License
This project is for private use and is not currently licensed for public distribution.

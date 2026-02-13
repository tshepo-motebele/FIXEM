import 'package:fixem/admin_pages/create_job.dart';
import 'package:fixem/admin_pages/read_jobs.dart';
import 'package:fixem/pages/createprofile_page.dart';
import 'package:fixem/pages/edit_job.dart';
import 'package:fixem/pages/job_description.dart';
import 'package:fixem/pages/jobs_page.dart';
import 'package:fixem/pages/login_page.dart';
import 'package:fixem/pages/main_page.dart';
import 'package:fixem/pages/register_page.dart';
import 'package:fixem/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class RouteManger {
  static const String homePage = '/';
  static const String registerpage = '/register';
  static const String login = '/login';
  static const String createProfile = '/CreateProfile';
  static const String dashboard = '/Dashboard';
  static const String jobs = '/Jobs';
  static const String jobDescription = '/JobDescription';
  static const String createjob = '/CreateJob';
  static const String readjob = '/ReadJob';
  static const String editjob = '/EditJob';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => MainPage());

      case registerpage:
        return MaterialPageRoute(builder: (context) => RegisterPage());

      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());

      case createProfile:
        return MaterialPageRoute(builder: (context) => CreatePage());

      case dashboard:
        return MaterialPageRoute(builder: (context) => DashboardPage());

      case jobs:
        return MaterialPageRoute(builder: (context) => JobsPage());

      case createjob:
        return MaterialPageRoute(builder: (context) => CreateJobPage());

      case jobDescription:
        final args = settings.arguments as Map<String, dynamic>;
        final jobId = args['jobId'] as String;
        return MaterialPageRoute(
          builder: (context) => JobDescriptionPage(jobId: jobId),
        );

      case readjob:
        return MaterialPageRoute(builder: (context) => ReadJobsPage());

      case editjob:
        final jobId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => EditJobPage(jobId: jobId),
        );

        

      default:
        throw FormatException('Route not found');
    }
  }
}

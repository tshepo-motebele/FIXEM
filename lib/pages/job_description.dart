import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JobDescriptionPage extends StatelessWidget {
  final String jobId;

  const JobDescriptionPage({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        //  Fetch the job document from Firestore using the jobId
        future: FirebaseFirestore.instance.collection('jobs').doc(jobId).get(),
        builder: (context, snapshot) {
          // ⏳ Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          //  Error state
          if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(child: Text('Job not found.'));
          }

          // ✅ Data fetched
          final jobData = snapshot.data!.data() as Map<String, dynamic>;

          final title = jobData['title'] ?? 'No title';
          final location = jobData['location'] ?? 'Unknown location';
          final description =jobData['description'] ?? 'No description provided';
          final skills = jobData['skills'] ?? 'No skills listed';
          final salary = jobData['salary'] ?? 'Not specified';
          final closingdate = jobData['closingdate'] ?? 'Not specified';
          final type = jobData['type'] ?? 'N/A';

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                // 🧾 Job Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // 🏢 Location
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(width: 5),
                    Text(location, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 20),

                // 📄 Job Description
                const Text(
                  'Job Description:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(description, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),

                // 🧠 Skills
                const Text(
                  'Required Skills / Badge:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(skills, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),

                // 💰 Salary
                const Text(
                  'Salary:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(salary, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),

                // 📌 Job Type
                const Text(
                  'Closing Date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(closingdate, style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 30),

                // Optional: Apply or Back button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'APPLY NOW',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

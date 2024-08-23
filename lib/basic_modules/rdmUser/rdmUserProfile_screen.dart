import 'package:first_project/basic_modules/rdmUser/rdmUser_Model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  //const ProfileScreen({super.key});
  Result item;
  ProfileScreen(this.item);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Profile'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage(widget.item.picture.large.toString()),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.item.name.first} ${widget.item.name.last}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "${widget.item.email}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '${widget.item.phone}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            //   Wrap(
            //     spacing: 8.0,
            //     children: userProfile.skills
            //         .map((skill) => Chip(label: Text(skill)))
            //         .toList(),
            //   ),
            //   SizedBox(height: 24),
            //   Text(
            //     'Experience',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            //   SizedBox(height: 8),
            //   Column(
            //     children: userProfile.experiences.map((experience) {
            //       return ListTile(
            //         title: Text(experience.companyName),
            //         subtitle:
            //             Text('${experience.role} • ${experience.duration}'),
            //       );
            //     }).toList(),
            //   ),
          ],
        ),
      ),
    );
  }
}

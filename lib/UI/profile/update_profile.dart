import 'package:flutter/material.dart';
import 'package:movies/Core/Custom_widget/CustomTextFormField.dart';
import 'package:movies/Core/Custom_widget/custombutton.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/Core/theme/theme.dart';

class UpdateProfile extends StatefulWidget {
  static const routeName = '/update_profile';
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  List<String> avatars = [
    ImagesPath.avatar1,
    ImagesPath.avatar2,
    ImagesPath.avatar3,
    ImagesPath.avatar4,
    ImagesPath.avatar5,
    ImagesPath.avatar6,
    ImagesPath.avatar7,
    ImagesPath.avatar8,
    ImagesPath.avatar9,
  ];

  String selectedAvatar = ImagesPath.avatar1;

  final DraggableScrollableController _draggableController = 
      DraggableScrollableController();

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildAvatarSheet(),
    );
  }

  Widget _buildAvatarSheet() {
    var theme = ThemeApp.theme.textTheme;
    
    return DraggableScrollableSheet(
      controller: _draggableController,
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Choose Avatar',
                  style: theme.headlineSmall,
                ),
              ),
              // Avatar Grid
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemCount: avatars.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatar = avatars[index];
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedAvatar == avatars[index]
                                ? Colors.amber
                                : Colors.transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            avatars[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _draggableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = ThemeApp.theme.textTheme;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: CustomButtonWidget(
              onTap: () {},
              backgroundColor: Colors.red,
              color: Colors.red,
              child: Text(
                "Delete Account",
                style: theme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: CustomButtonWidget(
              onTap: () {},
              backgroundColor: Colors.amber,
              color: Colors.black,
              child: const Text(
                "Update Data",
                style: TextStyle(color: ColorsApp.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Update Profile",
          style: theme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          
               GestureDetector(
                onTap: _showAvatarPicker,
                child:Image.asset(
                          selectedAvatar,
                          height: 150,
                          width: 150,
                        ),
             
            ),
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'John Safwat',
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: '011203112123',
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Reset Password",
                  style: theme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
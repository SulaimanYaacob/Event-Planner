import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_planner/models/picsum.dart';
import 'package:event_planner/services/users.service.dart';
import 'package:flutter/material.dart';

class EditProfileImage extends StatefulWidget {
  final Function refreshProfile;
  const EditProfileImage({Key? key, required this.refreshProfile})
      : super(key: key);

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  late List<PicsumImage> picsumImages = [];
  var selectedImageUrl = "";

  @override
  void initState() {
    super.initState();
    fetchPicsum();
  }

  Future<void> fetchPicsum() async {
    try {
      final List<dynamic> data = await PicsumImage.fetchPicsumImages();
      setState(() {
        picsumImages = PicsumImage().parsePicsumImages(data);
      });
    } catch (error) {
      // Handle error while fetching images
      debugPrint('Error fetching images: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: picsumImages.length,
        itemBuilder: (context, index) {
          final image = picsumImages[index];
          return GestureDetector(
            onTap: () async {
              setState(() {
                selectedImageUrl = image.url!;
              });

              // Save the selected image URL to Firebase
              try {
                await UserService().updateUser(
                  "String",
                  "profileImage",
                  selectedImageUrl,
                );
                widget.refreshProfile();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              } catch (error) {
                // Handle error while updating user profile
                debugPrint('Error updating user profile: $error');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: image.url!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

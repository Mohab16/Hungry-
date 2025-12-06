import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/helpers/extensions.dart';
import 'package:hungry/core/helpers/spacing.dart';
import 'package:hungry/core/themes/my_colors.dart';
import 'package:hungry/core/themes/my_styles.dart';
import 'package:hungry/features/signup/logic/cubit/signup_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerWidget> {
  File? profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 75,
    );
    if (image != null) {
      setState(() {
        profileImage = File(image.path);
        context.read<SignupCubit>().profileImage=profileImage;
      });
    }
  }

  void showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Choose Profile Picture',
                    style: MyStyles.font20RobotoDarkGreenBold,
                  ),
                  verticalSpacing(20),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Gallery",
                      style: MyStyles.font16RobotoDarkGreenMedium,
                    ),
                    onTap: () {
                      context.pop();
                      pickImage(ImageSource.gallery);
                    },
                  ),
                  verticalSpacing(8),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: MyColors.grey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Camera",
                      style: MyStyles.font16RobotoDarkGreenMedium,
                    ),
                    onTap: () {
                      context.pop();
                      pickImage(ImageSource.camera);
                    },
                  ),
                  if(profileImage!=null)...[
                  verticalSpacing(8),
                   ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.r)
                    ),
                    child: const Icon(Icons.photo_library,color: Colors.white,),
                  ),
                  title:  Text(
                    "Remove picture",
                    style: MyStyles.font16RobotoDarkGreenMedium,
                  ),
                  onTap: () {
                    setState(() {
                      profileImage=null;
                    });
                    context.pop();
                  },
                ),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                  onTap: showImageSourceBottomSheet,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundColor: MyColors.darkGreen.withOpacity(0.2),
                        backgroundImage: profileImage!=null? FileImage(profileImage!):null,
                        child: profileImage==null?Icon(Icons.person,size: 60.sp,color: Colors.white.withOpacity(0.7),):null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: MyColors.darkGreen,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: MyColors.darkGreen,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}
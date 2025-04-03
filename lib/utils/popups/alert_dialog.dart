import 'package:charging/features/authentication/controllers/register_controller.dart';
import 'package:charging/features/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvxConfirmDalog {
  static dialogboxConfirmInfo(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Confirm Update'),
            content: const Text('Update you profile or not?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  controller.updateProfile();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }

  static dialogboxConfirmChangePassword(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Confirm Update'),
            content: const Text('Update you password or not?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  controller.updatePassword();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }

  static dialogboxPassNewNotMatch(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Center(
              child: Text(
                'Confirm New Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: const Text(
              'Confirm New Password Not Matching',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }

  static dialogboxConfirmLogout(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Do you want to exit?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  controller.logout();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }

  static dialogboxConfirmRegister(BuildContext context) {
    final controller = Get.put(SignupController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Confirm Register'),
            content: const Text('Do you want to create account?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  controller.register();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }
}

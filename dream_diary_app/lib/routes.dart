import 'package:dream_diary_app/Dashboard/Dream%20Entry/editEntry.dart';
import 'package:dream_diary_app/Dashboard/Dream%20Entry/fullEntry.dart';
import 'package:dream_diary_app/Dashboard/Dream%20Entry/newEntry.dart';
import 'package:dream_diary_app/Dashboard/dashboard.dart';
import 'package:dream_diary_app/Dashboard/search.dart';
import 'package:dream_diary_app/Models/entry.dart';
import 'package:dream_diary_app/Settings/editPassword.dart';
import 'package:dream_diary_app/Settings/editProfile.dart';
import 'package:dream_diary_app/Settings/profile.dart';
import 'package:dream_diary_app/Account/registration.dart';
import 'package:dream_diary_app/Components/NavigationBar.dart';
import 'package:dream_diary_app/Providers/entry_provider.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/main.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  Registration.routeName: (BuildContext context) => const Registration(),
  Profile.routeName: (BuildContext context) => const Profile(),
  EditProfile.routeName: (BuildContext context) => const EditProfile(),
  EditPassword.routeName: (BuildContext context) => const EditPassword(),
  SearchPage.routeName: (BuildContext context) => const SearchPage(),
  Dashboard.routeName: (BuildContext context) => const Dashboard(),
  NavigationBarApp.routeName: (BuildContext context) =>
      const NavigationBarApp(),
  NewEntry.routeName: (BuildContext context) => Builder(
        builder: (BuildContext context) {
          EntryProvider entryProvider =
              Provider.of<EntryProvider>(context, listen: false);

          Entry firstEntry = entryProvider.entries.isNotEmpty
              ? entryProvider.entries[0]
              : Entry(id: '', date: '', time: '', title: '', description: '');

          return NewEntry(
            onSaveEntry: () {
              Provider.of<EntryProvider>(context, listen: false)
                  .notifyNewEntry();
            },
          );
        },
      ),
  EditEntry.routeName: (BuildContext context) => Builder(
        builder: (BuildContext context) {
          EntryProvider entryProvider =
              Provider.of<EntryProvider>(context, listen: false);

          Entry firstEntry = entryProvider.entries.isNotEmpty
              ? entryProvider.entries[0]
              : Entry(id: '', date: '', time: '', title: '', description: '');

          return EditEntry(entry: firstEntry);
        },
      ),
  FullEntry.routeName: (BuildContext context) => const FullEntry(),
};

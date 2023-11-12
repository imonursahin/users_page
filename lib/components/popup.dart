import 'package:flutter/material.dart';
import '../model/usermodel.dart';

class Popup {
  static void showPopup(BuildContext context, {required User userData}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 50,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(userData.profileImage!),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Name: ${userData.name}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('@${userData.username}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${userData.email}'),
                      Text('Telefon: ${userData.phone}'),
                      Text(
                          'Adres: ${userData.street}, ${userData.suite} ${userData.zipcode}'),
                      Text('Şehir: ${userData.city}'),
                      Text('Konum: ${userData.geoLat}, ${userData.geoLng}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

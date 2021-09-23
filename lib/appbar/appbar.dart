import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black.withOpacity(0),
      // leading:
      title: Row(
        children: [
          Icon(
            Icons.location_on_rounded,
            color: Colors.red,
          ),
          Container(
            width: 250,
            child: Text(
              '16, Broadway Shopping Centre, T.t. Dadar,',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                shadows: [
                  Shadow(offset: Offset(0, -6), color: Colors.black),
                ],
                color: Colors.transparent,
                height: 2,
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              'https://www.pinkvilla.com/files/styles/amp_metadata_content_image/public/triple_h_john_cena_wwe_wrestlemania_37_possibility.jpg',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}

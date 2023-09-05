import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildEmail({required TextEditingController controller}) => Container(
      height: 64,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Enter E-mail",
          labelStyle: GoogleFonts.inriaSans(
              fontSize: 15, color: Color.fromRGBO(136, 136, 136, 100)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorStyle: TextStyle(color: Colors.black),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          if (value.length < 6) {
            return 'Email must be at least 6 characters long';
          }
          return null;
        },
      ),
    );

import 'package:doingbusiness/constants.dart';
import 'package:flutter/material.dart';

class CustomeSearchBar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  CustomeSearchBar({super.key, required this.searchController});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search...',

            // Add a clear button to the search bar
            suffixIcon: IconButton(
              color: primaryColor,
              icon: const Icon(Icons.clear),
              onPressed: () => searchController.clear(),
            ),

            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              color: primaryColor,
              icon: const Icon(Icons.search),
              onPressed: () {
                // Perform the search here
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: primaryColor),
              borderRadius: BorderRadius.circular(24),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}

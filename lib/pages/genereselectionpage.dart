import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenreSelectionPage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const GenreSelectionPage({required this.userData});

  @override
  _GenreSelectionPageState createState() => _GenreSelectionPageState();
}

class _GenreSelectionPageState extends State<GenreSelectionPage> {
  bool _isLoading = false;
  final Set<String> _selectedGenres = {};

  final List<Map<String, dynamic>> genres = [
    {'name': 'Fiction', 'icon': Icons.auto_stories, 'color': Colors.blue},
    {'name': 'Non-Fiction', 'icon': Icons.menu_book, 'color': Colors.green},
    {'name': 'Mystery', 'icon': Icons.search, 'color': Colors.purple},
    {'name': 'Romance', 'icon': Icons.favorite, 'color': Colors.pink},
    {
      'name': 'Science Fiction',
      'icon': Icons.rocket_launch,
      'color': Colors.indigo,
    },
    {'name': 'Fantasy', 'icon': Icons.castle, 'color': Colors.deepPurple},
    {'name': 'Thriller', 'icon': Icons.flash_on, 'color': Colors.red},
    {'name': 'Biography', 'icon': Icons.person, 'color': Colors.orange},
    {'name': 'History', 'icon': Icons.history_edu, 'color': Colors.brown},
    {'name': 'Self-Help', 'icon': Icons.psychology, 'color': Colors.teal},
    {'name': 'Horror', 'icon': Icons.nightlight, 'color': Colors.grey},
    {'name': 'Poetry', 'icon': Icons.format_quote, 'color': Colors.cyan},
  ];

  Future<void> _completeRegistration() async {
    if (_selectedGenres.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one genre'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Add favorite genres to user data
    final completeUserData = {
      ...widget.userData,
      'favoriteGenres': _selectedGenres.toList(),
    };

    try {
      // TODO: Replace with your actual MongoDB API endpoint
      final response = await http.post(
        Uri.parse('YOUR_API_URL/api/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(completeUserData),
      );

      // Simulate API call for demo
      await Future.delayed(Duration(seconds: 2));

      setState(() => _isLoading = false);

      // Show success dialog
      _showSuccessDialog();
    } catch (e) {
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
          // Navigate to Home Page
          Navigator.pushReplacementNamed(context, '/home');
          // OR: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        });

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 64,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Welcome Aboard!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Your account has been created',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress Indicator
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        SizedBox(height: 20),

                        // Icon
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 24),

                        Text(
                          'Choose Your Favorites',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          'Step 2 of 2 • Select genres you love',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),

                        SizedBox(height: 40),

                        // Genre Grid
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Selected: ${_selectedGenres.length}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              SizedBox(height: 20),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.3,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                    ),
                                itemCount: genres.length,
                                itemBuilder: (context, index) {
                                  final genre = genres[index];
                                  final isSelected = _selectedGenres.contains(
                                    genre['name'],
                                  );

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _selectedGenres.remove(genre['name']);
                                        } else {
                                          _selectedGenres.add(genre['name']);
                                        }
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? genre['color'].withOpacity(
                                                  0.1,
                                                )
                                                : Colors.grey[50],
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color:
                                              isSelected
                                                  ? genre['color']
                                                  : Colors.grey[300]!,
                                          width: isSelected ? 2 : 1,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            genre['icon'],
                                            size: 36,
                                            color:
                                                isSelected
                                                    ? genre['color']
                                                    : Colors.grey[600],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            genre['name'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight:
                                                  isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                              color:
                                                  isSelected
                                                      ? genre['color']
                                                      : Colors.grey[700],
                                            ),
                                          ),
                                          if (isSelected)
                                            Icon(
                                              Icons.check_circle,
                                              size: 16,
                                              color: genre['color'],
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Complete Button
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                _isLoading ? null : _completeRegistration,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.deepPurple,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                            ),
                            child:
                                _isLoading
                                    ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.deepPurple,
                                            ),
                                      ),
                                    )
                                    : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Complete Setup',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.check, size: 20),
                                      ],
                                    ),
                          ),
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

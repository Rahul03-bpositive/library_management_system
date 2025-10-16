import 'package:app/pages/book_view_page.dart';
import 'package:flutter/material.dart';
import 'email_login_page.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;
  final bool isLoggedIn;
  final bool isLiked;
  final bool isInCart;
  final VoidCallback onLikeToggle;
  final VoidCallback onCartToggle;

  const BookDetailPage({
    required this.book,
    required this.isLoggedIn,
    required this.isLiked,
    required this.isInCart,
    required this.onLikeToggle,
    required this.onCartToggle,
  });

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFullDescription = false;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _isLoggedIn = widget.isLoggedIn;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar with gradient
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: Colors.white,
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.share, color: Colors.black),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Share functionality')),
                    );
                  },
                ),
              ),
              SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepPurple.shade50, Colors.white],
                  ),
                ),
                child: Center(
                  child: Hero(
                    tag: 'book_${widget.book.id}',
                    child: Container(
                      margin: EdgeInsets.only(top: 80, bottom: 40),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(widget.book.cover),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Genre Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.deepPurple.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      widget.book.genre,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Title and Author
                  Text(
                    widget.book.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'by ${widget.book.author}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Stats Row
                  Row(
                    children: [
                      _buildStatItem(
                        icon: Icons.star,
                        value: widget.book.rating.toString(),
                        label: 'Rating',
                        color: Colors.amber,
                      ),
                      SizedBox(width: 20),
                      _buildStatItem(
                        icon: Icons.menu_book,
                        value: '${widget.book.pages}',
                        label: 'Pages',
                        color: Colors.blue,
                      ),
                      SizedBox(width: 20),
                      _buildStatItem(
                        icon: Icons.calendar_today,
                        value: '${widget.book.year}',
                        label: 'Year',
                        color: Colors.green,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Availability Status
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:
                          widget.book.available
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            widget.book.available
                                ? Colors.green.withOpacity(0.3)
                                : Colors.red.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          widget.book.available
                              ? Icons.check_circle
                              : Icons.info_outline,
                          color:
                              widget.book.available ? Colors.green : Colors.red,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.book.available
                                    ? 'Available Now'
                                    : 'Currently Unavailable',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      widget.book.available
                                          ? Colors.green
                                          : Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.book.available
                                    ? 'Ready to request'
                                    : 'Will notify when available',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Tab Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[700],
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(text: 'Details'),
                        Tab(text: 'Reviews'),
                        Tab(text: 'Similar'),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Tab Content
                  Container(
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Details Tab
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                widget.book.description,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                  height: 1.6,
                                ),
                                maxLines: _showFullDescription ? null : 4,
                                overflow:
                                    _showFullDescription
                                        ? null
                                        : TextOverflow.ellipsis,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _showFullDescription =
                                        !_showFullDescription;
                                  });
                                },
                                child: Text(
                                  _showFullDescription
                                      ? 'Show less'
                                      : 'Read more',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Additional Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              _buildInfoRow('ISBN', widget.book.isbn),
                              _buildInfoRow('Language', 'English'),
                              _buildInfoRow('Publisher', 'Classic Publishing'),
                              _buildInfoRow(
                                'Format',
                                'Hardcover, Paperback, E-book',
                              ),
                            ],
                          ),
                        ),

                        // Reviews Tab
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.rate_review_outlined,
                                size: 64,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No reviews yet',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Be the first to review this book',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Similar Books Tab
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.auto_stories,
                                size: 64,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Similar books',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Discover more books like this',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              // Like Button
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:
                      widget.isLiked
                          ? Colors.red.withOpacity(0.1)
                          : Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color:
                        widget.isLiked
                            ? Colors.red.withOpacity(0.3)
                            : Colors.grey[300]!,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    widget.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: widget.isLiked ? Colors.red : Colors.grey[700],
                  ),
                  onPressed: widget.onLikeToggle,
                ),
              ),
              SizedBox(width: 12),

              // Cart Button
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:
                      widget.isInCart
                          ? Colors.green.withOpacity(0.1)
                          : Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color:
                        widget.isInCart
                            ? Colors.green.withOpacity(0.3)
                            : Colors.grey[300]!,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    widget.isInCart
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    color: widget.isInCart ? Colors.green : Colors.grey[700],
                  ),
                  onPressed: widget.onCartToggle,
                ),
              ),
              SizedBox(width: 12),

              // Request Button
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      widget.book.available
                          ? () {
                            if (!_isLoggedIn) {
                              _showModernLoginDialog(context);
                            } else {
                              _showSuccessDialog(context);
                            }
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book_online),
                      SizedBox(width: 8),
                      Text(
                        'Request Book',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  void _showModernLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.deepPurple.shade700],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Login Required',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  'Please login to request books from our library and enjoy all features',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 32),

                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context);

                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => EmailLoginPage(
                //             onLoginSuccess: () {
                //               Navigator.pop(context);
                //               _showSuccessDialog(context);
                //             },
                //           ),
                //         ),
                //       );
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text('Redirecting to login...'),
                //           behavior: SnackBarBehavior.floating,
                //         ),
                //       );
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.deepPurple,
                //       foregroundColor: Colors.white,
                //       padding: EdgeInsets.symmetric(vertical: 16),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(16),
                //       ),
                //       elevation: 0,
                //     ),
                //     child: Text(
                //       'Login Now',
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Close the dialog first
                      Navigator.pop(context);

                      // Step 3: Navigate to EmailLoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EmailLoginPage(
                                // Step 4: Pass a callback function
                                // This function will be called when login is successful
                                onLoginSuccess: () {
                                  // Step 8: This code runs AFTER successful login
                                  // Update your state to show user is logged in
                                  setState(() {
                                    _isLoggedIn =
                                        true; // ✅ User is now logged in!
                                  });

                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('✅ Login successful!'),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Maybe Later',
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: EdgeInsets.all(32),
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
                  'Request Successful!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  'Your book request has been submitted. We\'ll notify you once it\'s ready for pickup.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Got it!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

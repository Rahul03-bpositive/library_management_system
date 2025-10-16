import 'package:app/pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Book {
  final int id;
  final String title;
  final String author;
  final String cover;
  final double rating;
  final int pages;
  final String description;
  final String genre;
  final bool available;
  final int year;
  final String isbn;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.cover,
    required this.rating,
    required this.pages,
    required this.description,
    required this.genre,
    required this.available,
    required this.year,
    required this.isbn,
  });
}

class BooksViewPage extends StatefulWidget {
  @override
  _BooksViewPageState createState() => _BooksViewPageState();
}

class _BooksViewPageState extends State<BooksViewPage>
    with TickerProviderStateMixin {
  final PageController _bannerController = PageController();
  final TextEditingController _searchController = TextEditingController();
  int _currentBannerIndex = 0;
  Timer? _bannerTimer;
  Set<int> likedBooks = {};
  Set<int> cartBooks = {};
  bool isLoggedIn = false;
  String selectedFilter = 'All';
  List<Book> filteredBooks = [];
  bool isSearching = false;
  late AnimationController _fabController;

  final List<String> filters = [
    'All',
    'Fiction',
    'Non-Fiction',
    'Available',
    'Popular',
  ];

  final List<Book> books = [
    Book(
      id: 1,
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      cover: "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400",
      rating: 4.5,
      pages: 180,
      description:
          "A classic American novel set in the Jazz Age, exploring themes of wealth, love, and the American Dream.",
      genre: "Classic Fiction",
      available: true,
      year: 1925,
      isbn: "978-0-7432-7356-5",
    ),
    Book(
      id: 2,
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      cover: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400",
      rating: 4.8,
      pages: 324,
      description:
          "A gripping tale of racial injustice and childhood innocence in the American South.",
      genre: "Classic Fiction",
      available: true,
      year: 1960,
      isbn: "978-0-06-112008-4",
    ),
    Book(
      id: 3,
      title: "1984",
      author: "George Orwell",
      cover:
          "https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400",
      rating: 4.6,
      pages: 328,
      description:
          "A dystopian social science fiction novel exploring surveillance, truth, and totalitarianism.",
      genre: "Science Fiction",
      available: false,
      year: 1949,
      isbn: "978-0-452-28423-4",
    ),
    Book(
      id: 4,
      title: "Pride and Prejudice",
      author: "Jane Austen",
      cover:
          "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400",
      rating: 4.7,
      pages: 432,
      description:
          "A romantic novel of manners that critiques the British landed gentry at the end of the 18th century.",
      genre: "Romance",
      available: true,
      year: 1813,
      isbn: "978-0-14-143951-8",
    ),
    Book(
      id: 5,
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      cover:
          "https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=400",
      rating: 4.9,
      pages: 310,
      description:
          "A fantasy adventure following Bilbo Baggins on his unexpected journey to reclaim a treasure.",
      genre: "Fantasy",
      available: true,
      year: 1937,
      isbn: "978-0-547-92822-7",
    ),
    Book(
      id: 6,
      title: "The Catcher in the Rye",
      author: "J.D. Salinger",
      cover:
          "https://images.unsplash.com/photo-1524578271613-d550eacf6090?w=400",
      rating: 4.3,
      pages: 277,
      description:
          "A story about teenage rebellion and alienation, narrated by the iconic Holden Caulfield.",
      genre: "Coming of Age",
      available: true,
      year: 1951,
      isbn: "978-0-316-76948-0",
    ),
  ];

  @override
  void initState() {
    super.initState();

    filteredBooks = books; //all books will be shown initially
    _startBannerAutoScroll();
    _fabController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        filteredBooks = books;
      } else {
        filteredBooks =
            books.where((book) {
              return book.title.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ) ||
                  book.author.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ) ||
                  book.genre.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  );
            }).toList();
      }
    });
  }

  void _startBannerAutoScroll() {
    _bannerTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentBannerIndex < 2) {
        _currentBannerIndex++;
      } else {
        _currentBannerIndex = 0;
      }
      if (_bannerController.hasClients) {
        _bannerController.animateToPage(
          _currentBannerIndex,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    _searchController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  void _toggleLike(int bookId) {
    setState(() {
      if (likedBooks.contains(bookId)) {
        likedBooks.remove(bookId);
      } else {
        likedBooks.add(bookId);
      }
    });
  }

  void _toggleCart(int bookId) {
    setState(() {
      if (cartBooks.contains(bookId)) {
        cartBooks.remove(bookId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed from cart'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        cartBooks.add(bookId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to cart'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _navigateToBookDetail(Book book) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => BookDetailPage(
              book: book,
              isLoggedIn: isLoggedIn,
              isLiked: likedBooks.contains(book.id),
              isInCart: cartBooks.contains(book.id),
              onLikeToggle: () => _toggleLike(book.id),
              onCartToggle: () => _toggleCart(book.id),
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter Books',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ...filters.map((filter) {
                return ListTile(
                  title: Text(filter),
                  trailing:
                      selectedFilter == filter
                          ? Icon(Icons.check, color: Colors.deepPurple)
                          : null,
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Professional App Bar with Search
          SliverAppBar(
            expandedHeight: isSearching ? 120 : 180,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade400,
                      Colors.deepPurple.shade700,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isSearching) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Discover',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Your next adventure',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          // Navigate to cart
                                        },
                                      ),
                                      if (cartBooks.isNotEmpty)
                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              '${cartBooks.length}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.notifications_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onTap: () {
                            setState(() {
                              isSearching = true;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search books, authors, genres...',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                            suffixIcon:
                                _searchController.text.isNotEmpty
                                    ? IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.grey[600],
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() {
                                          isSearching = false;
                                        });
                                      },
                                    )
                                    : null,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.tune, color: Colors.white),
                        onPressed: _showFilterBottomSheet,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats Cards
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.library_books,
                          value: '${books.length}',
                          label: 'Books',
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.favorite,
                          value: '${likedBooks.length}',
                          label: 'Favorites',
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.shopping_bag,
                          value: '${cartBooks.length}',
                          label: 'In Cart',
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),

                // Featured Banner
                if (!isSearching) ...[
                  _buildBannerCarousel(),
                  SizedBox(height: 24),

                  // Genre Tags
                  _buildGenreChips(),
                  SizedBox(height: 24),
                ],

                // All Books Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isSearching ? 'Search Results' : 'All Books',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.grid_view),
                        label: Text('View All'),
                      ),
                    ],
                  ),
                ),

                // Books Grid
                _buildBooksGrid(filteredBooks),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _fabController, curve: Curves.easeOut),
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Quick add functionality
          },
          icon: Icon(Icons.add),
          label: Text('Quick Add'),
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildGenreChips() {
    final genres = [
      'Fiction',
      'Non-Fiction',
      'Romance',
      'Sci-Fi',
      'Fantasy',
      'Mystery',
    ];
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(genres[index]),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.grey[100],
              selectedColor: Colors.deepPurple.withOpacity(0.2),
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              side: BorderSide(color: Colors.grey[300]!),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBannerCarousel() {
    final bannerBooks = [books[0], books[1], books[4]];
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          PageView.builder(
            controller: _bannerController,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemCount: bannerBooks.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _navigateToBookDetail(bannerBooks[index]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          bannerBooks[index].cover,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Featured',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                bannerBooks[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                bannerBooks[index].author,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Row(
              children: List.generate(
                bannerBooks.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  width: _currentBannerIndex == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentBannerIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBooksGrid(List<Book> bookList) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.58,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return _buildEnhancedBookCard(bookList[index]);
        },
      ),
    );
  }

  Widget _buildEnhancedBookCard(Book book) {
    return GestureDetector(
      onTap: () => _navigateToBookDetail(book),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Cover with overlay actions
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(book.cover),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  // Status badge
                  if (!book.available)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Unavailable',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  // Like button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => _toggleLike(book.id),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          likedBooks.contains(book.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              likedBooks.contains(book.id)
                                  ? Colors.red
                                  : Colors.grey[700],
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  // Rating badge
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 12),
                          SizedBox(width: 4),
                          Text(
                            book.rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
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
            // Book Info
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.genre,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          book.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          book.author,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.menu_book,
                              color: Colors.grey[500],
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${book.pages}p',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

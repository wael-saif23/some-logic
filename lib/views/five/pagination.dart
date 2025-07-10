import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  bool _isLoading = false;
  int _currentPage = 1;
  final int _totalPages = 5;
  final int _itemsPerPage = 20;
  List<int> items = [];
  final ScrollController _scrollController = ScrollController();
  

  Future<void> _fetchData({required int page}) async {
   setState(() {
     _isLoading = true;
   });
    await Future.delayed(Duration(seconds: 1));
    final start = (page - 1) * _itemsPerPage;
    List<int> newItems = List.generate(_itemsPerPage, (index) {
      return start + index;
    });
    setState(() {
      items.addAll(newItems);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData(page: _currentPage);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isLoading &&
          _currentPage < _totalPages) {
        _fetchData(page: _currentPage++);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      'Item $index',
                      style: TextStyle(fontSize: 30.0),
                    );
                  },
                ),
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    padding: EdgeInsets.all(10),
                    strokeWidth: 5,
                  ),
                ),
              if (!_isLoading && _currentPage == _totalPages)
                Center(
                  child: Text(
                    'No more data available',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

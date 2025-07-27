import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/home/users/controllers/item_search_controller.dart';

class ItemSearchScreen extends StatefulWidget {
  const ItemSearchScreen({super.key});

  @override
  State<ItemSearchScreen> createState() => _ItemSearchScreenState();
}

class _ItemSearchScreenState extends State<ItemSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optional: Load initial items or clear previous search
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<ItemSearchProvider>(context, listen: false).searchItems(name: '');
    // });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Search'),
        backgroundColor: Colors.lightGreen,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for items...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Trigger search when icon is pressed
                    Provider.of<ItemSearchProvider>(context, listen: false)
                        .searchItems(name: _searchController.text);
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onSubmitted: (value) {
                // Trigger search when user presses enter/done on keyboard
                Provider.of<ItemSearchProvider>(context, listen: false)
                    .searchItems(name: value);
              },
              onChanged: (value) {
                // Optional: Live search as user types
                // If you want live search, uncomment the next line.
                // Be careful with API call frequency for live search.
                // Provider.of<ItemSearchProvider>(context, listen: false).searchItems(name: value);
              },
            ),
          ),
        ),
      ),
      body: Consumer<ItemSearchProvider>(
        builder: (context, itemProvider, child) {
          if (itemProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (itemProvider.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${itemProvider.errorMessage}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          } else if (itemProvider.items.isEmpty &&
              itemProvider.currentSearchQuery.isNotEmpty) {
            return const Center(
              child: Text('No items found for your search.'),
            );
          } else if (itemProvider.items.isEmpty &&
              itemProvider.currentSearchQuery.isEmpty) {
            return const Center(
              child: Text('Start typing to search for items.'),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: itemProvider.items.length,
              itemBuilder: (context, index) {
                final item = itemProvider.items[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Display image if available
                        if (item.imageUrlFull != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              item.imageUrlFull!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.broken_image,
                                      size: 40, color: Colors.grey),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image_not_supported,
                                size: 40, color: Colors.grey),
                          ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name ??
                                    'Unknown Item', // Display item name
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (item.unitType != null)
                                Text(
                                  'Unit: ${item.unitType}', // Display unit type if available
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              // You can add more item details here if needed
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
        },
      ),
    );
  }
}

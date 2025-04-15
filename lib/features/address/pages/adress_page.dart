import 'package:flutter/material.dart';

class SavedAddressPage extends StatefulWidget {
  const  SavedAddressPage({Key? key}) : super(key: key);

  @override
  State<SavedAddressPage> createState() => _SavedAddressPageState();
}

class _SavedAddressPageState extends State<SavedAddressPage> {
  int selectedAddressIndex = 0;

  final List<Map<String, String>> addresses = [
    {
      "label": "Home",
      "address": "925 S Chugach St #APT 10, Alaska",
      "default": "true"
    },
    {
      "label": "Office",
      "address": "2438 6th Ave, Ketchikan, Alaska"
    },
    {
      "label": "Apartment",
      "address": "2551 Vista Dr #B301, Juneau, Alaska"
    },
    {
      "label": "Parent’s House",
      "address": "4821 Ridge Top Cir, Anchorage, Alaska"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Address"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Saved Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final item = addresses[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Row(
                        children: [
                          Text(item['label'] ?? ""),
                          if (item['default'] == "true")
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey.shade300,
                              ),
                              child: Text(
                                "Default",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                        ],
                      ),
                      subtitle: Text(item['address'] ?? ""),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: selectedAddressIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedAddressIndex = value!;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                // Add New Address
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text("Add New Address"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Apply button action
                },
                child: Text(
                  "Apply",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import '../../common/store_icon_button.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
        leading:  BackButton(),
        title:  Text(
          "Address",
          style: TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          Divider(),
          Padding(
            padding:  EdgeInsets.only(right: 16),
            child: StoreIconButton(
              icon: "assets/icons/notification.svg",
              width: 24,
              height: 24,
              callback: () {},
            ),
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
              itemCount: addresses.length + 1,
              itemBuilder: (context, index) {
                if (index == addresses.length) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        print("Add New Address pressed");
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.2,
                          ),
                        ),
                        child:  Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                "Add New Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                final item = addresses[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading:  Icon(Icons.location_on_outlined),
                      title: Row(
                        children: [
                          Text(item['label'] ?? ""),
                          if (item['default'] == "true")
                            Container(
                              margin:  EdgeInsets.only(left: 8),
                              padding:  EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey.shade300,
                              ),
                              child:  Text(
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
           SizedBox(height: 16),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
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
                  final selected = addresses[selectedAddressIndex];
                  print("Selected Address: ${selected['label']} - ${selected['address']}");
                },
                child:  Text(
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

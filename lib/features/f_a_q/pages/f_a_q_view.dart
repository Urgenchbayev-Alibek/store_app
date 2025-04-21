import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/bottom_nav_bar.dart';
import '../../../core/routing/routes.dart';

class FAQsView extends StatefulWidget {
  const FAQsView({super.key});

  @override
  State<FAQsView> createState() => _FAQsViewState();
}

class _FAQsViewState extends State<FAQsView> {
  String selectedTab = "General";

  final Map<String, List<Map<String, String>>> faqData = {
    "General": [
      {
        "question": "How do I make a purchase?",
        "answer":
        "To make a purchase, tap on the product, check the details and tap 'Add to Cart'..."
      },
      {
        "question": "What is your return policy?",
        "answer":
        "You can return items within 14 days of delivery. Ensure the product is unused."
      },
    ],
    "Account": [
      {
        "question": "How do I create an account?",
        "answer":
        "Go to the sign-up screen, enter your information and tap 'Register'."
      },
      {
        "question": "How do I reset my password?",
        "answer":
        "On login screen, tap 'Forgot Password' and follow the instructions."
      },
    ],
    "Service": [
      {
        "question": "Do you offer customer support?",
        "answer": "Yes, 24/7 support is available through live chat or email."
      },
    ],
    "Payment": [
      {
        "question": "What payment methods are accepted?",
        "answer":
        "We accept Visa, MasterCard, PayPal and local bank cards."
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final selectedFAQList = faqData[selectedTab] ?? [];

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("FAQs", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab bar (General, Account, etc.)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                for (var tab in faqData.keys)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = tab;
                        });
                      },
                      child: _TabItem(
                        title: tab,
                        isSelected: selectedTab == tab,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for questions...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic_none),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // FAQ List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: selectedFAQList.length,
              itemBuilder: (context, index) {
                final faq = selectedFAQList[index];
                return _FAQItem(
                  question: faq['question'] ?? '',
                  answer: faq['answer'] ?? '',
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 4,
        onTap: (index) {
          switch (index) {
            case 0:
              context.push(Routes.home);
              break;
            case 1:
              context.push(Routes.search);
              break;
            case 2:
              context.push(Routes.saved);
              break;
            case 3:
              context.push(Routes.myCart);
              break;
            case 4:
              context.push(Routes.account);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const _TabItem({required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade300,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        onExpansionChanged: (val) {
          setState(() {
            isExpanded = val;
          });
        },
        title: Text(
          widget.question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.answer,
              style: const TextStyle(color: Colors.black87, height: 1.4 ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

///Dreams Details Page အတွက် widget class
class DreamsDetailsPage extends StatelessWidget {
  const DreamsDetailsPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _DreamsDetailsSearchAndListView(),
    );
  }
}

///Dream List နဲ့ Search View အတွက် widget class
class _DreamsDetailsSearchAndListView extends StatelessWidget {
  const _DreamsDetailsSearchAndListView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: _DreamsListView(),
          ),
        ],
      ),
    );
  }
}

///Data Search လို့ မတွေ့ရင် ပေါ်မယ့် widget class
class _DataNotFoundView extends StatelessWidget {
  const _DataNotFoundView();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('images/not_found.png'),
        Text(
          'Not Found',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

///Scrollable Dream List View တွေအတွက် widget class
class _DreamsListView extends StatelessWidget {
  const _DreamsListView();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return _DreamsItemView();
      },
      itemCount: 10,
      separatorBuilder: (_, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}

///ListView ထဲက Dream Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _DreamsItemView extends StatelessWidget {
  const _DreamsItemView();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.pageview),
      title: const Text('This is Title'),
      subtitle: const Text('Explore more'),
      trailing: const Icon(Icons.arrow_circle_right),
    );
  }
}

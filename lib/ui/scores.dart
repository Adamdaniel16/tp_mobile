import 'package:flutter/material.dart';
import '../sharedpref.dart';

class PageScores extends StatelessWidget {
  const PageScores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF243B57),
      appBar: AppBar(
          title: const Text('LES SCORES',
            style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold)
            ,),
        backgroundColor: const Color(0xFF969696),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFD6D6D6),
              ),
              width: 300,
              height: 500,
              padding: const EdgeInsets.all(40.0),
              child: FutureBuilder<List<Tuple3<int, String, int>>>(
                future: SharedPrefUtils.getAllData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final dataList = snapshot.data!;
                    return Column(
                      children: dataList.map(_buildScoreEntry).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error fetching scores: ${snapshot.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreEntry(Tuple3<int, String, int> data) {
    const style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${data.position}. ',
              style: style),
          Text(data.name,
              style: style),
          const Spacer(),
          Text('${data.niveau}',
              style: style),
        ],
      ),
    );
  }

}

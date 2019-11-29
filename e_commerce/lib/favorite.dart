<<<<<<< HEAD
/* import 'home.dart';
=======
/*import 'home.dart';
>>>>>>> Hugo
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  
}
@override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: AppBar(
      title: Text('Startup Name Generator'),
      actions: <Widget>[      
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],  
    ),
    body: _buildSuggestions(),
  );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);  
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),trailing: Icon(   
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.blue : null,
    ),onTap: () {      
      setState(() {
        if (alreadySaved) {
          _saved.remove(pair);
        } else { 
          _saved.add(pair); 
        } 
      });
    }, 
    );
  }
<<<<<<< HEAD
} */
=======
}*/
>>>>>>> Hugo

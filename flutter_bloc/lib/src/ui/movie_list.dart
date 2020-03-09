import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/blocs/movies_bloc.dart';
import 'package:flutter_bloc/src/models/item_model.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot){
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        }
        ),
    );
  }
}

Widget buildList(AsyncSnapshot<ItemModel> snapshot){
  return GridView.builder(
    itemCount: snapshot.data.results.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridTile(child: InkResponse(
          enableFeedback: true,
          child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data
                      .results[index].poster_path}',
                      fit: BoxFit.cover,),
          onTap: () {
            final snackBar = SnackBar(content: Text('Not yet'));
            return Scaffold.of(context).showSnackBar(snackBar);
          }      
        ),
        
        ),
      );
    }
    );
}
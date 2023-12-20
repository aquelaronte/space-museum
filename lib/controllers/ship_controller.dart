import 'package:space_museum/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:space_museum/models/ship_model.dart';

class ShipController {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  final GraphQLClient _client = graphQLConfig.clientToQuery();

  Future<List<ShipModel>> getShips() async {
    try {
      QueryResult result = await _client.query(QueryOptions(document: gql("""
      query Ships {
        ships {
          active
          class
          home_port
          id
          image
          name
          roles
          type
          year_built
        }
      }
      """), fetchPolicy: FetchPolicy.noCache));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['ships'];

      if (res == null || res.isEmpty) {
        return [];
      }

      List<ShipModel> ship =
          res.map((capsule) => ShipModel.fromMap(map: capsule)).toList();

      return ship;
    } catch (error) {
      throw Exception(error);
    }
  }
}

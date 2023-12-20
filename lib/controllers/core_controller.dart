import 'package:space_museum/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:space_museum/models/core_model.dart';

class CoreController {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  final GraphQLClient _client = graphQLConfig.clientToQuery();

  Future<List<CoreModel>> getCores() async {
    try {
      QueryResult result = await _client.query(QueryOptions(document: gql("""
      query Cores {
        cores {
          id
          block
          status
          reuse_count
        }
      }
      """), fetchPolicy: FetchPolicy.noCache));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['cores'];

      if (res == null || res.isEmpty) {
        return [];
      }

      List<CoreModel> cores =
          res.map((capsule) => CoreModel.fromMap(map: capsule)).toList();

      return cores;
    } catch (error) {
      throw Exception(error);
    }
  }
}

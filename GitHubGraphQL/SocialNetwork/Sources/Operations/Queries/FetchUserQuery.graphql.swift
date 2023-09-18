// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FetchUserQuery: GraphQLQuery {
  public static let operationName: String = "fetchUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"""
      query fetchUser($id: ID!) {
        user(id: $id) {
          __typename
          id
          username
          email
          address {
            __typename
            geo {
              __typename
              lat
              lng
            }
          }
        }
      }
      """#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: SocialNetwork.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SocialNetwork.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("user", User?.self, arguments: ["id": .variable("id")]),
    ] }

    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: SocialNetwork.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SocialNetwork.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", SocialNetwork.ID?.self),
        .field("username", String?.self),
        .field("email", String?.self),
        .field("address", Address?.self),
      ] }

      public var id: SocialNetwork.ID? { __data["id"] }
      public var username: String? { __data["username"] }
      public var email: String? { __data["email"] }
      public var address: Address? { __data["address"] }

      /// User.Address
      ///
      /// Parent Type: `Address`
      public struct Address: SocialNetwork.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SocialNetwork.Objects.Address }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("geo", Geo?.self),
        ] }

        public var geo: Geo? { __data["geo"] }

        /// User.Address.Geo
        ///
        /// Parent Type: `Geo`
        public struct Geo: SocialNetwork.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SocialNetwork.Objects.Geo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("lat", Double?.self),
            .field("lng", Double?.self),
          ] }

          public var lat: Double? { __data["lat"] }
          public var lng: Double? { __data["lng"] }
        }
      }
    }
  }
}

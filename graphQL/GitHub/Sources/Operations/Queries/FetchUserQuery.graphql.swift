// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FetchUserQuery: GraphQLQuery {
  public static let operationName: String = "FetchUser"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FetchUser($login: String!) {
        user(login: $login) {
          __typename
          bio
          email
          name
          location
        }
      }
      """#
    ))

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var __variables: Variables? { ["login": login] }

  public struct Data: GitHub.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHub.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("user", User?.self, arguments: ["login": .variable("login")]),
    ] }

    /// Lookup a user by login.
    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: GitHub.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHub.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("bio", String?.self),
        .field("email", String.self),
        .field("name", String?.self),
        .field("location", String?.self),
      ] }

      /// The user's public profile bio.
      public var bio: String? { __data["bio"] }
      /// The user's publicly visible profile email.
      public var email: String { __data["email"] }
      /// The user's public profile name.
      public var name: String? { __data["name"] }
      /// The user's public profile location.
      public var location: String? { __data["location"] }
    }
  }
}

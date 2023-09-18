// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateUserStatusMutation: GraphQLMutation {
  public static let operationName: String = "UpdateUserStatus"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation UpdateUserStatus($input: ChangeUserStatusInput!) {
        changeUserStatus(input: $input) {
          __typename
          status {
            __typename
            message
            emoji
          }
        }
      }
      """#
    ))

  public var input: ChangeUserStatusInput

  public init(input: ChangeUserStatusInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: GitHub.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHub.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("changeUserStatus", ChangeUserStatus?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Update your status on GitHub.
    public var changeUserStatus: ChangeUserStatus? { __data["changeUserStatus"] }

    /// ChangeUserStatus
    ///
    /// Parent Type: `ChangeUserStatusPayload`
    public struct ChangeUserStatus: GitHub.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHub.Objects.ChangeUserStatusPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Status?.self),
      ] }

      /// Your updated status.
      public var status: Status? { __data["status"] }

      /// ChangeUserStatus.Status
      ///
      /// Parent Type: `UserStatus`
      public struct Status: GitHub.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHub.Objects.UserStatus }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("message", String?.self),
          .field("emoji", String?.self),
        ] }

        /// A brief message describing what the user is doing.
        public var message: String? { __data["message"] }
        /// An emoji summarizing the user's status.
        public var emoji: String? { __data["emoji"] }
      }
    }
  }
}

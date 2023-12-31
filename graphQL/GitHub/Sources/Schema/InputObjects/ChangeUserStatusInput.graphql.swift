// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Autogenerated input type of ChangeUserStatus
public struct ChangeUserStatusInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    emoji: GraphQLNullable<String> = nil,
    message: GraphQLNullable<String> = nil,
    organizationId: GraphQLNullable<ID> = nil,
    limitedAvailability: GraphQLNullable<Bool>,
    expiresAt: GraphQLNullable<DateTime> = nil,
    clientMutationId: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "emoji": emoji,
      "message": message,
      "organizationId": organizationId,
      "limitedAvailability": limitedAvailability,
      "expiresAt": expiresAt,
      "clientMutationId": clientMutationId
    ])
  }

  /// The emoji to represent your status. Can either be a native Unicode emoji or an emoji name with colons, e.g., :grinning:.
  public var emoji: GraphQLNullable<String> {
    get { __data["emoji"] }
    set { __data["emoji"] = newValue }
  }

  /// A short description of your current status.
  public var message: GraphQLNullable<String> {
    get { __data["message"] }
    set { __data["message"] = newValue }
  }

  /// The ID of the organization whose members will be allowed to see the status. If omitted, the status will be publicly visible.
  public var organizationId: GraphQLNullable<ID> {
    get { __data["organizationId"] }
    set { __data["organizationId"] = newValue }
  }

  /// Whether this status should indicate you are not fully available on GitHub, e.g., you are away.
  public var limitedAvailability: GraphQLNullable<Bool> {
    get { __data["limitedAvailability"] }
    set { __data["limitedAvailability"] = newValue }
  }

  /// If set, the user status will not be shown after this date.
  public var expiresAt: GraphQLNullable<DateTime> {
    get { __data["expiresAt"] }
    set { __data["expiresAt"] = newValue }
  }

  /// A unique identifier for the client performing the mutation.
  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }
}

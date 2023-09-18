// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHub.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHub.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHub.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHub.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return GitHub.Objects.Query
    case "User": return GitHub.Objects.User
    case "AddedToMergeQueueEvent": return GitHub.Objects.AddedToMergeQueueEvent
    case "AddedToProjectEvent": return GitHub.Objects.AddedToProjectEvent
    case "App": return GitHub.Objects.App
    case "AssignedEvent": return GitHub.Objects.AssignedEvent
    case "AutoMergeDisabledEvent": return GitHub.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GitHub.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GitHub.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GitHub.Objects.AutoSquashEnabledEvent
    case "AutomaticBaseChangeFailedEvent": return GitHub.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GitHub.Objects.AutomaticBaseChangeSucceededEvent
    case "BaseRefChangedEvent": return GitHub.Objects.BaseRefChangedEvent
    case "BaseRefDeletedEvent": return GitHub.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GitHub.Objects.BaseRefForcePushedEvent
    case "Blob": return GitHub.Objects.Blob
    case "Commit": return GitHub.Objects.Commit
    case "Discussion": return GitHub.Objects.Discussion
    case "Issue": return GitHub.Objects.Issue
    case "PullRequest": return GitHub.Objects.PullRequest
    case "CommitComment": return GitHub.Objects.CommitComment
    case "DiscussionComment": return GitHub.Objects.DiscussionComment
    case "GistComment": return GitHub.Objects.GistComment
    case "IssueComment": return GitHub.Objects.IssueComment
    case "PullRequestReview": return GitHub.Objects.PullRequestReview
    case "PullRequestReviewComment": return GitHub.Objects.PullRequestReviewComment
    case "CommitCommentThread": return GitHub.Objects.CommitCommentThread
    case "DependabotUpdate": return GitHub.Objects.DependabotUpdate
    case "DiscussionCategory": return GitHub.Objects.DiscussionCategory
    case "PinnedDiscussion": return GitHub.Objects.PinnedDiscussion
    case "PullRequestCommitCommentThread": return GitHub.Objects.PullRequestCommitCommentThread
    case "RepositoryVulnerabilityAlert": return GitHub.Objects.RepositoryVulnerabilityAlert
    case "Release": return GitHub.Objects.Release
    case "Bot": return GitHub.Objects.Bot
    case "EnterpriseUserAccount": return GitHub.Objects.EnterpriseUserAccount
    case "Mannequin": return GitHub.Objects.Mannequin
    case "Organization": return GitHub.Objects.Organization
    case "Repository": return GitHub.Objects.Repository
    case "Gist": return GitHub.Objects.Gist
    case "Topic": return GitHub.Objects.Topic
    case "Team": return GitHub.Objects.Team
    case "Enterprise": return GitHub.Objects.Enterprise
    case "CheckRun": return GitHub.Objects.CheckRun
    case "StatusContext": return GitHub.Objects.StatusContext
    case "ClosedEvent": return GitHub.Objects.ClosedEvent
    case "ConvertToDraftEvent": return GitHub.Objects.ConvertToDraftEvent
    case "CrossReferencedEvent": return GitHub.Objects.CrossReferencedEvent
    case "MergedEvent": return GitHub.Objects.MergedEvent
    case "Milestone": return GitHub.Objects.Milestone
    case "PullRequestCommit": return GitHub.Objects.PullRequestCommit
    case "ReadyForReviewEvent": return GitHub.Objects.ReadyForReviewEvent
    case "RepositoryTopic": return GitHub.Objects.RepositoryTopic
    case "ReviewDismissedEvent": return GitHub.Objects.ReviewDismissedEvent
    case "TeamDiscussion": return GitHub.Objects.TeamDiscussion
    case "TeamDiscussionComment": return GitHub.Objects.TeamDiscussionComment
    case "Workflow": return GitHub.Objects.Workflow
    case "WorkflowRun": return GitHub.Objects.WorkflowRun
    case "WorkflowRunFile": return GitHub.Objects.WorkflowRunFile
    case "Project": return GitHub.Objects.Project
    case "ProjectV2": return GitHub.Objects.ProjectV2
    case "Tag": return GitHub.Objects.Tag
    case "Tree": return GitHub.Objects.Tree
    case "BranchProtectionRule": return GitHub.Objects.BranchProtectionRule
    case "BypassForcePushAllowance": return GitHub.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GitHub.Objects.BypassPullRequestAllowance
    case "CWE": return GitHub.Objects.CWE
    case "CheckSuite": return GitHub.Objects.CheckSuite
    case "CodeOfConduct": return GitHub.Objects.CodeOfConduct
    case "CommentDeletedEvent": return GitHub.Objects.CommentDeletedEvent
    case "Comparison": return GitHub.Objects.Comparison
    case "ConnectedEvent": return GitHub.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GitHub.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GitHub.Objects.ConvertedToDiscussionEvent
    case "DemilestonedEvent": return GitHub.Objects.DemilestonedEvent
    case "DeployKey": return GitHub.Objects.DeployKey
    case "DeployedEvent": return GitHub.Objects.DeployedEvent
    case "Deployment": return GitHub.Objects.Deployment
    case "DeploymentEnvironmentChangedEvent": return GitHub.Objects.DeploymentEnvironmentChangedEvent
    case "DeploymentReview": return GitHub.Objects.DeploymentReview
    case "DeploymentStatus": return GitHub.Objects.DeploymentStatus
    case "DisconnectedEvent": return GitHub.Objects.DisconnectedEvent
    case "DiscussionPoll": return GitHub.Objects.DiscussionPoll
    case "DiscussionPollOption": return GitHub.Objects.DiscussionPollOption
    case "DraftIssue": return GitHub.Objects.DraftIssue
    case "EnterpriseAdministratorInvitation": return GitHub.Objects.EnterpriseAdministratorInvitation
    case "EnterpriseIdentityProvider": return GitHub.Objects.EnterpriseIdentityProvider
    case "EnterpriseRepositoryInfo": return GitHub.Objects.EnterpriseRepositoryInfo
    case "EnterpriseServerInstallation": return GitHub.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GitHub.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GitHub.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GitHub.Objects.EnterpriseServerUserAccountsUpload
    case "Environment": return GitHub.Objects.Environment
    case "ExternalIdentity": return GitHub.Objects.ExternalIdentity
    case "HeadRefDeletedEvent": return GitHub.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GitHub.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GitHub.Objects.HeadRefRestoredEvent
    case "IpAllowListEntry": return GitHub.Objects.IpAllowListEntry
    case "Label": return GitHub.Objects.Label
    case "LabeledEvent": return GitHub.Objects.LabeledEvent
    case "Language": return GitHub.Objects.Language
    case "License": return GitHub.Objects.License
    case "LinkedBranch": return GitHub.Objects.LinkedBranch
    case "LockedEvent": return GitHub.Objects.LockedEvent
    case "MarkedAsDuplicateEvent": return GitHub.Objects.MarkedAsDuplicateEvent
    case "MarketplaceCategory": return GitHub.Objects.MarketplaceCategory
    case "MarketplaceListing": return GitHub.Objects.MarketplaceListing
    case "MembersCanDeleteReposClearAuditEntry": return GitHub.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GitHub.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GitHub.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GitHub.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GitHub.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessBlockedAuditEntry": return GitHub.Objects.OrgOauthAppAccessBlockedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GitHub.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GitHub.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgOauthAppAccessUnblockedAuditEntry": return GitHub.Objects.OrgOauthAppAccessUnblockedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GitHub.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GitHub.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GitHub.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHub.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHub.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GitHub.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHub.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GitHub.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GitHub.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHub.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GitHub.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GitHub.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GitHub.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GitHub.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GitHub.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GitHub.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHub.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GitHub.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHub.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GitHub.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHub.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GitHub.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHub.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHub.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GitHub.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHub.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GitHub.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GitHub.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GitHub.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GitHub.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GitHub.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GitHub.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GitHub.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHub.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHub.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHub.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHub.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHub.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHub.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHub.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHub.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHub.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHub.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GitHub.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GitHub.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GitHub.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GitHub.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHub.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GitHub.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GitHub.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GitHub.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GitHub.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GitHub.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GitHub.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "MentionedEvent": return GitHub.Objects.MentionedEvent
    case "MergeQueue": return GitHub.Objects.MergeQueue
    case "MergeQueueEntry": return GitHub.Objects.MergeQueueEntry
    case "MigrationSource": return GitHub.Objects.MigrationSource
    case "MilestonedEvent": return GitHub.Objects.MilestonedEvent
    case "MovedColumnsInProjectEvent": return GitHub.Objects.MovedColumnsInProjectEvent
    case "OIDCProvider": return GitHub.Objects.OIDCProvider
    case "OrganizationIdentityProvider": return GitHub.Objects.OrganizationIdentityProvider
    case "OrganizationInvitation": return GitHub.Objects.OrganizationInvitation
    case "OrganizationMigration": return GitHub.Objects.OrganizationMigration
    case "Package": return GitHub.Objects.Package
    case "PackageFile": return GitHub.Objects.PackageFile
    case "PackageTag": return GitHub.Objects.PackageTag
    case "PackageVersion": return GitHub.Objects.PackageVersion
    case "PinnedEvent": return GitHub.Objects.PinnedEvent
    case "PinnedIssue": return GitHub.Objects.PinnedIssue
    case "ProjectCard": return GitHub.Objects.ProjectCard
    case "ProjectColumn": return GitHub.Objects.ProjectColumn
    case "ProjectV2Field": return GitHub.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GitHub.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GitHub.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GitHub.Objects.ProjectV2Item
    case "ProjectV2ItemFieldDateValue": return GitHub.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GitHub.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GitHub.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GitHub.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GitHub.Objects.ProjectV2ItemFieldTextValue
    case "ProjectV2View": return GitHub.Objects.ProjectV2View
    case "ProjectV2Workflow": return GitHub.Objects.ProjectV2Workflow
    case "PublicKey": return GitHub.Objects.PublicKey
    case "PullRequestReviewThread": return GitHub.Objects.PullRequestReviewThread
    case "PullRequestThread": return GitHub.Objects.PullRequestThread
    case "Push": return GitHub.Objects.Push
    case "PushAllowance": return GitHub.Objects.PushAllowance
    case "Reaction": return GitHub.Objects.Reaction
    case "Ref": return GitHub.Objects.Ref
    case "ReferencedEvent": return GitHub.Objects.ReferencedEvent
    case "ReleaseAsset": return GitHub.Objects.ReleaseAsset
    case "RemovedFromMergeQueueEvent": return GitHub.Objects.RemovedFromMergeQueueEvent
    case "RemovedFromProjectEvent": return GitHub.Objects.RemovedFromProjectEvent
    case "RenamedTitleEvent": return GitHub.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GitHub.Objects.ReopenedEvent
    case "RepositoryInvitation": return GitHub.Objects.RepositoryInvitation
    case "RepositoryMigration": return GitHub.Objects.RepositoryMigration
    case "RepositoryRule": return GitHub.Objects.RepositoryRule
    case "RepositoryRuleset": return GitHub.Objects.RepositoryRuleset
    case "RepositoryRulesetBypassActor": return GitHub.Objects.RepositoryRulesetBypassActor
    case "ReviewDismissalAllowance": return GitHub.Objects.ReviewDismissalAllowance
    case "ReviewRequest": return GitHub.Objects.ReviewRequest
    case "ReviewRequestRemovedEvent": return GitHub.Objects.ReviewRequestRemovedEvent
    case "ReviewRequestedEvent": return GitHub.Objects.ReviewRequestedEvent
    case "SavedReply": return GitHub.Objects.SavedReply
    case "SecurityAdvisory": return GitHub.Objects.SecurityAdvisory
    case "SponsorsActivity": return GitHub.Objects.SponsorsActivity
    case "SponsorsListing": return GitHub.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GitHub.Objects.SponsorsListingFeaturedItem
    case "SponsorsTier": return GitHub.Objects.SponsorsTier
    case "Sponsorship": return GitHub.Objects.Sponsorship
    case "SponsorshipNewsletter": return GitHub.Objects.SponsorshipNewsletter
    case "Status": return GitHub.Objects.Status
    case "StatusCheckRollup": return GitHub.Objects.StatusCheckRollup
    case "SubscribedEvent": return GitHub.Objects.SubscribedEvent
    case "TransferredEvent": return GitHub.Objects.TransferredEvent
    case "UnassignedEvent": return GitHub.Objects.UnassignedEvent
    case "UnlabeledEvent": return GitHub.Objects.UnlabeledEvent
    case "UnlockedEvent": return GitHub.Objects.UnlockedEvent
    case "UnmarkedAsDuplicateEvent": return GitHub.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GitHub.Objects.UnpinnedEvent
    case "UnsubscribedEvent": return GitHub.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GitHub.Objects.UserBlockedEvent
    case "UserContentEdit": return GitHub.Objects.UserContentEdit
    case "UserStatus": return GitHub.Objects.UserStatus
    case "VerifiableDomain": return GitHub.Objects.VerifiableDomain
    case "Mutation": return GitHub.Objects.Mutation
    case "ChangeUserStatusPayload": return GitHub.Objects.ChangeUserStatusPayload
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}

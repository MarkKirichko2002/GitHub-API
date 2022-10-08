//
//  Model.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation

// MARK: - User
struct User: Identifiable, Codable {
    let owner: Owner?
    let login: String!
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    let name, company: String?
    let blog: String?
    let location: String?
    let email, hireable, bio: String?
    let twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case owner
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name, company, blog, location, email, hireable, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - RepoElement
struct Repo: Identifiable, Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let repoPrivate: Bool?
    let owner: Owner?
    let htmlURL: String?
    let repoDescription: String?
    let fork: Bool?
    let url: String?
    let forksURL: String?
    let keysURL, collaboratorsURL: String?
    let teamsURL, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    let deploymentsURL: String?
    let createdAt, updatedAt, pushedAt: String?
    let gitURL, sshURL: String?
    let cloneURL: String?
    let svnURL: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorURL: String?
    let archived, disabled: Bool?
    let openIssuesCount: Int?
    //let license: License?
    let allowForking, isTemplate, webCommitSignoffRequired: Bool?
    let topics: [String]?
    let visibility: String?
    let forks, openIssues, watchers: Int?
    //let defaultBranch: DefaultBranch?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case repoPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case repoDescription = "description"
        case fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived, disabled
        case openIssuesCount = "open_issues_count"
        //case license
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics, visibility, forks
        case openIssues = "open_issues"
        case watchers
        //case defaultBranch = "default_branch"
    }
}


enum DefaultBranch: String, Codable {
    case ghPages = "gh-pages"
    case master = "master"
}

// MARK: - License
struct License: Codable {
    let key: Key?
    let name: Name?
    let spdxID: SpdxID?
    let url: String?
    let nodeID: LicenseNodeID?

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}

enum Key: String, Codable {
    case mit = "mit"
    case other = "other"
}

enum Name: String, Codable {
    case mitLicense = "MIT License"
    case other = "Other"
}

enum LicenseNodeID: String, Codable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTEz = "MDc6TGljZW5zZTEz"
}

enum SpdxID: String, Codable {
    case mit = "MIT"
    case noassertion = "NOASSERTION"
}

// MARK: - Owner
struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL: String?
    let gistsURL: String?
    let starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

struct Commit: Identifiable,Codable {
    let id = UUID()
    let sha, nodeID: String?
    let commit: CommitClass?
    let url, htmlURL, commentsURL: String?
    let author, committer: CommitAuthor?
    let parents: [Parent]?

    enum CodingKeys: String, CodingKey {
        case sha
        case nodeID = "node_id"
        case commit, url
        case htmlURL = "html_url"
        case commentsURL = "comments_url"
        case author, committer, parents
    }
}

// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

// MARK: - CommitClass
struct CommitClass: Codable {
    let author, committer: CommitAuthorClass?
    let message: String?
    let tree: Tree?
    let url: String?
    let commentCount: Int?
    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case author, committer, message, tree, url
        case commentCount = "comment_count"
        case verification
    }
}

// MARK: - CommitAuthorClass
struct CommitAuthorClass: Codable {
    let name, email: String?
    let date: String?
}

// MARK: - Tree
struct Tree: Codable {
    let sha: String?
    let url: String?
}

// MARK: - Verification
struct Verification: Codable {
    let verified: Bool?
    let reason: String?
}

// MARK: - Parent
struct Parent: Codable {
    let sha: String?
    let url, htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case sha, url
        case htmlURL = "html_url"
    }
}

// MARK: - Branch
struct Branch: Identifiable, Codable {
    let id = UUID()
    let name: String
    let commit: CommitValue
    let protected: Bool
}

// MARK: - Commit
struct CommitValue: Codable {
    let sha: String
    let url: String
}


// MARK: - Event
struct Event: Identifiable,Codable {
    let id, type: String?
    let actor: Actor?
    let eventPublic: Bool?
    let createdAt: String?
    let org: Actor?

    enum CodingKeys: String, CodingKey {
        case id, type, actor
        case eventPublic = "public"
        case createdAt = "created_at"
        case org
    }
}

// MARK: - Actor
struct Actor: Codable {
    let id: Int?
    let login: String?
    let displayLogin: String?
    let gravatarID: String?
    let url, avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case id, login
        case displayLogin = "display_login"
        case gravatarID = "gravatar_id"
        case url
        case avatarURL = "avatar_url"
    }
}


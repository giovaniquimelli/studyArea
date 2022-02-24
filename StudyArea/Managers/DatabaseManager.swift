//
//  DatabaseManager.swift
//  StudyArea
//
//  Created by Gio on 02/02/22.
//

import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()

//    private let database = Firestore.firestore()

    private init() {}

//    public func insert(
//        blogPost: BlogPost,
//        email: String,
//        completion: @escaping (Bool) -> Void
//    ) {
//        let userEmail = email
//            .replacingOccurrences(of: ".", with: "_")
//            .replacingOccurrences(of: "@", with: "_")
//
//        let data: [String: Any] = [
//            "id": blogPost.identifier,
//            "title": blogPost.title,
//            "body": blogPost.text,
//            "created": blogPost.timestamp,
//            "headerImageUrl": blogPost.headerImageUrl?.absoluteString ?? ""
//        ]
//
//        database
//            .collection("users")
//            .document(userEmail)
//            .collection("posts")
//            .document(blogPost.identifier)
//            .setData(data) { error in
//                completion(error == nil)
//            }
//    }

    public func getAllPosts(
        completion: @escaping ([StudyArea]) -> Void
    ) {
//        database
//            .collection("users")
//            .getDocuments { [weak self] snapshot, error in
//                guard let documents = snapshot?.documents.compactMap({ $0.data() }),
//                      error == nil else {
//                    return
//                }

//                let emails: [String] = documents.compactMap({ $0["email"] as? String })
//                print(emails)
//                guard !emails.isEmpty else {
//                    completion([])
//                    return
//                }

//                let group = DispatchGroup()
                let result: [StudyArea] = [
                    StudyArea(identifier: "1", room: "03", subject: "Math", teacher: "Jorge", queue: "queue: 2"),
                    StudyArea(identifier: "2", room: "05", subject: "Portuguese", teacher: "Mateus", queue: "queue: 7"),
                    StudyArea(identifier: "3", room: "08", subject: "Geography", teacher: "Ana", queue: "queue: 1")
                ]

//                for email in emails {
//                    group.enter()
//                    self?.getPosts(for: email) { userPosts in
//                        defer {
//                            group.leave()
//                        }
//                        result.append(contentsOf: userPosts)
//                    }
//                }
//
//                group.notify(queue: .global()) {
//                    print("Feed posts: \(result.count)")
                    completion(result)
//                }
//            }
    }
    
    public func getAllMessages(
        completion: @escaping ([Messages]) -> Void
    ) {
//        database
//            .collection("users")
//            .getDocuments { [weak self] snapshot, error in
//                guard let documents = snapshot?.documents.compactMap({ $0.data() }),
//                      error == nil else {
//                    return
//                }

//                let emails: [String] = documents.compactMap({ $0["email"] as? String })
//                print(emails)
//                guard !emails.isEmpty else {
//                    completion([])
//                    return
//                }

//                let group = DispatchGroup()
                let result: [Messages] = [
                    Messages(text: "Math - Teacher Jorge", sender: MessageSender.system),
                    Messages(text: "Queue: 2...", sender: MessageSender.system),
                    Messages(text: "Queue: 1...", sender: MessageSender.system),
                    Messages(text: "Session initiated!", sender: MessageSender.system),
                    Messages(text: "Good morning! What can I help you with?", sender: MessageSender.teacher),
                    Messages(text: "Good morning teacher Jorge...", sender: MessageSender.student),
                ]

//                for email in emails {
//                    group.enter()
//                    self?.getPosts(for: email) { userPosts in
//                        defer {
//                            group.leave()
//                        }
//                        result.append(contentsOf: userPosts)
//                    }
//                }
//
//                group.notify(queue: .global()) {
//                    print("Feed posts: \(result.count)")
                    completion(result)
//                }
//            }
    }

//    public func getPosts(
//        for email: String,
//        completion: @escaping ([BlogPost]) -> Void
//    ) {
//        let userEmail = email
//            .replacingOccurrences(of: ".", with: "_")
//            .replacingOccurrences(of: "@", with: "_")
//        database
//            .collection("users")
//            .document(userEmail)
//            .collection("posts")
//            .getDocuments { snapshot, error in
//                guard let documents = snapshot?.documents.compactMap({ $0.data() }),
//                      error == nil else {
//                    return
//                }
//
//                let posts: [BlogPost] = documents.compactMap({ dictionary in
//                    guard let id = dictionary["id"] as? String,
//                          let title = dictionary["title"] as? String,
//                          let body = dictionary["body"] as? String,
//                          let created = dictionary["created"] as? TimeInterval,
//                          let imageUrlString = dictionary["headerImageUrl"] as? String else {
//                        print("Invalid post fetch conversion")
//                        return nil
//                    }
//
//                    let post = BlogPost(
//                        identifier: id,
//                        title: title,
//                        timestamp: created,
//                        headerImageUrl: URL(string: imageUrlString),
//                        text: body
//                    )
//                    return post
//                })
//
//                completion(posts)
//            }
//    }
//
//    public func insert(
//        user: User,
//        completion: @escaping (Bool) -> Void
//    ) {
//        let documentId = user.email
//            .replacingOccurrences(of: ".", with: "_")
//            .replacingOccurrences(of: "@", with: "_")
//
//        let data = [
//            "email": user.email,
//            "name": user.name
//        ]
//
//        database
//            .collection("users")
//            .document(documentId)
//            .setData(data) { error in
//                completion(error == nil)
//            }
//    }
//
//    public func getUser(
//        email: String,
//        completion: @escaping (User?) -> Void
//    ) {
//        let documentId = email
//            .replacingOccurrences(of: ".", with: "_")
//            .replacingOccurrences(of: "@", with: "_")
//
//        database
//            .collection("users")
//            .document(documentId)
//            .getDocument { snapshot, error in
//                guard let data = snapshot?.data() as? [String: String],
//                      let name = data["name"],
//                      error == nil else {
//                    return
//                }
//
//                let ref = data["profile_photo"]
//                let user = User(name: name, email: email, profilePictureRef: ref)
//                completion(user)
//            }
//    }
//
//    func updateProfilePhoto(
//        email: String,
//        completion: @escaping (Bool) -> Void
//    ) {
//        let path = email
//            .replacingOccurrences(of: "@", with: "_")
//            .replacingOccurrences(of: ".", with: "_")
//
//        let photoReference = "profile_pictures/\(path)/photo.png"
//
//        let dbRef = database
//            .collection("users")
//            .document(path)
//
//        dbRef.getDocument { snapshot, error in
//            guard var data = snapshot?.data(), error == nil else {
//                return
//            }
//            data["profile_photo"] = photoReference
//
//            dbRef.setData(data) { error in
//                completion(error == nil)
//            }
//        }
//
//    }
}

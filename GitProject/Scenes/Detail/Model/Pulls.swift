/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Pulls: Decodable {
	let url: String?
	let identy: Int?
	let nodeId: String?
	let htmlUrl: String?
	let diffUrl: String?
	let patchUrl: String?
	let issueUrl: String?
	let number: Int?
	let user: User?
	let body: String?
	let authorAssociation: String?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case identy = "id"
		case nodeId = "node_id"
		case htmlUrl = "html_url"
		case diffUrl = "diff_url"
		case patchUrl = "patch_url"
		case issueUrl = "issue_url"
		case number = "number"
		case user = "user"
		case body = "body"
		case authorAssociation = "author_association"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		identy = try values.decodeIfPresent(Int.self, forKey: .identy)
		nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		diffUrl = try values.decodeIfPresent(String.self, forKey: .diffUrl)
		patchUrl = try values.decodeIfPresent(String.self, forKey: .patchUrl)
		issueUrl = try values.decodeIfPresent(String.self, forKey: .issueUrl)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		user = try values.decodeIfPresent(User.self, forKey: .user)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		authorAssociation = try values.decodeIfPresent(String.self, forKey: .authorAssociation)
	}

}

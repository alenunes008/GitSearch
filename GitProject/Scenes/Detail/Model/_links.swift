/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Links: Codable {
	let html: Html?
	let issue: Issue?
	let comments: Comments?
	let reviewComments: ReviewComments?
	let reviewComment: ReviewComment?
	let commits: Commits?
    let statUses: Statuses?

	enum CodingKeys: String, CodingKey {

		case html
		case issue
		case comments
		case reviewComments = "review_comments"
		case reviewComment = "review_comment"
		case commits
		case statUses = "statuses"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		html = try values.decodeIfPresent(Html.self, forKey: .html)
		issue = try values.decodeIfPresent(Issue.self, forKey: .issue)
		comments = try values.decodeIfPresent(Comments.self, forKey: .comments)
		reviewComments = try values.decodeIfPresent(ReviewComments.self, forKey: .reviewComments)
		reviewComment = try values.decodeIfPresent(ReviewComment.self, forKey: .reviewComment)
		commits = try values.decodeIfPresent(Commits.self, forKey: .commits)
		statUses = try values.decodeIfPresent(Statuses.self, forKey: .statUses)
	}

}

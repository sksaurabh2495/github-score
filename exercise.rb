require 'net/http'
require 'uri'
require 'json'

github_user = 'dhh'
score = 0

def open(url)
  Net::HTTP.get(URI.parse(url))
end

page_content = JSON.parse(open('https://api.github.com/users/' + github_user + '/events/public'))

for i in page_content do
	case i['type']
		when 'IssuesEvent'
		score += 7
		when 'IssueCommentEvent'
		score += 6
		when 'PushEvent'
		score += 5
		when 'PullRequestReviewCommentEvent'
		score += 4
		when 'WatchEvent'
		score += 3
		when 'CreateEvent'
		score += 2
		else
		score += 1
		end
end

puts "#{github_user}'s github score is #{score}"
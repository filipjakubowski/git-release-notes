# require 'json'
#
# module GitReleaseNotes
#   class JiraIssue
#     def initialize(json)
#       puts "JSON"
#       puts json
#       @json_issue = JSON.parse(json) unless json.nil?
#       puts @json_issue
#     end
#
#     def title
#       fetched? ?  @json_issue["fields"]["summary"] : ""
#     end
#
#     def fetched?
#       puts "is fetched #{!@json_issue.nil?}"
#       !@json_issue.nil?
#     end
#   end
# end
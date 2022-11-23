require "HTTParty"
require 'json'

module GitReleaseNotes
  class JiraAdapter

    def available?
      response = client.get('/')
      response.code == '200'
    end

    def get_issue(issue)
      issue_url = "#{api_path}/issue/#{issue.issue_no}"
      response = HTTParty.get(issue_url, headers: headers, basic_auth: basic_auth)
      return nil unless response.code == 200
      issue_from_jira_response(issue, response.body)
    end

    private

    def issue_from_jira_response(issue, response_body)
      json_issue = JSON.parse(response_body)
      issue.jira_summary = json_issue.summary
      issue
    end

    def api_path
      "#{ENV['JIRA_URL']}/rest/api/3"
    end

    def headers
       {
         'Content-Type' => 'application/json',
         'Accept' => 'application/json'
       }
    end

    def basic_auth
      pass = ENV['JIRA_API_TOKEN'] || ENV['PASSWORD']

      {
        :username => ENV['JIRA_USERNAME'],
        :password => pass
      }
    end
  end
end
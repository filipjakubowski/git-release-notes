require 'jira-ruby'

module GitReleaseNotes
  class JiraAdapter

    def available?
      response = client.get('/')
      response.code == '200'
    end

    def get_issue(issue_key)
      @issue = @client.Issue.find(params[issue_key])
    end

    private

    def client
      @client = JIRA::Client.new(
        username: ENV['JIRA_USERNAME'],
        password: ENV['JIRA_PASSWORD'],
        site: ENV['JIRA_URL'],
        context_path: '',
        auth_type: :basic,
        read_timeout: 120
      )
    end
  end
end
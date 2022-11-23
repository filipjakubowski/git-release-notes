module GitReleaseNotes
  class JiraReleaseNotes
    def initialize(jira_adapter, git_adapter)
      @jira_adapter = jira_adapter
      @git_adapter = git_adapter
    end

    def jira_tickets_from_commit(project_prefix, commit)
      git_messages = @git_adapter.messages_for_pattern(commit,jira_issue_pattern(project_prefix))
      messages = git_messages.map do |m|
        issue = IssueEntry.new
        issue.issue_no = m[:key]
        issue.git_message = m[:git_message]
        issue_fill_from_jira(issue)
        issue
      end
      messages
    end

    private

    def jira_issue_pattern(project_prefix)
      /(#{project_prefix.upcase}|#{project_prefix.downcase})-\d+/
    end
    def issue_fill_from_jira(issue)
      @jira_adapter.get_issue(issue)
    end
  end
end
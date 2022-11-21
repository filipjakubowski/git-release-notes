module GitReleaseNotes
  class JiraReleaseNotes
    def initialize(jira_adapter, git_adapter)
      @jira_adapter = jira_adapter
      @git_adapter = git_adapter
    end

    def jira_tickets_from_commits(project_prefix, commit)
      git_messages = @git_adapter.messages_for_pattern(commit, /#{project_prefix}-\d+/)
    end

    # def message_for_ticket(ticket)
    #   @jira_adapter
  end
end
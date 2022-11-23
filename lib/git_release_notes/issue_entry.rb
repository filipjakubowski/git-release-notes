module GitReleaseNotes
  class IssueEntry
    attr_accessor :issue_no, :git_message, :git_timestamp, :jira_summary, :jira_status

    def to_md_string
      "#{jira_md_link} #{summary}"
    end

    def jira_md_link
      "[#{issue_no}](#{jira_path})"
    end

    def jira_path
      "#{ENV['JIRA_URL']}/browse/#{issue_no}"
    end

    def summary
      jira_summary || "[git] #{git_message}"
    end
  end
end
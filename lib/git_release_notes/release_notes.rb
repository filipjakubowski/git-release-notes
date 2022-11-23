module GitReleaseNotes
  class ReleaseNotes
    def initialize(project_code, commit)
      @project_prefix = project_code
      @from_commit = commit
      @git_dir = Dir.pwd
    end

    def set_git_dir(dir)
      @git_dir = dir
    end

    def jira_project_prefix(project_code)
      @project_prefix = project_code
    end
    def release_notes_from_commit
      rn = get_release_notes
      issues = rn.jira_tickets_from_commit(@project_prefix, @from_commit)
      notes  = issues.map do |i|
        i.to_md_string
      end
      notes.join(" \n")
    end

    def get_release_notes
      ga = GitReleaseNotes::GitAdapter.new(@git_dir)
      ja = GitReleaseNotes::JiraAdapter.new
      rn = GitReleaseNotes::JiraReleaseNotes.new(ja, ga)
    end
  end
end
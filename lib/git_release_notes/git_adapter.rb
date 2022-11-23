require 'git'

module GitReleaseNotes
  class GitAdapter
    def initialize(dir=Dir.pwd)
      @dir = dir
    end

    def messages_for_pattern(commit, regexp)
      logs = logs_messages_between_sha(commit);
      logs
        .select { |l| l[regexp] }
        .map { |l| { key: l[regexp], git_message: l } }
    end

    def logs_messages_between_sha(commit)
      logs = client.log.between(commit, 'HEAD')
      logs.map do |c|
        c.message
      end
    end

    private

    # def pattern_instances(pattern m )

    def client
      @client ||= Git.open(@dir)
    end
  end
end
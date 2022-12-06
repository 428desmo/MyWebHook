require 'json'

token = `cat ~/personal_access_token.txt`.chomp

full_name = "TokyoDesmo/FirstRepo"


issueBody = <<-EOS
# Branch protection alert
This branch is protected with the following configuration.
Ask @428desmo for details.
EOS

issueBody += "```\n" + `cat branch-protection-rule.json` + "\n```"

issueHash = {"title":"Branch protection alert","body":"#{issueBody}"}
issueJson = issueHash.to_json
issueUrl="https://api.github.com/repos/#{full_name}/issues"
issueCmd = "curl -v"\
" -X POST"\
" -H \"Accept: application/vnd.github+json\""\
" -H \"Authorization: Bearer #{token}\""\
" -H \"X-GitHub-Api-Version: 2022-11-28\""\
" #{issueUrl}"\
" -d '#{issueJson}'"

#puts issueCmd

puts `#{issueCmd}`

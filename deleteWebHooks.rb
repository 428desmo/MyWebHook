require 'json'

# Create a personal access token (classic)
# and store it in ~/personal_access_token.txt
#
# Reference:
#   https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token


token = `cat ~/personal_access_token.txt`.chomp
organization = "TokyoDesmo"

listCmd = "curl -s " \
          " -H \"Accept: application/vnd.github+json\"" \
          " -H \"Authorization: Bearer #{token}\""\
          " -H \"X-GitHub-Api-Version: 2022-11-28\"" \
          " https://api.github.com/orgs/#{organization}/hooks"

json = `#{listCmd}`

if json && !json.empty? then
  params = JSON.parse(json)
  params.each{
    |key,value|
    url = key.dig("url")
    if url then
        deleteCmd = "curl -s " \
                    " -X DELETE" \
                    " -H \"Accept: application/vnd.github+json\"" \
                    " -H \"Authorization: Bearer #{token}\""\
                    " -H \"X-GitHub-Api-Version: 2022-11-28\"" \
                    " #{url}"

        puts deleteCmd
        `#{deleteCmd}`
    end
  }
end


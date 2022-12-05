require("json")

#json=`gh api \
#      -H 'Accept: application/vnd.github+json' \
#      /repos/TokyoDesmo/FirstRepo/branches/main/protection`

json="{\"url\":\"https://api.github.com/repos/TokyoDesmo/FirstRepo/branches/main/protection\",\"required_pull_request_reviews\":{\"url\":\"https://api.github.com/repos/TokyoDesmo/FirstRepo/branches/main/protection/required_pull_request_reviews\",\"dismiss_stale_reviews\":true,\"require_code_owner_reviews\":false,\"require_last_push_approval\":false,\"required_approving_review_count\":1},\"required_signatures\":{\"url\":\"https://api.github.com/repos/TokyoDesmo/FirstRepo/branches/main/protection/required_signatures\",\"enabled\":false},\"enforce_admins\":{\"url\":\"https://api.github.com/repos/TokyoDesmo/FirstRepo/branches/main/protection/enforce_admins\",\"enabled\":false},\"required_linear_history\":{\"enabled\":false},\"allow_force_pushes\":{\"enabled\":false},\"allow_deletions\":{\"enabled\":false},\"block_creations\":{\"enabled\":false},\"required_conversation_resolution\":{\"enabled\":false},\"lock_branch\":{\"enabled\":false},\"allow_fork_syncing\":{\"enabled\":false}}"

hash = JSON.parse(json)


def print_values(h, indent)
  h.each do |k,v|
    case v
    when Array
      v.each do |h|
        print_values(h, indent + 4)
      end
    when Hash
      if indent > 0
        printf("%*c", indent, ' ')
      end
      printf("- %s:\n\n", k)
      print_values(v, indent + 2)
    else
      if indent > 0
        printf("%*c", indent, ' ')
      end
      printf("- %s: %s\n\n", k, v)
    end
  end
end

### 
print_values(hash, 0)

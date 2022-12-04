system("gh issue create \
-t \"Branch protection alert\" \
-b \"# Branch protection alert
This branch is protected with following rules:
- Requires a pull request before merging
  - Require approvals
  - Dismiss stale pull request approvals when new commits are pushed\" \
--repo TokyoDesmo/FirstRepo")

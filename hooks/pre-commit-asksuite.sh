local_branch_name="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex="$(curl https://bitbucket.org/api/2.0/snippets/cauesanttos/9ELpjA/ca712cd47df72f5ef4c9b632db8974021227a159/files/branch-name)"

echo "$valid_branch_regex"

message="There is something wrong with your branch name. Branch names in this project must adhere to this contract: $valid_branch_regex. Your commit will be rejected. You should rename your branch to a valid name and try again."

if [[ ! $local_branch_name =~ $valid_branch_regex ]]; then
    echo "$message"
    exit 1
fi

exit 0
#!/bin/sh

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
PATTERN="^(feature|bugfix|update|test)\/[a-zA-Z0-9-]+$"

if [[ ! $BRANCH_NAME =~ $PATTERN ]]; then
  echo "🚨 Invalid branch name: '$BRANCH_NAME'"
  echo "✅ Allowed formats: feature/name, bugfix/name, update/name"
  echo "🔹 Only letters (a-z, A-Z), numbers (0-9), and hyphens (-) are allowed after the prefix."
  exit 1
fi

echo "✅ Branch name is valid!"
exit 0
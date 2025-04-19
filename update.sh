#!/bin/bash

# Check if there are any changes to commit
echo "🔄 Checking for changes..."
git add .

# Check if there are differences between the working directory and the HEAD
git diff-index --quiet HEAD || {
    echo "📤 Changes detected, committing and pushing to remote..."

    # Get a commit message from the user, or use a default message
    read -p "Enter commit message (default: 'Automated commit - Update changes'): " commit_message
    commit_message="${commit_message:-Automated commit - Update changes}"

    # Commit changes with the provided or default message
    git commit -m "$commit_message" || { echo "🚫 Commit failed!"; exit 1; }

    # Push to the 'main' branch of the remote repository
    git push origin main || { echo "🚫 Push failed!"; exit 1; }

    echo "✅ Changes pushed successfully!"
} || {
    echo "🚫 No changes detected to push."
}

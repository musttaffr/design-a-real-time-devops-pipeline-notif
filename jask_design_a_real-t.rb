# Configuration for Real-Time DevOps Pipeline Notifier

# Set up notification channels
NOTIFICATION_CHANNELS = {
  slack: {
    url: "https://your-slack-webhook-url.com",
    channel: "devops-notifications"
  },
  email: {
    sender: "devops@example.com",
    recipients: ["dev@example.com", "ops@example.com"]
  }
}

# Define pipeline stages and their corresponding notification triggers
PIPELINE_STAGES = {
  build: {
    success: [:slack, :email],
    failure: [:slack, :email]
  },
  test: {
    success: [:email],
    failure: [:slack, :email]
  },
  deploy: {
    success: [:slack, :email],
    failure: [:slack, :email]
  }
}

# Set up pipeline API endpoint
PIPELINE_API = {
  url: "https://your-pipeline-api.com",
  auth: {
    username: "your-username",
    password: "your-password"
  }
}

# Notification message templates
NOTIFICATION_TEMPLATES = {
  build_success: "Build #{PIPELINE_API[:url]}/builds/:id succeeded!",
  build_failure: "Build #{PIPELINE_API[:url]}/builds/:id failed!",
  test_success: "Tests passed for #{PIPELINE_API[:url]}/builds/:id!",
  test_failure: "Tests failed for #{PIPELINE_API[:url]}/builds/:id!",
  deploy_success: "Deployment of #{PIPELINE_API[:url]}/builds/:id successful!",
  deploy_failure: "Deployment of #{PIPELINE_API[:url]}/builds/:id failed!"
}

# Set up notification interval (in seconds)
NOTIFICATION_INTERVAL = 60
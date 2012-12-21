# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Musicmindbeta::Application.initialize!


Disqus::defaults[:account] = "jchestang"
Disqus::defaults[:api_key] = "uNSszQYFNTFeF5nPovtZfhc3UCiRlMWNqa5hRtNAzeOUsQysIpJa6TMEJRVeVzUt"
# so that the comments will load up in development environment
Disqus::defaults[:developer] = true
Disqus::defaults[:container_id] = "disqus_thread"
Disqus::defaults[:show_powered_by] = false




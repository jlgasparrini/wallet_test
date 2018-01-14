# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password]
Rails.application.config.filter_parameters << lambda do |k, v|
  v.replace('[FILTER]') if k == 'card_number' #prevent to log cc numbers
end


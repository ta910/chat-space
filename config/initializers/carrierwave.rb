CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.storage = :fog
      config.fog_directory = 's3user--backet'
      config.asset_host = 'https://s3.amazonaws.com/s3user--backet'

    when 'development'
      config.storage = :fog
      config.fog_directory = 's3user--backet'
      config.asset_host = 'https://s3.amazonaws.com/s3user--backet'

    when 'test'
      config.storage = :file
      config.fog_directory = 's3user--backet'
      config.asset_host = 'https://s3.amazonaws.com/s3user--backet'
  end
end

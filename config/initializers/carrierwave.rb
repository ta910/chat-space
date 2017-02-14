CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AWS_ACCESS_KEY_ID',
    aws_secret_access_key: 'AWS_SECRET_ACCESS_KEY',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 's3user--backet'
      config.asset_host = 's3user--backet.s3-website-ap-northeast-1.amazonaws.com/s3user--backet'

    when 'development'
      config.fog_directory = 's3user--backet'
      config.asset_host = 's3user--backet.s3-website-ap-northeast-1.amazonaws.com/s3user--backet'

    when 'test'
      config.fog_directory = 's3user--backet'
      config.asset_host = 's3user--backet.s3-website-ap-northeast-1.amazonaws.com/s3user--backet'
  end
end

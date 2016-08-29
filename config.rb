require 'dotenv'
Dotenv.load

module Config
  INSTAGRAM = {
    SERVER_URL: 'https://api.instagram.com',
    ACCESS_TOKEN: ENV['ACCESS_TOKEN'],
    API: {
      PATH:{
        VERSION: '/v1',
        RECENT_MEDIA: '/users/self/media/recent'
      }
    }
  } 
end

SINATRA_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

configure :development do
	DataMapper.setup(:default, "sqlite3://#{SINATRA_ROOT}/development.sqlite3")
end

configure :production do
	DataMapper.setup(:default, {
		:adapter  => 'mysql',
		:host     => 'localhost',
		:username => 'root' ,
		:password => '',
		:database => 'seinfeld_production'}) 
end

Seinfeld::User.github_login    = ''
Seinfeld::User.github_password = ''
Seinfeld::User.creation_token  = ''

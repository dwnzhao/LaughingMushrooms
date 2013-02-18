object @post
attributes :id, :body, :header, :url, :liked

child :creator do
	attributes :first_name, :last_name
end

child :comments do
	attributes :content, :author_name
end
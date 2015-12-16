require 'sinatra'

not_found do 
  "<html><body>Sorry, you're lost!</body></html>"
end

before do 
  @people = [
              {:name => "Harry", :age => 22},
              {:name => "Jack", :age => 26},
              {:name => "Jamie", :age => 22}
            ]
end

get '/' do 
  erb :index
end

post '/secretdata' do 
  if params[:password] != '4321'
    halt [403, 'Forbidden'] 
  end
  erb :secretdata
end

__END__

@@ layout
<html>
  <head><title>My App</title></head>
  <body>
    <h3>My App</h3>
    <%= yield %>
  </body>
</html>

@@ index
  <form method="POST" action="/secretdata">
    Password: <input type="text" name="password" />
    <input type="submit" value="Log in" />
  </form>
  
@@ secretdata
  Here is some not so secret data: <code>1234</code>
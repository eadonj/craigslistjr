get '/' do
  @categories = Category.all
  erb :index
end

get '/posts/new' do
  @categories = Category.all
  erb :newposts
end

get '/category/:category_name' do
  @category = Category.where("name = ?", params[:category_name])[0]
  @posts = Post.where("category_id = ?", @category.id)
  @posts.sort_by!{|post| post.updated_at}.reverse!
  erb :posts
end

post '/posts' do
  @post = Post.create(params[:post])
  erb :successful_post
end

get '/posts/:key' do
  @post = Post.where(security_key: params[:key])[0]
  unless @post
    erb :wrong_page
  else
    erb :postpage
  end
end

post '/posts/edit' do
  post = Post.find(params[:id])
  post.update_attributes(params[:post])
  key = params[:key]
  redirect("/posts/#{key}")
end

get '/posts/edit/:key' do 
  @post = Post.where(security_key: params[:key])[0]
  erb :edit_page
end

get '/posts/remove/:id' do
  p "jhfjfjhfjh"
  Post.find(params[:id]).destroy
  redirect('/')
end


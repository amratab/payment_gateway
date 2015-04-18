require 'uri'
set :haml, :format => :html5

get "/" do

  haml :index

end

def generateRandomResult()
  resultArr = []
  9.times {resultArr.push(true)}
  resultArr.push(false)
  resultArr.sample
end

post "/payment" do
  @order_id = params[:order_id]
  @amount = params[:amount]
  haml :card_details
end

post "/result" do
  @order_id = params[:order_id]
  @result = generateRandomResult()
  @result_val = @result? "success" : "failure"
  @post_url = "http://localhost:9292/pgcallback"
  haml :result
end



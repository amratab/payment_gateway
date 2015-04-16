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
  @result = generateRandomResult()
  @redirect_url = URI.decode(params["redirect_url"]) + "&result="
  @redirect_url = @result ? @redirect_url + "success" :  @redirect_url + "failure"
  haml :payment_page
end

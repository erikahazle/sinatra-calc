require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do
  erb :home
end

get '/basic_calc' do
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :basic_calc
end

get '/power' do
  @number = params[:number].to_i
  @power = params[:power].to_i
  if @number && @power
    @result_power = @number ** @power
  end
  erb :power
end

get '/sqrt' do
  @number = params[:number].to_i
  if @number
    @result_sqrt = Math.sqrt(@number)
  end
  erb :sqrt
end

get '/bmi' do
  @weight = params[:weight].to_f
  @height = params[:height].to_f
  if @weight && @height
    @result_bmi = @weight / (@height**2)
  end
  erb :bmi
end

get '/mortgage' do
  @principal = params[:principal].to_f
  @interest = params[:interest].to_f
  @payment_number = params[:payment_number].to_i
  if @principal && @interest && @payment_number
    @interest = @interest / 100 / 12
    x = ((1+@interest)**@payment_number).to_i
    @monthly_payment = (@principal * @interest * x / (x-1)).round(2)
  end
  erb :mortgage
end

get '/trip_calc' do
  @distance = params[:distance].to_f
  @speed = params[:speed].to_f
  @mpg = params[:mpg].to_f
  @cost = params[:cost].to_f

  if @speed > 60
    @mpg - ((@speed - 60) * 2)
  else
    @mpg
  end

  @time = (@distance / @speed).round(2)
  @trip_cost = (@distance/@mpg)*@cost
  erb :trip_calc
end

get '/contact' do
  erb :contact
end


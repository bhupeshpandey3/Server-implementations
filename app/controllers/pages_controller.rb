class PagesController < ApplicationController
  $hash=Hash.new
  $kill=Hash.new
  def index
    connId=params[:connId]
    $hash[connId]=params[:timeout]
    var=connId+"time"
    $hash[var]=Time.now.to_i
    a=Time.now.to_i
    b=$hash[var]
    c=$hash[connId].to_i
    while (a-b<=c)
      if $kill[connId]==true
        $hash.delete(connId)
        $hash.delete(var)
        status=1
        break
      end
    end
    # sleep params[:timeout].to_i
    if status==1
      $kill[connId]=false
      render json: {"status":"killed"}, status: 200
     else
    render json: {"status":"ok"}, status: 200
  end
  end
  def status
    status=Hash.new
  $hash.each do |key,value|
    if key.ends_with?"time"
      val=$hash[key.chomp("time")].to_i
      if (Time.now.to_i-value)>=(val)
        $hash.delete(key.chomp("time"))
        $hash.delete(key)
      else
        status[key.chomp("time")]=(val-(Time.now.to_i-value)).to_s
      end
    end
  end
    render json: status.to_json
  end
  def kill
    $hash.each do |key,value|
    if key.ends_with?"time"
      val=$hash[key.chomp("time")].to_i
      if (Time.now.to_i-value)>=(val)
        $hash.delete(key.chomp("time"))
        $hash.delete(key)
      end
    end
  end
    var=params[:connId].to_s
    $kill[var]=true
    status=Hash.new
    status[:status]="invalid connection id "+params[:connId]
    if $hash[var]
    render json: {"status":"ok"}
  else
    render json: status.to_json
  end
end
end
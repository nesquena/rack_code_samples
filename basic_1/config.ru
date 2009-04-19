# rackup basic_1/config.ru -p 3000

run Proc.new { |env| 
  [200, {"Content-Type" => "text/html", "content-length" => "19"}, "Hello from Basic 1!"]
}
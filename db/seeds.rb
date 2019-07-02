100.times do |post|
  Post.create!(date: Date.today, rationale:"#{post} It is a Comment POst!")
end
puts "Creados 100 Posts!"
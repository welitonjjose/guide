prev = 0
index = 0
firsty = 0

json.array! @actives.reverse do |active|
  amount = active.amount.to_f

  json.day index += 1 
  json.date l active.open_in,format: :short
  json.amount "R$ #{amount.round(2)}"
  json.d_one "#{active.percent(prev)}%"
  json.d_first "#{active.percent(firsty)}%"

  prev = active.amount.to_f
  firsty = amount if firsty.zero? 
end

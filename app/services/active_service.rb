class ActiveService
  def initialize(active)
    @active = active
  end

  def call
    search_active
    extract_result
    serialize_and_save
  end

  private

  def search_active
    @response = HTTParty.get(
      "https://query2.finance.yahoo.com/v8/finance/chart/#{@active}?interval=1d&range=2mo", 
      headers: {'User-agent': 'Mozilla/5.0'}
    )
  end

  def extract_result
    @atoh = {}
    @response['chart']['result']&[0].each do |result|
      if result[0] == "timestamp"
        @atoh[:timestamp] = result[1]
      end

      if result[0] == "indicators"
        # @atoh[:indicators] = result[1]
        @atoh[:open] = result[1]['quote'][0]['open']
      end
    end
  end

  def serialize_and_save
    Atoh.serialize(@atoh).reverse().each do |item|
      date = Time.at(item[:timestamp])
      active_obj = Active.find_or_create_by(open_in: date)
      active_obj.name = @active
      active_obj.amount = item[:open]
      active_obj.save!
    end
  end
end
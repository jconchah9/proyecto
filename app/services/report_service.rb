class ReportService
  include HTTParty

  def initialize
    development_url = 'http://agroeffect.cl:5000'
    production_url = 'agro-effect-monitoring.herokuapp.com'
    @api_url = Rails.env.production? ? production_url : development_url
    self.class.base_uri @api_url
  end

  def daily_report
    Monitoring.eager_load(sector: :restrictions).each do |m|
      response = self.class.get("/api/reports/#{m.sensor_id}")
      response.each do |x|
        r = Report.find_or_create_by(sent_at: x['_id']['date'], sensor_id: x['_id']['sensor_id'])
        r.average_value = x['avg_value'].to_i
        r.minimun_value = x['min_value'].to_i
        r.maximum_value = x['max_value'].to_i
        r.save
      end
    end
  end
end

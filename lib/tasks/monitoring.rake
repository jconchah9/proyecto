namespace :monitoring do
  desc "create monitoring"
  task build_data: :environment do
    ('2017-07-10'.to_datetime.to_i .. (Date.today+1).to_datetime.to_i).step(1.hour) do |date|
      Monitoring.joins(sector: :restrictions).each do |m|
        lect = rand(m.sector.restrictions.first.minimum_value-10..m.sector.restrictions.first.maximum_value+10)
        MonitoringSensor.create(sensor_id: m.sensor_id, measuring: lect, sent_at: Time.at(date) )
        Monitoringsensor.create(sensor_id: m.sensor_id, lectura: lect, date_create: date )
        puts "sent_at:#{Time.at(date)} ____value:#{lect} _____sensor:#{m.sensor_id}"
      end
    end
  end

  desc "create report"
  task daily_report: :environment do
    report = ReportService.new
    report.daily_report
  end
end

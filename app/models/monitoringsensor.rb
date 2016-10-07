class Monitoringsensor
  include Mongoid::Document

  field :sensor_id,  type: Integer
  field :lectura, type: Integer
  field :date_create, type: DateTime
end

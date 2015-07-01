class PhoneNumberResource < JSONAPI::Resource
  attributes :name, :phone_number
  has_one :contact

  filter :contact

  def name=(value)
    if value == "boom"
      model.name = "change to database that isn't rolled back"
      model.save
      raise "some error"
    end

    model.name = value
  end
end

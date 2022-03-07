# Do we really need to do this
#


1000.times do
  teachers = (1..1000).to_a.map {
    FactoryBot.build(:db_teacher).attributes.merge("id" => SecureRandom.uuid)
  }
  Db::Teacher.insert_all!(teachers)
end


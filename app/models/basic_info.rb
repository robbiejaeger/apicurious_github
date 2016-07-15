class BasicInfo < OpenStruct

  def self.service(user)
    @@service ||= BasicInfoService.new(user)
  end

  def self.user_basic_info(user)
    basic_info_hash = service(user).get_basic_info
    BasicInfo.new(basic_info_hash)
  end
end

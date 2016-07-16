class BasicInfo < OpenStruct

  def self.service
    @service ||= BasicInfoService.new
  end

  def self.user_basic_info(user)
    basic_info_hash = service.get_basic_info(user)
    BasicInfo.new(basic_info_hash)
  end
end

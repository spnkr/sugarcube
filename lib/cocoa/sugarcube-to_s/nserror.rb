class NSError

  def to_s
    "#<#{self.class.to_s}:0x#{self.object_id.to_s(16)}, "+
      "description=#{self.localizedDescription.inspect}, code=#{code}, "+
      "domain=#{domain.inspect}, userInfo=#{userInfo.inspect}"+
     ">"
  end

end

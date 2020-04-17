module AttachmentHelper
  def is_type_image?(attachment_type)
    attachment_type.include? "image"
  end
end

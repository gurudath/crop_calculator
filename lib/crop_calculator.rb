require "crop_calculator/version"

module CropCalculator
  def self.calculate_crop_rect(target_width, target_height, img_width, img_height, roi_x, roi_y, roi_width, roi_height)
    
    width= roi_width
    height= roi_height
    target_ratio=target_width.to_f/target_height
    
    if width < target_width
      width = target_width
    end
    
    if width > img_width
      width = img_width
    end

    height = width / target_ratio
     
    if (height < roi_height)
      height = roi_height
      width = height * target_ratio
    end
    
    if height > img_height
      height = img_height
      width = height * target_ratio
    end
    
    delta_width= width - roi_width
    delta_height= height - roi_height
    top_left_x= roi_x
    top_left_y= roi_y
    
    top_left_x -= delta_width/2
    if top_left_x < 0
      top_left_x = 0 
    end
    if top_left_x + width > img_width
      top_left_x = img_width - width
    end
    
    top_left_y -= delta_height/2
    if top_left_y < 0
      top_left_y = 0 
    end
    if top_left_y + height > img_height
      top_left_y = img_height - height
    end

    return top_left_x.to_i, top_left_y.to_i, width.to_i, height.to_i
  end
end

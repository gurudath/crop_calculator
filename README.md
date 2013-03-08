# CropCalculator

Given a target size and an ROI, calculate crop size. The return values 
can be used by RMagick or similar tool to create the actual cropped version.

To compute ROI using OpenCV's face detection, [face_ROI] (https://github.com/kreatio-sw/face_ROI).

## Installation

Add this line to your application's Gemfile:

    gem 'crop_calculator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crop_calculator

## Usage
````ruby
    offset_x, offset_y, crop_width, crop_height = 
      CropCalculator.calculate_crop_rect(target_width, target_height, img_width, img_height, roi_x, roi_y, roi_width, roi_height)
````

Full sample using RMagick and face_ROI

````ruby
module FaceROI
  OPENCV_BASE= '/usr/local'
end

require 'face_ROI'
require 'crop_calculator'
require 'rmagick'
  
def test_me(path)
  dimensions = [[50,50],[100,100],[400,400],[150,100],[200,300],[400,250]]
  
  f=FaceROI::Finder.new(path, FaceROI::CONFIG1)

  image=f.image_with_faces
  
  rm_img=Magick::Image.read(path)[0]
  img_width=rm_img.columns
  img_height=rm_img.rows
  
  roi_x, roi_y, roi_width, roi_height= f.roi

  dimensions.each do |dimension|
    target_width, target_height = dimension
    
    # Compute the crop
    offset_x, offset_y, crop_width, crop_height = 
      CropCalculator.calculate_crop_rect(target_width, target_height, img_width, img_height, roi_x, roi_y, roi_width, roi_height)

    out_path = path.sub(/\./, "-#{target_width}x#{target_height}.")
    out_path = "out/#{out_path}"
    
    rm_img.excerpt(offset_x, offset_y, crop_width, crop_height).resize(target_width, target_height).write(out_path)
    
  end
end

test_me 'test/IMG_0465.jpg'
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

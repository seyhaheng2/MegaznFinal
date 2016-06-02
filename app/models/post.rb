class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  # include Impressionist::IsImpressionable
  # is_impressionable

  acts_as_votable

  acts_as_taggable
  
  extend FriendlyId



  # validates_presence_of :title, :image, :description, :format_post, :hide_post, :category_id, :user_id, :meta_title, :meta_description

  mount_uploader :image, ImageUploader

  # acts_as_punchable

  def format_post_enum
    ['slide','top', 'default', 'big', 'small', 'bottom']
  end

  friendly_id :title, use: [:slugged, :history, :finders]


  def should_generate_new_friendly_id?
    title_changed?
  end

  scope :of_small, lambda{ 
    where("format_post = 'small'")
  }

  scope :of_default, lambda{ 
    where("format_post = 'default'")
  }
  scope :of_cover, lambda{ 
    where("format_post = 'cover'")
  }
  scope :of_slide, lambda{ 
    where("format_post = 'slide'")
  }

  scope :of_top, lambda{ 
    where("format_post = 'top'")
  } 

  scope :of_bottom, lambda{ 
    where("format_post = 'bottom'")
  }
  scope :of_big, lambda{ 
    where("format_post = 'big'")
  }



 

end

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)


  config.model Post do 

    # object_label_method do
    #   :custom_label_method
    # end

    edit do
      field :title
      field :image
      field :description, :ck_editor
      field :format_post 
      field :tag_list 
      field :meta_title 
      field :meta_description 
      field :ads
      field :excerpt
      field :hide_post 
      field :user
      field :category
      field :viewer
    end

    list do 
     items_per_page 100
     field :id
     field :title
     field :image
     field :format_post
     field :hide_post, :toggle
   end
  end



  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    toggle
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

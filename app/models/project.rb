class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }
  has_many :comments, as: :commentable
  has_attached_file :image,
                    :storage => :s3,
                    :styles => { :thumb => "x100", :medium => "x300"},
                    :s3_credentials => {
                      :bucket => ENV['AWS_S3_BUCKET'],
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png application/pdf)

end

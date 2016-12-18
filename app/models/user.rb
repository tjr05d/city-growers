class User < ApplicationRecord
  has_secure_password
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :products, dependent: :destroy

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email,
            presence: :true,
            uniqueness: :true,
            format: {
              with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
            }
  #methods for geocode support
  geocoded_by :city
  after_validation :geocode

  #methods for image uploading
  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "50x50>" },
                    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment :avatar,
                      content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def to_s
    "#{first_name} #{last_name}"
  end
end

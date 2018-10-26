class Spree::BlogEntryCover < Spree::Image

  if Rails.env.development? || Rails.env.test?
    has_attached_file :attachment,
      styles: { mini: '150x100#', normal: '420x300>', large: '950x700>', cover: '1270x848#' },
      default_style: :large,
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      url: "/spree/blog_entry_covers/:id/:style/:basename.:extension",
      path: ":rails_root/public/spree/blog_entry_covers/:id/:style/:basename.:extension"
  else
    has_attached_file :attachment,
      styles: { mini: '150x100#', normal: '420x300>', large: '950x700>', cover: '1270x848#' },
      default_style: :large,
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_credentials: {
        bucket: ENV["AWS_S3_BUCKET"]
      },
      storage: :s3,
      s3_region: ENV["AWS_S3_REGION"],
      s3_headers: { "Cache-Control" => "max-age=31557600" },
      s3_protocol: "https",
      bucket: ENV["AWS_S3_BUCKET"],
      url: ":s3_domain_url",
      path: "/:class/:id/:style/:basename.:extension",
      default_url: "/:class/:id/:style/:basename.:extension"
  end

  validates_attachment :attachment,
    presence: true,
    content_type: { content_type: %w(image/jpeg image/jpg image/png) }
end

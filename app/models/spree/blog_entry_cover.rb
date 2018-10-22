class Spree::BlogEntryCover < Spree::Image
  has_attached_file :attachment,
     styles: { mini: '150x100#', normal: '420x300>', large: '950x700>', cover: '1270x848#' },
     default_style: :large,
     convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  validates_attachment :attachment,
    presence: true,
    content_type: { content_type: %w(image/jpeg image/jpg image/png) }
end

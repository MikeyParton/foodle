class ProductFinder
  def initialize(barcode)
    @barcode = barcode
  end

  def find
    return nil unless valid_barcode?
    product = Product.find_by(barcode: @barcode)

    unless product.present?
      product = OpenFood::Client.new.product(@barcode)
      product.save if product.present?
    end
    product
  end

  private

  def valid_barcode?
    # is a 13 digit integer
    @barcode.match(/^(\d)+$/).present? && @barcode.length == 13
  end
end

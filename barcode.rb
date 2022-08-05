# encoding: utf-8

require 'mini_magick'
require 'rest_client'
require 'zbar'

class Barcode

  def initialize(file_path:)
    @file_path = file_path
    @barcodes = []
  end

  def extract
    image = MiniMagick::Image.open(@file_path)
    image.format 'PGM'
    zbar = ZBar::Image.from_pgm(image.to_blob).process
    @barcodes = zbar.map{|z| z.data if z.quality >= 3 }.compact rescue []
    @barcodes
  end

  def gbif(key: "catalogNumber")
    data = []
    @barcodes.each do |barcode|
      response = RestClient::Request.execute(
        method: :get,
        url: "https://api.gbif.org/v1/occurrence/search?#{key}=#{barcode}"
      )
      data << JSON.parse(response, :symbolize_names => true)
    end
    data
  end

end

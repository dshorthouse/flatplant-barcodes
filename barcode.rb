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

  def gbif
    data = []
    @barcodes.each do |barcode|
      response = RestClient::Request.execute(
        method: :post,
        headers: { "Content-Type": "application/json", accept: :json },
        url: "https://api.gbif.org/v1/occurrence/search/predicate",
        content_type: :json,
        payload: { predicate: { type: "or", predicates: [
          {
            type: "equals",
            key: "CATALOG_NUMBER",
            value: barcode
          },
          {
            type: "equals",
            key: "OTHER_CATALOG_NUMBERS",
            value: barcode
          },
          {
            type: "equals",
            key: "OCCURRENCE_ID",
            value: barcode
          }
        ] } }.to_json
      )
      data << JSON.parse(response, symbolize_names: true)
    end
    data
  end

end

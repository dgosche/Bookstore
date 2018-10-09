module BooksHelper
  def format_price(book)
    if book.free?
      content_tag(:strong, "Free")
    else
      number_to_currency(book.price)
    end
  end

  def image_for(book)
    if book.book_image_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag book.book_image_name
    end
  end
end

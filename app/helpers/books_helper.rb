module BooksHelper

  def admin_show_options
    return unless current_admin
    link_list(
      'Add Entry' => { url: new_book_entry_path( @book ) },
      'Edit'      => { url: edit_book_path( @book ) },
      'Destroy'   => { url: book_path( @book ), options: { method: :delete } }
    )
  end

end

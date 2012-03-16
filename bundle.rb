require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = t(:bundle_name)
  bundle.description = 'A port of the TextMate bundle. The text bundle has a lot of support for plain text and is a requisite for working with text.'
  bundle.repository = "git://github.com/aptana/text.ruble.git"
   
  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.menu t(:font) do |font_menu|
      font_menu.command t(:bigger)
      font_menu.command t(:smaller)
    end
    main_menu.menu t(:convert_strip) do |submenu|
      submenu.command t(:convert_to_hex)
      submenu.command t(:remove_trailing_spaces)
      submenu.command t(:remove_unprintable)
      submenu.command t(:transliterate_to_ascii)
    end
    main_menu.menu t(:encryption) do |submenu|
      submenu.command t(:aes_encrypt)
      submenu.command t(:aes_decrypt)
    end
    main_menu.menu t(:filtering) do |submenu|
      submenu.command t(:distill)
      submenu.command t(:copy_matching_lines)
      submenu.command t(:copy_non_matching_lines)
    end
    main_menu.menu t(:sorting) do |submenu|
      submenu.command t(:sort_lines)
      submenu.command t(:sort_and_remove_duplicates)
      submenu.separator
      submenu.command t(:randomize_lines)
    end
    main_menu.separator
    main_menu.command t(:delete_to_beginning_of_line)
    main_menu.command t(:duplicate_line)
    main_menu.command t(:join_lines)
    main_menu.separator
    main_menu.command t(:execute_and_insert)
    main_menu.separator
    main_menu.command t(:add_line_numbers)
    main_menu.command t(:word_count)
    main_menu.separator
    main_menu.command t(:copyright)
    main_menu.command t(:current_date)
    main_menu.command t(:lorem_ipsum)
    main_menu.command t(:speak) if Ruble.is_mac?
  end
end

# Default set of character pairs
smart_typing_pairs[""] = ['"', '"', '(', ')', '{', '}', '[', ']']

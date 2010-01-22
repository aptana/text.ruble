require 'java'
require 'radrails'

bundle 'Text' do |bundle|
  bundle.author = 'Allan Odgaard'
  bundle.contact_email_rot_13 = 'gz-ohaqyrf@znpebzngrf.pbz'
  bundle.description =  <<END
The text bundle has a lot of support for plain text and is a requisite for working with text.
END

  bundle.menu 'Text' do |main_menu|
    main_menu.menu 'Converting / Stripping' do |submenu|
      submenu.command 'Convert Character / Selection to Hex'
      submenu.command 'Remove Trailing Spaces in Document / Selection'
      submenu.command 'Remove Unprintable Characters in Document / Selection'
      submenu.command 'Transliterate Word / Selection to ASCII'
    end
    main_menu.menu 'Encryption' do |submenu|
      submenu.command 'AES Encrypt Document / Selection With Password...'
      submenu.command 'AES Decrypt Document / Selection With Password...'
    end
    main_menu.menu 'Filtering' do |submenu|
      submenu.command 'Distill Document / Selection'
      submenu.command 'Copy Matching Lines into New Document'
      submenu.command 'Copy Non-Matching Lines into New Document'
    end
    main_menu.menu 'Sorting' do |submenu|
      submenu.command 'Sort Lines in Document / Selection'
      submenu.command 'Sort Lines & Remove Duplicates'
      submenu.separator
      submenu.command 'Randomize Lines in Document / Selection'
    end
    main_menu.separator
    main_menu.command 'Delete Line'
    main_menu.command 'Duplicate Line / Selection'
    main_menu.command 'Join Lines'
    main_menu.separator
    main_menu.command 'Add Line Numbers to Document / Selection'
    main_menu.command 'Statistics for Document / Selection (Word Count)'
    main_menu.separator
    main_menu.command 'Copyright Notice'
    main_menu.command 'Current Date - YYYY-MM-DD'
    main_menu.command 'Lorem ipsum'
    main_menu.command 'Speak Document / Selection'
  end
end

puts "\n Welcome to Safari Password Converter (v.1.1.0-beta)\n ------------------------------------\n\n"

pass_file = "#{__dir__}/Passwords.csv"
if File.file?(pass_file) == true

        puts " Your options are:\n\n +-----------------------------------------------+\n | 1. Safari to Bitwarden CSV (OTP supported)    |\n | 2. Safari to Dashlane CSV (OTP unsupported)   |\n | 3. Safari to Lastpass CSV (OTP unsupported)   |\n | 4. Safari to 1Password CSV (OTP unsupported)  |\n | 5. Safari to KeePass CSV (OTP unsupported)    |\n | 6. Safari to LogMeOnce CSV (OTP unsupported)  |\n | 7. Exit Script                                |\n +-----------------------------------------------+\n\n" 
        loop do
                print " Enter corresponding option number to start : "
                @input = gets.chomp
                options = [1, 2, 3, 4, 5, 6, 7]
                options_exit = ['exit', 'quit', 'close', 'end', 'x']
                if options.include?(@input.to_i) == true
                        break
                elsif options_exit.include?(@input.to_s) == true
                        puts "\n Script ended!\n\n"
                        exit()
                elsif @input == ""
                        puts "\n Option cannot stay blank. If you wish to end the script, type 'close'.\n\n"
                else
                        puts "\n Incorrect option number. Please try again.\n\n"
                end
        end

        if @input.to_i == 1
                file = File.read(pass_file)
                file.each_line do |row|
                        row.gsub!("Title,Url,Username,Password,OTPAuth", "folder,favorite,type,name,notes,fields,reprompt,login_uri,login_username,login_password,login_totp")
                        unless row.include?("folder")
                                row.gsub!(/^/, ",,,")
                                row.gsub!(",http", ",,,,http")
                                File.open("bitwarden-pass.csv", "a") {|f| f.write("#{row}") }
                        else
                                File.open("bitwarden-pass.csv", "w") {|f| f.write("#{row}") }
                        end
                end
                puts "\n Sucessfully converted to Bitwarden CSV. File saved as bitwarden-pass.csv\n\n"

        elsif @input.to_i == 2
                file = File.read(pass_file)
                file.each_line do |row|
                        row.gsub!("Title,Url,Username,Password,OTPAuth", "name,url,username,password")
                        unless row.include?("name,url")
                                row.gsub!(/,otpauth(.*)/, ",")
                                File.open("dashlane-pass.csv", "a") {|f| f.write("#{row}") }
                        else
                                File.open("dashlane-pass.csv", "w") {|f| f.write("#{row}") }
                        end
                end
                puts "\n Sucessfully converted to Dashlane CSV. File saved as dashlane-pass.csv\n\n"

        elsif @input.to_i == 3
                file = File.read(pass_file)
                file.each_line do |row|
                        row.gsub!("Title,Url,Username,Password,OTPAuth", "name,url,username,password")
                        unless row.include?("name,url")
                                row.gsub!(/,otpauth(.*)/, ",")
                                File.open("lastpass-pass.csv", "a") {|f| f.write("#{row}") }
                        else
                                File.open("lastpass-pass.csv", "w") {|f| f.write("#{row}") }
                        end
                end
                puts "\n Sucessfully converted to Lastpass CSV. File saved as lastpass-pass.csv\n\n"

        elsif @input.to_i == 4
                file = File.read(pass_file)
                file.each_line do |row|
                        row.gsub!("Title,Url,Username,Password,OTPAuth", "Title,Website,Username,Password")
                        unless row.include?("Title,Website")
                                row.gsub!(/,otpauth(.*)/, ",")
                                File.open("1password-pass.csv", "a") {|f| f.write("#{row}") }
                        else
                                File.open("1password-pass.csv", "w") {|f| f.write("#{row}") }
                        end
                end
                puts "\n Sucessfully converted to 1Password CSV. File saved as 1password-pass.csv\n\n"

        elsif @input.to_i == 5
                file = File.read(pass_file)
                file.each_line do |row|
                        row.gsub!("Title,Url,Username,Password,OTPAuth", '"Account","Web Site","Login Name","Password"')
                        unless row.include?('"Account","Web Site"')
                                row.gsub!(/^/, '"')
                                row.gsub!(",", '",')
                                row.gsub!(/,otpauth(.*)/, ",")
                                File.open("keepass-pass.csv", "a") {|f| f.write("#{row}") }
                        else
                                File.open("keepass-pass.csv", "w") {|f| f.write("#{row}") }
                        end
                end
                puts "\n Sucessfully converted to KeePass CSV. File saved as keepass-pass.csv\n\n"

        elsif @input.to_i == 6
                file = File.read(pass_file)
                file.each_line do |row|
                        row.gsub!("Title,Url,Username,Password,OTPAuth", "name,url,username,password")
                        unless row.include?("name,url")
                                row.gsub!(/,otpauth(.*)/, ",")
                                File.open("logmeonce-pass.csv", "a") {|f| f.write("#{row}") }
                        else
                                File.open("logmeonce-pass.csv", "w") {|f| f.write("#{row}") }
                        end
                end
                puts "\n Sucessfully converted to LogMeOnce CSV. File saved as logmeonce-pass.csv\n\n"

        elsif @input.to_i == 7
                puts "\n Script ended!\n\n"
                exit()
        end

else
        puts " Passwords.csv file missing.\n\n Please place this alongside csv-gen.rb in same folder and re-run.\n\n"
        exit()
end

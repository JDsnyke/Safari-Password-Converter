puts ""
puts " Welcome to Safari Password Converter"
puts " ------------------------------------"
puts ""
puts " Your options are:"
puts ""
puts " +-----------------------------------------------+"
puts " | 1. Safari to Bitwarden CSV (OTP supported)    |"
puts " | 2. Safari to Dashlane CSV (OTP unsupported)   |"
puts " | 3. Safari to Lastpass CSV (OTP unsupported)   |"
puts " | 4. Safari to 1Password CSV (OTP unsupported)  |" # 1Password supports native safari csv import directly on their site!
puts " | 5. Safari to KeePass CSV (OTP unsupported)    |"
puts " | 6. Safari to LogMeOnce CSV (OTP unsupported)  |"
puts " | 7. Exit Script                                |"
puts " +-----------------------------------------------+"
puts ""
loop do
        print " Enter corresponding option number to start relevant script : "
        @input = gets.chomp
        options = [1, 2, 3, 4, 5, 6, 7]
        options_exit = ['exit', 'quit', 'close', 'end']
        if options.include?(@input.to_i) == true
                break
        elsif options_exit.include?(@input.to_s) == true
                puts ""
                puts " Script ended!"
                puts ""
                exit()
        elsif @input == ""
                puts ""
                puts " Option cannot stay blank. If you wish to end the script, type 'close'"
                puts ""
        else
                puts ""
                puts " Incorrect option number. Please try again."
                puts ""
        end
end

if @input.to_i == 1
        file = File.read("#{__dir__}/Passwords.csv")
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
        puts ""
        puts " Sucessfully converted to Bitwarden CSV. File saved as bitwarden-pass.csv"
        puts ""

elsif @input.to_i == 2
        file = File.read("#{__dir__}/Passwords.csv")
        file.each_line do |row|
                row.gsub!("Title,Url,Username,Password,OTPAuth", "name,url,username,password")
                unless row.include?("name,url")
                        row.gsub!(/,otpauth(.*)/, ",")
                        File.open("dashlane-pass.csv", "a") {|f| f.write("#{row}") }
                else
                        File.open("dashlane-pass.csv", "w") {|f| f.write("#{row}") }
                end
        end
        puts ""
        puts " Sucessfully converted to Dashlane CSV. File saved as dashlane-pass.csv"
        puts ""

elsif @input.to_i == 3
        file = File.read("#{__dir__}/Passwords.csv")
        file.each_line do |row|
                row.gsub!("Title,Url,Username,Password,OTPAuth", "name,url,username,password")
                unless row.include?("name,url")
                        row.gsub!(/,otpauth(.*)/, ",")
                        File.open("lastpass-pass.csv", "a") {|f| f.write("#{row}") }
                else
                        File.open("lastpass-pass.csv", "w") {|f| f.write("#{row}") }
                end
        end
        puts ""
        puts " Sucessfully converted to Lastpass CSV. File saved as lastpass-pass.csv"
        puts ""

elsif @input.to_i == 4
        file = File.read("#{__dir__}/Passwords.csv")
        file.each_line do |row|
                row.gsub!("Title,Url,Username,Password,OTPAuth", "Title,Website,Username,Password")
                unless row.include?("Title,Website")
                        row.gsub!(/,otpauth(.*)/, ",")
                        File.open("1password-pass.csv", "a") {|f| f.write("#{row}") }
                else
                        File.open("1password-pass.csv", "w") {|f| f.write("#{row}") }
                end
        end
        puts ""
        puts " Sucessfully converted to 1Password CSV. File saved as 1password-pass.csv"
        puts ""

elsif @input.to_i == 5
        file = File.read("#{__dir__}/Passwords.csv")
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
        puts ""
        puts " Sucessfully converted to KeePass CSV. File saved as keepass-pass.csv"
        puts ""

elsif @input.to_i == 6
        file = File.read("#{__dir__}/Passwords.csv")
        file.each_line do |row|
                row.gsub!("Title,Url,Username,Password,OTPAuth", "name,url,username,password")
                unless row.include?("name,url")
                        row.gsub!(/,otpauth(.*)/, ",")
                        File.open("logmeonce-pass.csv", "a") {|f| f.write("#{row}") }
                else
                        File.open("logmeonce-pass.csv", "w") {|f| f.write("#{row}") }
                end
        end
        puts ""
        puts " Sucessfully converted to LogMeOnce CSV. File saved as logmeonce-pass.csv"
        puts ""

elsif @input.to_i == 7
        puts ""
        puts " Script ended!"
        puts ""
        exit()
end
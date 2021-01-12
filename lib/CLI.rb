class CLI 

  def run 
    scraper = Scraper.new('https://www.mufon.com/historical.html')
 
    scraper.scrape_mufon_data 
    puts alien_face.red
    user_name = get_user_name 
    Sighting.print_sightings_list
    prompt_user_for_choice(user_name)
 
    while true 
      input = gets.chomp  

      if input.to_i.between?(1,20) 
        sighting = Sighting.find_by_index(input.to_i)
        user_choice_scraper = Scraper.new(sighting.url)
        puts user_choice_scraper.user_choice_scrape 
        puts sighting.url #displays URL at end of paragraph. 
        puts "#{user_name.strip.red}, type q to exit, choose another sighting or help me get home to my planet by typing...".blue + "go".red


      elsif input == "go" 
        puts "  THANKS #{user_name.strip.red}! You can still check out more sightings or type q to exit. BYE!"
        puts alien_ship.red


      elsif input == 'q'
        break
      else 
        puts "error" 
      end
    end
    exit
  end
  

 
 
  def alien_face
    puts "Greetings Earthling".light_blue
    return "
 
                                .     .       .  .   . .   .   . .    +  .
                                .     .  :     .    .. :. .___---------___.
                                    .  .   .    .  :.:. _. ..  .. :-_. .
                                .  :       .  .  .:../:            . .^  :.:.
                                    .   . :: +. :.:/: .   .    .        . . .:
                                .  :    .     . _ :::                .     .  . .
                                .. . .   . - : :.:./.                        .  .:
                                .      .     . :..|:                    .  .  ^. .:|
                                .       . : : ..||        .                . . !:|
                                .     . . . ::. ::\(                           . :)/
                                .   .     : . : .:.|. ######              .#######::|
                                :.. .  :-  : .:  ::|.#######           ..########:|
                                .  .  .  ..  .  .. :\ ########          :######## :/
                                .        .+ :: : -.:\ ########       . ########.:/
                                .  .+   . . . . :.:\. #######       #######..:/
                                    :: . . . . ::.:..:.\           .   .   ..:/
                                .   .   .  .. :  -::::.\.       | |     . .:/
                                    .  :  .  .  .-:.:.::.\               ..:/
                                .      -.  . . . .: .:::.:.\.            .:/
                                .   .   .  :   : ....::_:..:\    ___.    :/
                                .   .  .   .:. .. .  .: :.:.:\         :/
                                +   .   .   : . ::. :.:. .:.|\     .:/
                                .         +   .  .  ...::  ..|     .:|
                                .      . . .   .  .  . ... :..:.  ..
                                .   .       .      :  .   .: ::  .  .::\ "
 
 
  end

  def get_user_name
    puts "Please enter your name:".yellow  
    user_name = gets
    puts "Welcome #{user_name.strip}!!!".blue
    puts "Let me show you some Historic UFO sightings!".green
    return user_name
  end



 
  def prompt_user_for_choice(user_name)
    puts "#{user_name.strip.red} ,choose an event by number and find out how weird things get!".yellow
  end 

  def alien_ship
    return "
                  
                  .---------.
                // o       o .
                //    .   .    .
              //     )- -(     .
              //     ( 6 6 )     .
            //       . - .       .
            //         )=(         .
          //   o   .-- - --.   o   .
          //    I  .  -   -  .  I    .
      .--(    (_}y .        . {_)   )--.
    (    .___    __ _____ __   ___,     )
      .                                  .
        -._      o O o O o O o      _,- 
            `--Y--.___________.--Y--'
              |==.___________.==| 
              `==.___________.==' "


        end
end

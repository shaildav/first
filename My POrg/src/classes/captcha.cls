public class captcha {
 
    List<String> characters;
    public String input {get; set;}
    String char1;
    String char2;
    String char3;
    String char4;
    String char5;
    String char6;
 
    //In our contructor we will populate a list of strings with numbers and letters
    public captcha(){
        characters = new List<String>{'a','b','c','d','e','f','g','h',
            'i','j','k','l','m','n','o','p','q','r','s','t','u','v','w',
            'x','y','z','1','2','3','4','5','6','7','8','9','0'
        };
    }
 
    //This methods simply returns a random number between 0 and the size of the character list
    public Integer randomNumber(){
        Integer random = Math.Round(Math.Random() * characters.Size());
        if(random == characters.size()){
            random--;
        }
        return random;
    }
 
    /*Here we have 6 get methods that return 6 random characters to the page.
    For chars 1,3, and 5 (the black characters) we are saving the the values so 
    that we can compare them with the user's input */
    public String getChar1(){
        char1 = characters[randomNumber()];
        return char1;
    }
    public String getChar2(){
        char2 = characters[randomNumber()];
        return char2;
    }
    public String getChar3(){
        char3 = characters[randomNumber()];
        return char3;
    }
    public String getChar4(){
        char4 = characters[randomNumber()];
        return char4;
    }
    public String getChar5(){
        char5 = characters[randomNumber()];
        return char5;
    }
    public String getChar6(){
        char6 = characters[randomNumber()];
        return char6;
    }
 
    public Boolean validate(){
        if(input.length() == 6 && input.subString(0,1) == char1 && input.subString(1,2) == char2 && input.subString(2,3) == char3 && input.subString(3,4) == char4 && input.subString(4,5) == char5 && input.subString(5,6) == char6){
            return true;
        }else{
            return false; 
        }
    }
}
Function Convert-ToASCII{
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Text
    )
    $Library="a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," ","0","1","2","3","4","5","6","7","8","9"
    $Text_array=$Text.ToCharArray()
    foreach($Char in $Text_array){
        #Write-Output "$Char"
        if($Char -ne "’"){#this is a unique situation but this is intended to be an apostrophe
            $Char_tolower=($Char.ToString()).ToLower()
        }else{
            $Char_tolower=$Char
            $Char="'"
        }
        if(!$Library.Contains("$Char_tolower")){
            $ASCII_num=[byte][char]$Char
            $Char='"&Chr('+$ASCII_num+')&"'
            #Write-Output $ASCII_num
            #Write-Output $Char
        }
        $Out_string=$Out_string + $Char
    }
    $Out_string='"'+$Out_string+'"'
    Write-Output $Out_string
}
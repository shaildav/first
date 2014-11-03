public class ProfilePic{
    public string pic {get; set;}
    public string userToken {get; set; }
    
    public ProfilePic() {
        User u = [Select Id, SmallPhotoUrl From User Where Id = :UserInfo.getUserId()];
        System.debug(u);
        pic = u.SmallPhotoUrl;
    }
}
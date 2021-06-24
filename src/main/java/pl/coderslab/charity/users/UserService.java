package pl.coderslab.charity.users;


public interface UserService {


    User findByEmail(String email);

    void saveUser(User user);
}

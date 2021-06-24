package pl.coderslab.charity.users;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.role.Role;

import java.util.List;
import java.util.Set;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

    @Query("SELECT u FROM  User u WHERE ?1 MEMBER OF u.roles ")
    List<User> findByRole(Role role);

//    @Query("SELECT u FROM  User u WHERE u.roles = 'ROLE_USER'")
//    List<User> findAllUsers();
}

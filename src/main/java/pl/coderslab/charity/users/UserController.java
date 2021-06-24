package pl.coderslab.charity.users;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.role.Role;
import pl.coderslab.charity.role.RoleRepository;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Controller
public class UserController {
   private final UserService userService;
   private final UserRepository userRepository;
   private final RoleRepository roleRepository;

    public UserController(UserService userService, UserRepository userRepository, RoleRepository roleRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(){
        return "users/login";
    }

    @GetMapping("/logout")
    public String logout(){
        return "users/logout";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "users/register";
    }
    @PostMapping("/register")
    public String register(@Valid User user, BindingResult result){
        if(result.hasErrors()){
            return "users/register";
        }
        userService.saveUser(user);
        return "users/login";
    }


    @GetMapping("/admin1")
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "Hello " + entityUser.getEmail();
    }

    @RequestMapping("/admin/all")
    public String allAdmins(Model model){
        Role userRole = roleRepository.findByName("ROLE_ADMIN");
        model.addAttribute("admins", userRepository.findByRole(userRole));
        return "/admin/allAdmins";
    }

    @GetMapping("/admin/confirm")
    public String confirmInstitution(){
        return "institution/confirm";
    }

    @RequestMapping("/admin/remove/{id}")
    public String removeAdmin(@PathVariable Long id){
        User user = userRepository.getOne(id);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);
        return "/admin/allAdmins";
    }

    @RequestMapping(value="/admin/add", method = RequestMethod.GET)
    public String addAdmins(Model model){
        Role userRole = roleRepository.findByName("ROLE_USER");
        model.addAttribute("users", userRepository.findByRole(userRole));
        return "/admin/allUsers";
    }

    @RequestMapping(value="/admin/add/{id}", method = RequestMethod.POST)
    public String addAdmin(@PathVariable Long id){
        User user = userRepository.getOne(id);
        Role adminRole = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(new HashSet<>(Arrays.asList(adminRole)));
        userRepository.save(user);
        return "/admin/allAdmins";
    }

    @RequestMapping("/user/all")
    public String all(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "/user/all";
    }

    @RequestMapping(value = "/user/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable long id){
        model.addAttribute("user", userRepository.findById(id));
        return "user/edit";
    }
    @RequestMapping(value = "/user/update", method = RequestMethod.POST)
    public String update(@Valid User user, BindingResult result) {
        if(result.hasErrors()){
            return "user/edit";
        }
        userRepository.save(user);
        return "redirect:/user/all";
    }

    @GetMapping("/user/confirm")
    public String confirmUser(){
        return "user/confirm";
    }

    @GetMapping("/user/block/{id}")
    public String remove(@PathVariable long id){
        User user = userRepository.getOne(id);
        user.setEnabled(0);
        userRepository.save(user);
        return "redirect:/user/all";
    }

}

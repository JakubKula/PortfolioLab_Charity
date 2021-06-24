package pl.coderslab.charity.institution;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.donation.DonationRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/institution")
public class InstitutionController {
    private final InstitutionRepository institutionRepository;

    @RequestMapping("/all")
    public String all(Model model){
        model.addAttribute("institutions", institutionRepository.findAll());
        return "/institution/all";
    }
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("institution", new Institution());
        return "institution/add";
    }

    @PostMapping("/add")
    public String save(@Valid Institution institution, BindingResult result) {
        if(result.hasErrors()){
            return "institution/add";
        }
        institutionRepository.save(institution);
        return "redirect:/institution/all";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable long id){
        model.addAttribute("institution", institutionRepository.findById(id));
        return "institution/edit";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid Institution institution, BindingResult result) {
        if(result.hasErrors()){
            return "institution/edit";
        }
        institutionRepository.save(institution);
        return "redirect:/institution/all";
    }

    @GetMapping("/confirm")
    public String confirm(){
        return "institution/confirm";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable long id){
        institutionRepository.delete(institutionRepository.getOne(id));
        return "redirect:/institution/all";
    }
}

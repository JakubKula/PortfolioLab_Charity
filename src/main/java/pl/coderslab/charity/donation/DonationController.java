package pl.coderslab.charity.donation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/donation")
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @ModelAttribute("categories")
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("institution")
    public List<Institution> getAllInstitution() {
        return institutionRepository.findAll();
    }

    @GetMapping("/form1")
    public String form1Action(Model model, HttpSession session) {
        session.setAttribute("donation", new Donation());
        model.addAttribute("donation", new Donation());
        return "form/form1";
    }

    @RequestMapping(value = "/form1", method = RequestMethod.POST)
    public String form1Validation() {
//        if (result.hasErrors()) {
//            return "form/form1";
//        }
//        Donation donation1 = (Donation) session.getAttribute("donation");
//        List<String> categories = Collections.singletonList(request.getParameter("categories"));
//        List<Category> categoryList = null;
//        for(String str: categories){
//            Optional<Category> category = categoryRepository.findById(Long.valueOf((str)));
//            categoryList.add(category.get());
//        }
//        if(categoryList.size()==0){
//            result.rejectValue("categories", "error.user", "Kategoria nie została wybrana!");
//            return "form/form1";
//        }
//        donation1.setCategories(categoryList);
        return "form/form2";
    }

    @GetMapping("/form2")
    public String form2Action(Model model, HttpSession session) {
        model.addAttribute("donation", session.getAttribute("donation"));
        return "form/form2";
    }

    @PostMapping("/form2")
    public String form2Validation(@Valid Donation donation, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "form/form2";
        }
        Donation donation1 = (Donation) session.getAttribute("donation");
        donation1.setQuantity(donation.getQuantity());
        return "form/form3";
    }

    @GetMapping("/form3")
    public String form3Action(Model model, HttpSession session) {
        model.addAttribute("donation", session.getAttribute("donation"));
        return "form/form3";
    }

    @PostMapping("/form3")
    public String form3Validation(BindingResult result, HttpSession session, HttpServletRequest request) {
        if (result.hasErrors()) {
            return "form/form3";
        }
        Donation donation1 = (Donation) session.getAttribute("donation");
        String id = request.getParameter("organization");
        Institution institution = institutionRepository.getOne(Long.valueOf(id));
        donation1.setInstitution(institution);
        return "form/form4";
    }

    @GetMapping("/form4")
    public String form4Action(Model model, HttpSession session) {
        model.addAttribute("donation", session.getAttribute("donation"));
        return "form/form4";
    }

    @PostMapping("/form4")
    public String form4Validation(@Valid Donation donation, BindingResult result, HttpSession session, Model model) {
        if (result.hasErrors()) {
            return "form/form4";
        }
        Donation donation1 = (Donation) session.getAttribute("donation");
        donation1.setStreet(donation.getStreet());
        donation1.setCity(donation.getCity());
        donation1.setZipCode(donation.getZipCode());
        donation1.setNumber(donation.getNumber());
        donation1.setPickUpDate(donation.getPickUpDate());
        donation1.setPickUpTime(donation.getPickUpTime());
        donation1.setPickUpComment(donation.getPickUpComment());
        model.addAttribute("donation", session.getAttribute("donation"));
        return "form/form5";
    }

    @GetMapping("/form5")
    public String form5Action(Model model, HttpSession session) {
        Donation donation = (Donation) session.getAttribute("donation");
        model.addAttribute("donation", session.getAttribute("donation"));
        return "form/form5";
    }

    @PostMapping("/form5")
    public String form5Validation(HttpSession session) {
        donationRepository.save((Donation)session.getAttribute("donation"));
        return "form/form_confirmation";
    }
}

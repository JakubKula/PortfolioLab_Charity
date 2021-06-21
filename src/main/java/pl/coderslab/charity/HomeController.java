package pl.coderslab.charity;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.InstitutionRepository;

@RequiredArgsConstructor
@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;


    @RequestMapping("/")
    public String homeAction(Model model){
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("quantity", donationRepository.findAllQuantity());
        model.addAttribute("donationsAmount", donationRepository.findAll().size());
        return "index";
    }

    @RequestMapping("/admin")
    public String adminAction(){
        return "admin/adminLogin";
    }
}

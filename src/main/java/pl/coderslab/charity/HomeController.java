package pl.coderslab.charity;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Donation.DonationRepository;
import pl.coderslab.charity.Institution.Institution;
import pl.coderslab.charity.Institution.InstitutionRepository;

import java.util.List;

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
}

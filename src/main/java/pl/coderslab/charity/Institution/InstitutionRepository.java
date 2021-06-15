package pl.coderslab.charity.Institution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.Category.Category;

@Repository
public interface InstitutionRepository extends JpaRepository<Institution, Long> {
}

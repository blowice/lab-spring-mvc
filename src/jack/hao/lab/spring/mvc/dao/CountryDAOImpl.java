package jack.hao.lab.spring.mvc.dao;

import jack.hao.lab.spring.mvc.domain.Country;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 27/05/13
 * Time: 9:00 AM
 */

@Repository("countryDao")
@Transactional
public class CountryDAOImpl implements CountryDao {

    @Autowired
    private SessionFactory sessionfactory;


    @Override
    public List<Country> getCountry() {
        List<Country> countryList = sessionfactory.getCurrentSession()
                .createCriteria(Country.class).list();
        return countryList;
    }

    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }
}

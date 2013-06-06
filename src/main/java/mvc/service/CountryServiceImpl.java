package main.java.mvc.service;

import main.java.mvc.dao.CountryDao;
import main.java.mvc.domain.Country;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 27/05/13
 * Time: 9:05 AM
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CountryServiceImpl implements CountryService{
    @Autowired
    CountryDao countryDao;

    @Override
    public List<Country> getCountry() {
        return countryDao.getCountry();
    }

}

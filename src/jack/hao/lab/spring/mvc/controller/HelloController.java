package jack.hao.lab.spring.mvc.controller;

import jack.hao.lab.spring.mvc.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 25/05/13
 * Time: 10:47 PM
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/welcome.do")
public class HelloController {
    @Autowired
    private CountryService countryService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView displayCountryList(ModelMap model) {
        model.put("countryList", countryService.getCountry());
        return new ModelAndView("country_list", "model", model);
    }

}

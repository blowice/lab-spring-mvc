package mvc.controller;

import com.google.gson.*;
import mvc.domain.Country;
import mvc.service.CountryService;
import mvc.util.DataTablesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 25/05/13
 * Time: 10:47 PM
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class HelloController {
    @Autowired
    private CountryService countryService;

    @RequestMapping(value = "/fullCountryList.do", method = RequestMethod.GET)
    public ModelAndView displayFullCountryList(ModelMap model) {
        model.put("countryList", countryService.getCountry());
        return new ModelAndView("country_list", "model", model);
    }

    /*
    * direct to the server side fetching page
    * */
    @RequestMapping(value = "/gotoServerFetchingCountryList.do", method = RequestMethod.GET)
    public ModelAndView gotoServerFetchingCountryList(ModelMap model) {
        return new ModelAndView("server_fetching_country_list", "model", model);
    }

    /*
    * server side component to handle datatables server fetching ajax call
    * */
    @RequestMapping(value = "/serverFetchingCountryList.do", method = RequestMethod.GET)
    public
    @ResponseBody
    String serverFetchingCountryList(
            @RequestParam("iDisplayStart") Integer iDisplayStart,   // start from
            @RequestParam("iDisplayLength") Integer iDisplayLength, // number of entry
            @RequestParam("sEcho") String sEcho, // An integer value that is used by DataTables for synchronization purposes
            @RequestParam("iSortCol_0") Integer iSortCol_0, //The IDs of the columns used for ordering results
            @RequestParam("sSortDir_0") String sSortDir_0, //The sort direction for each of the columns used for ordering. If results are ordered by one column, an "asc" or "desc" value will be returned in the sSortDir_0 parameter
            @RequestParam("sSearch") String sSearch
    ) {
        System.out.println("++++++++++++++++++++++++++++++++++++++++++++===");
        System.out.println("iDisplayStart=" + iDisplayStart);
        System.out.println("iDisplayLength=" + iDisplayLength);

        List<Country> fullCountryList = countryService.getCountry();
        List<Country> filteredList = new ArrayList<Country>();
        // filter the result
        if (sSearch != null && !sSearch.isEmpty()) {
            for (Country c : fullCountryList) {
                if (DataTablesUtil.getValidStr(c.getCode()).toLowerCase().contains(sSearch.toLowerCase())
                        ||
                        DataTablesUtil.getValidStr(c.getDescription()).toLowerCase().contains(sSearch.toLowerCase())
                        ||
                        DataTablesUtil.getValidStr(c.getNationalityName()).toLowerCase().contains(sSearch.toLowerCase())) {
                    filteredList.add(c); // Add a company that matches search criterion
                }
            }
        } else {
            filteredList = fullCountryList;
        }


        //sort the result
        final int sortColumnIndex = iSortCol_0;
        final int sortDirection = sSortDir_0.equals("asc") ? -1 : 1;

        Collections.sort(filteredList, new Comparator<Country>() {
            @Override
            public int compare(Country c1, Country c2) {
                switch (sortColumnIndex) {
                    case 0:
                        if (c1.getId() != null && c2.getId() != null) {
                            return c1.getId().compareTo(c2.getId()) * sortDirection;
                        }

                    case 1:
                        if(c1.getCode()!=null&&c2.getCode()!=null){
                            return c1.getCode().compareTo(c2.getCode()) * sortDirection;
                        }

                    case 2:
                        if(c1.getDescription()!=null&&c2.getDescription()!=null){
                            return c1.getDescription().compareTo(c2.getDescription()) * sortDirection;
                        }

                    case 3:
                        if(c1.getNationalityName()!=null&&c2.getNationalityName()!=null){
                            return c1.getNationalityName().compareTo(c2.getNationalityName()) * sortDirection;
                        }
                }
                return 0;
            }
        });

        // pagination
        final int filteredListSize = filteredList.size();
        if (filteredListSize < iDisplayStart + iDisplayLength) {
            filteredList = filteredList.subList(iDisplayStart, filteredListSize);
        } else {
            filteredList = filteredList.subList(iDisplayStart, iDisplayStart + iDisplayLength);
        }

        // assemble entries into json string
        try {
            JsonObject jsonResponse = new JsonObject();

            jsonResponse.addProperty("sEcho", sEcho);
            jsonResponse.addProperty("iTotalRecords", fullCountryList.size());
            jsonResponse.addProperty("iTotalDisplayRecords", filteredListSize);

            JsonArray data = new JsonArray();
            for (Country c : filteredList) {
                JsonArray row = new JsonArray();
                row.add(new JsonPrimitive(c.getId()));
                row.add(new JsonPrimitive(DataTablesUtil.getValidStr(c.getCode())));
                row.add(new JsonPrimitive(DataTablesUtil.getValidStr(c.getDescription())));
                row.add(new JsonPrimitive(DataTablesUtil.getValidStr(c.getNationalityName())));
                data.add(row);
            }
            jsonResponse.add("aaData", data);
            System.out.println(data);
            return jsonResponse.toString();
        } catch (JsonIOException e) {
            e.printStackTrace();

        }

        return "";  //todo handle error
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login(ModelMap model) {

        return "login";

    }

    @RequestMapping(value = "/loginfailed.do", method = RequestMethod.GET)
    public String loginerror(ModelMap model) {

        model.addAttribute("error", "true");
        return "login";

    }

    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(ModelMap model) {

        return "login";

    }

    @RequestMapping(value = "/createPlayer.do", method = RequestMethod.GET)
    public String createUserGeneralInfo(Map model) {
        List<String> sexList = new ArrayList<String>(); // set the checkbox list
        sexList.add("男");
        sexList.add("女");

        model.put("sexList", sexList);
        model.put("sex", "男");  // by default the sex is male

        return "demo";

    }


}
